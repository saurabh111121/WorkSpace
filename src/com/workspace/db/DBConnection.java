package com.workspace.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection con = null;
    public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/workspace","root","Mic111121@/");
		}
		catch(Exception e) {
			e.printStackTrace();
		} 		
		return con;
	}


}
