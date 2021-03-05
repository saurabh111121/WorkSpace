package com.workspace.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.workspace.dao.RegisterDao;

@WebServlet("/ImageDownloader")
public class ImageDownloader extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisterDao dao = null;
		ServletOutputStream outputStream = null;
		String email = request.getParameter("email");
		dao = new RegisterDao();
		byte[] image = dao.getImage(email);
		outputStream = response.getOutputStream();
		outputStream.write(image);
		outputStream.close();
	}
	

}
