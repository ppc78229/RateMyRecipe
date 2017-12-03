package edu.uga.cs.recipe.persistlayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import edu.uga.cs.recipe.objectlayer.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.lang.StringBuilder;

public class PersistenceLayer {
	
	private DbAccess database;
	private Connection connection;
	
	/**
	 * Constructor
	 */
	public PersistenceLayer() {
		database = new DbAccess();
		connection = database.connect();
	}
	
	public void closeConnection() {
		try {
			connection.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// check if username is not already in use
	public boolean checkUsername(String uname) {
		PreparedStatement statement = null;
		String query = "SELECT COUNT(*) FROM User WHERE username = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, uname);;
			ResultSet rs = database.retrieve(connection, statement);
			int count = 0;
			while(rs.next()) {
				count = rs.getInt(1);
				break;
			}
			if(count > 0) return false;
			else return true;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// gets hashed and salted password string
	private String saltAndHash(String uname, String pword) {
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			String passWithSalt = pword + uname;
			byte[] passBytes = passWithSalt.getBytes();
			byte[] passHash = md.digest(passBytes);
			StringBuilder sb = new StringBuilder();
			for(int i = 0; i < passHash.length; i++) {
				sb.append(Integer.toString((passHash[i] & 0xff) + 0x100, 16).substring(1)); 
			}
			String result = sb.toString();
			System.out.println(result);
			return result;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// adds new user after registration
	public void addUser(String fname, String lname, String uname, String pword) {
		PreparedStatement statement = null;
		String query = "INSERT INTO User (first_name, last_name, username, password, num_recipes) VALUES (?, ?, ?, ?, 0)";
		String hashedPass = saltAndHash(uname, pword);
		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, fname);
			statement.setString(2, lname);
			statement.setString(3, uname);
			statement.setString(4, hashedPass);
			database.insert(connection, statement);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// verify password (True if password accepted, False if incorrect)
	public boolean checkPassword(String uname, String pword) {
		PreparedStatement statement = null;
		String query = "SELECT password FROM User WHERE username = ?";
		String hashedPass = saltAndHash(uname, pword);
		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, uname);
			ResultSet rs = database.retrieve(connection, statement);
			String password = "";
			while(rs.next()) {
				password = rs.getString(1);
			}
			if(hashedPass.equals(password)) return true;
			else return false;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// get user info by username
	public User getUser(String uname) {
		PreparedStatement statement = null;
		String query = "SELECT * FROM User WHERE username = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, uname);
			ResultSet rs = database.retrieve(connection, statement);
			User user = new User();
			while(rs.next()) {
				user.setID(rs.getInt(1));
				user.setFname(rs.getString(2));
				user.setLname(rs.getString(3));
				user.setUsername(rs.getString(4));
				user.setNumRecipes(rs.getInt(6));
			}
			return user;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// get user info by user ID
	public User getUser(int id) {
		PreparedStatement statement = null;
		String query = "SELECT id, first_name, last_name, username, num_recipes FROM User WHERE id = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet rs = database.retrieve(connection, statement);
			User user = new User();
			while(rs.next()) {
				user.setID(rs.getInt(1));
				user.setFname(rs.getString(2));
				user.setLname(rs.getString(3));
				user.setUsername(rs.getString(4));
				user.setNumRecipes(rs.getInt(5));
			}
			return user;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// adds new recipe, returns recipeID
	public int addRecipe(String recipeName, String recipeDescr, int userID, int catID) {
		PreparedStatement statement = null;
		String query = "INSERT INTO Recipe (recipe_name, recipe_description, user_id, category_id, vote_sum, num_votes) VALUES (?, ?, ?, ?, 0, 0)";
		try {
			statement = connection.prepareStatement(query);
			statement.setString(1, recipeName);
			statement.setString(2, recipeDescr);
			statement.setInt(3, userID);
			statement.setInt(4, catID);
			database.insert(connection, statement);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		query = "UPDATE User SET num_recipes = num_recipes + 1 WHERE id = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, userID);
			database.insert(connection, statement);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		query = "SELECT LAST_INSERT_ID()";
		try {
			statement = connection.prepareStatement(query);
			ResultSet rs = database.retrieve(connection, statement);
			int recipeID = 0;
			while(rs.next()) {
				recipeID = rs.getInt(1);
			}
			return recipeID;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// add steps of a recipe
	public void addSteps(List<String> steps, int recipeID) {
		PreparedStatement statement = null;
		int i = 0;
		for(String step : steps) {
			String query = "INSERT INTO Steps (recipe_id, step_num, step_instruction) VALUES (?, ?, ?)";
			try {
				statement = connection.prepareStatement(query);
				statement.setInt(1, recipeID);
				statement.setInt(2, i + 1);
				statement.setString(3, step);
				i++;
				database.insert(connection, statement);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// check if user already voted on a recipe (False if already voted)
	public boolean checkVote(int userID, int recipeID) {
		PreparedStatement statement = null;
		String query = "SELECT COUNT(*) FROM Vote WHERE user_id = ? AND recipe_id = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, userID);
			statement.setInt(2, recipeID);
			ResultSet rs = database.retrieve(connection, statement);
			int count = 0;
			while(rs.next()) {
				count = rs.getInt(1);
			}
			if(count > 0) return false;
			else return true;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// update vote and recipe when a user votes
	public void addVote(int userID, int recipeID, int vote) {
		// update Vote table
		PreparedStatement statement = null;
		String query = "INSERT INTO Vote (user_id, recipe_id, vote) VALUES (?, ?, ?)";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, userID);
			statement.setInt(2, recipeID);
			statement.setInt(3, vote);
			database.insert(connection, statement);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		// update recipe stats
		if(vote > 0) {
			query = "UPDATE Recipe SET vote_sum = vote_sum + 1, num_votes = num_votes + 1 WHERE id = ?";
		} else {
			query = "UPDATE Recipe SET vote_sum = vote_sum - 1, num_votes = num_votes + 1 WHERE id = ?";
		}
		
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, recipeID);
			database.insert(connection, statement);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// returns all recipes of given category
	public List<Recipe> getRecipesByCat(int categoryID) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		PreparedStatement statement = null;
		String query = "SELECT r.*, u.username FROM recipe r, user u WHERE r.category_id = ? AND r.user_id = u.id ORDER BY r.vote_sum DESC";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, categoryID);
			ResultSet rs = database.retrieve(connection, statement);
			while(rs.next()) {
				Recipe rec = new Recipe();
				rec.setID(rs.getInt(1));
				rec.setRecipeName(rs.getString(2));
				rec.setRecipeDescr(rs.getString(3));
				rec.setVoteSum(rs.getInt(4));
				rec.setNumVotes(rs.getInt(5));
				rec.setUserID(rs.getInt(6));
				rec.setCatID(rs.getInt(7));
				rec.setUsername(rs.getString(8));
				recipes.add(rec);
			}
			return recipes;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// returns all recipes written by given user
	public List<Recipe> getRecipesByUser(int userID) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		PreparedStatement statement = null;
		String query = "SELECT * FROM Recipe WHERE user_id = ?";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, userID);
			ResultSet rs = database.retrieve(connection, statement);
			while(rs.next()) {
				Recipe rec = new Recipe();
				rec.setID(rs.getInt(1));
				rec.setRecipeName(rs.getString(2));
				rec.setRecipeDescr(rs.getString(3));
				rec.setVoteSum(rs.getInt(4));
				rec.setNumVotes(rs.getInt(5));
				rec.setUserID(rs.getInt(6));
				rec.setCatID(rs.getInt(7));
				recipes.add(rec);
			}
			return recipes;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// returns a recipe by given recipe id
	public Recipe getRecipe(int recipeID) {
		Recipe rec = new Recipe();
		PreparedStatement statement = null;
		String query = "SELECT r.*, u.username FROM recipe r, user u WHERE r.id = ? AND r.user_id = u.id";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, recipeID);
			ResultSet rs = database.retrieve(connection, statement);
			while(rs.next()) {
				rec = new Recipe();
				rec.setID(rs.getInt(1));
				rec.setRecipeName(rs.getString(2));
				rec.setRecipeDescr(rs.getString(3));
				rec.setVoteSum(rs.getInt(4));
				rec.setNumVotes(rs.getInt(5));
				rec.setUserID(rs.getInt(6));
				rec.setCatID(rs.getInt(7));
				rec.setUsername(rs.getString(8));
			}
			return rec;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// returns steps of a recipe
	public List<Step> getSteps(int recipeID) {
		List<Step> steps = new ArrayList<Step>();
		PreparedStatement statement = null;
		String query = "SELECT * FROM Steps WHERE recipe_id = ? ORDER BY step_num ASC";
		try {
			statement = connection.prepareStatement(query);
			statement.setInt(1, recipeID);
			ResultSet rs = database.retrieve(connection, statement);
			while(rs.next()) {
				Step step = new Step();
				step.setRecipeID(rs.getInt(1));
				step.setStepNum(rs.getInt(2));
				step.setStep(rs.getString(3));
				steps.add(step);
			}
			return steps;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// get all categories
	public List<Category> getCategories() {
		List<Category> cats = new ArrayList<Category>();
		PreparedStatement statement = null;
		String query = "SELECT * FROM Category";
		try {
			statement = connection.prepareStatement(query);
			ResultSet rs = database.retrieve(connection, statement);
			while(rs.next()) {
				Category cat = new Category();
				cat.setCatID(rs.getInt(1));
				cat.setCategory(rs.getString(2));
				cats.add(cat);
			}
			return cats;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
