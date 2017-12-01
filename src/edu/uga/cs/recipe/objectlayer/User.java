package edu.uga.cs.recipe.objectlayer;

public class User {

	private int id;
	private String fname;
	private String lname;
	private String username;
	private String password;
	private int numrecipes;
	
	public void setID(int uid) {
		id = uid;
	}
	
	public void setFname(String firstname) {
		fname = firstname;
	}
	
	public void setLname(String lastname) {
		lname = lastname;
	}
	
	public void setUsername(String name) {
		username = name;
	}
	
	public void setPassword(String pass) {
		password = pass;
	}

	public void setNumRecipes(int num) {
		numrecipes = num;
	}
	
	public int getID() {
		return id;
	}
	
	public String getFname() {
		return fname;
	}
	
	public String getLname() {
		return lname;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}

	public int getNumrecipes() {
		return numrecipes;
	}
	
}