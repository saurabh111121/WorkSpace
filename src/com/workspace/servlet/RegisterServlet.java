package com.workspace.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.workspace.bean.RegisterBean;
import com.workspace.dao.RegisterDao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String firstName = request.getParameter("fname");
	      String lastName = request.getParameter("lname");
	      String email = request.getParameter("email");
	      String password = request.getParameter("password");
	  
	      String message;
	      
	      RegisterBean data = new RegisterBean();
	      data.setFirstName(firstName);
	      data.setLastName(lastName);
	      data.setEmail(email);
	      data.setPassword(password);
	      
	      Boolean boolmsg = new RegisterDao().Insert(data);
	      if(boolmsg) {
	    	  message = "Record updated";
	      }
	      else {
	    	  message ="Failed";
	      }
	      response.getWriter().write(message); 
	    
	}

}
