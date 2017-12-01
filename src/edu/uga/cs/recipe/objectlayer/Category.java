package edu.uga.cs.recipe.objectlayer;

public class Category {
	
	private int catID;
	private String category;
	
	public void setCatID(int id){
		catID = id;
	}
	
	public void setCategory(String cat) {
		category = cat;
	}
	
	public int getCatID() {
		return catID;
	}
	
	public String getCategory() {
		return category;
	}
	
}
