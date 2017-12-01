package edu.uga.cs.recipe.objectlayer;

public class Step {
	
	private int recipeID;
	private int stepNum;
	private String step;
	
	public void setRecipeID(int id) {
		recipeID = id;
	}
	
	public void setStepNum(int num) {
		stepNum = num;
	}
	
	public void setStep(String instruction) {
		step = instruction;
	}
	
	public int getRecipeID() {
		return recipeID;
	}
	
	public int getStepNum() {
		return stepNum;
	}
	
	public String getStep() {
		return step;
	}
	
}