package com.workspace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


import com.workspace.bean.RegisterBean;
import com.workspace.db.DBConnection;

public class RegisterDao {

	public Boolean Insert(RegisterBean data) {
		Connection con = null;
	    String sql = "INSERT into register (firstName,lastName,email,password) Values(?,?,?,?) ";
	    int count; 
	    try {
	    	  con = new DBConnection().getConnection();
	    	  PreparedStatement ps = con.prepareStatement(sql);
	    	  ps.setString(1, data.getFirstName());
	    	  ps.setString(2, data.getLastName());
	    	  ps.setString(3, data.getEmail());
	    	  ps.setString(4, data.getPassword());
	    	  
	    	  count = ps.executeUpdate();
	    	  if(count > 0) {
	    		 return true;
	    	  }
	      }catch(Exception e ) {
	    	  e.printStackTrace();
	      }finally {
	    	  con = null;
	      }
		return false;
	}

}
