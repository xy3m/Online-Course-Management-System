package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;
	
	public static Connection getConn() {
		try {
			// Load the Driver you added to lib folder
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Connect to database "ocms" with user "root" and password "root"
			// CHANGE THE LAST "root" IF YOUR PASSWORD IS DIFFERENT!
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms","root","root");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}