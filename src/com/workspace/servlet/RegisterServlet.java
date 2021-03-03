package com.workspace.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.workspace.bean.RegisterBean;
import com.workspace.dao.RegisterDao;

@WebServlet("/RegisterServlet")

@MultipartConfig(maxFileSize = 16177215) 
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String firstName = request.getParameter("fname");
	      String lastName = request.getParameter("lname");
	      String email = request.getParameter("email");
	      String password = request.getParameter("password");
		  Part filePart = request.getPart("image");
		  
		  InputStream inputStream = null;
		  if(filePart != null) {
			  String imgData = " firstName: " + firstName + ", Size: " + filePart.getSize() + ", Content-Type: " + filePart.getContentType() ;
			  System.out.println(imgData);
			  inputStream = filePart.getInputStream();
		  }
	      String message;
	      
	      RegisterBean data = new RegisterBean();
	      data.setFirstName(firstName);
	      data.setLastName(lastName);
	      data.setEmail(email);
	      data.setPassword(password);
	      data.setImage(inputStream);
	      
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
