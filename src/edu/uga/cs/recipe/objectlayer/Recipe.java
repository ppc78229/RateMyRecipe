package edu.uga.cs.recipe.objectlayer;

public class Recipe {
	
	private int id;
	private String recipeName;
	private String recipeDescr;
	private int voteSum;
	private int numVotes;
	private int userID;
	private int catID;
	private String username; // username of recipe writer
	
	public void setID(int rid) {
		id = rid;
	}
	
	public void setRecipeName(String name) {
		recipeName = name;
	}
	
	public void setRecipeDescr(String descr) {
		recipeDescr = descr;
	}
	
	public void setVoteSum(int sum) {
		voteSum = sum;
	}
	
	public void setNumVotes(int votes) {
		numVotes = votes;
	}
	
	public void setUserID(int uid) {
		userID = uid;
	}
	
	public void setCatID(int cid) {
		catID = cid;
	}
	
	public void setUsername(String name) {
		username = name;
	}
	
	public int getID() {
		return id;
	}
	
	public String getRecipeName() {
		return recipeName;
	}
	
	public String getRecipeDescr() {
		return recipeDescr;
	}
	
	public int getVoteSum() {
		return voteSum;
	}
	
	public int getNumVotes() {
		return numVotes;
	}
	
	public int getUserID() {
		return userID;
	}
	
	public int getCatID() {
		return catID;
	}
	
	public String getUsername() {
		return username;
	}
	
}