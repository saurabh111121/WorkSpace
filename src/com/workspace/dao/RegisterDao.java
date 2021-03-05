package com.workspace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.workspace.bean.RegisterBean;
import com.workspace.db.DBConnection;

public class RegisterDao {
	Connection con = null;
	PreparedStatement ps = null;  
	ResultSet rs = null;
	public Boolean Insert(RegisterBean data) {
		
	    String sql = "INSERT into register (firstName,lastName,email,password,image) Values(?,?,?,?,?) ";
	    int count; 
	    try {
	    	  con = new DBConnection().getConnection();
	    	  ps = con.prepareStatement(sql);
	    	  ps.setString(1, data.getFirstName());
	    	  ps.setString(2, data.getLastName());
	    	  ps.setString(3, data.getEmail());
	    	  ps.setString(4, data.getPassword());
	    	  if(data.getImage() != null) {
	    	     ps.setBlob(5, data.getImage());
	    	  }
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
	

	public String fetchData() throws SQLException {
		ArrayList<String> list = new ArrayList<String>();
		StringBuilder Data;
		StringBuilder sb = new StringBuilder();
		StringBuilder sbsuffix = new StringBuilder();
		sbsuffix = sbsuffix.append("}");
		sb = sb.append("{" + "\"data\"" + ":");
		String sql = "Select * from register";
	    
		try {
			 con = new DBConnection().getConnection();
			 Statement st = con.createStatement();	
		      rs = st.executeQuery(sql);
		     while(rs.next()) {
		            list.add(                			
		           "[" 	 
		            +"\""+rs.getString("firstName") +"\""+","											
		        	+"\""+rs.getString("lastName") +"\""+"," 
		        	+"\""+rs.getString("email") +"\""+"," 
		        	+"\""+rs.getString("password") +"\""
		        	+"]");
		          }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con = null;
		}
		Data = sb.append(list).append(sbsuffix);
		
		return Data.toString();	
	}  

   
}
