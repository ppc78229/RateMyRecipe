package edu.uga.cs.recipe.persistlayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbAccess {
	
	static final String DRIVE_NAME = "com.mysql.jdbc.Driver";
	static final String CONNECTION_URL = "jdbc:mysql://localhost:3306/recipe?useSSL=false";
	static final String DB_CONNECTION_USERNAME = "root"; // set to your MySQL user
	static final String DB_CONNECTION_PASSWORD = "root"; // set to password for your user
	
	/**
	 * Opens a new connection to the database.
	 * 
	 * @return the connection object
	 */
	public Connection connect() {
		Connection con = null;
		try {
			Class.forName(DRIVE_NAME);
			con = DriverManager.getConnection(CONNECTION_URL, DB_CONNECTION_USERNAME, DB_CONNECTION_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	} // connect
	
	/**
	 * Executes a retrieve based SQL query such as SELECT.
	 * Query must be in the form of a PreparedStatement
	 * 
	 * @param connection	database connection object
	 * @param query			query to be executed
	 * @return				ResultSet containing results of query
	 */
	public ResultSet retrieve(Connection connection, PreparedStatement query) {
		ResultSet results = null;
		try {
			results = query.executeQuery();
			return results;
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		
		return results;
	} // retrieve
	
	/**
	 * Executes an insert based SQL query such as INSERT INTO.
	 * Query must be in the form of a PreparedStatement.
	 * 
	 * @param connection	database connection object
	 * @param query			query to be executed
	 * @return				number of rows affected
	 */
	public int insert(Connection connection, PreparedStatement query) {
		int rowsAffected = 0;
		try {
			rowsAffected = query.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		return rowsAffected;
	} // insert
	
	/**
	 * Executes an update based SQL query such as UPDATE.
	 * Query must be in the form of a PreparedStatment.
	 * 
	 * @param connection	database connection object
	 * @param query			query to be executed
	 * @return				number of rows affected
	 */
	public int update(Connection connection, PreparedStatement query) {
		int rowsAffected = 0;
		try {
			rowsAffected = query.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rowsAffected;
	} // update
	
	/**
	 * Executes a delete based SQL query such as DELETE.
	 * Query must be in the form of a PreparedStatement.
	 * 
	 * @param connection	database connection object
	 * @param query			query to be executed
	 * @return				number of rows affected
	 */
	public int delete(Connection connection, PreparedStatement query) {
		int rowsAffected = 0;
		try {
			rowsAffected = query.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return rowsAffected;
	} // delete
	
}
