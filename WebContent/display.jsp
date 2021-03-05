<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import ="java.util.*,java.io.*,java.sql.*,com.workspace.dao.*,
     com.workspace.bean.*" %>
<%
List<DisplayBean> list = (ArrayList<DisplayBean>)request.getAttribute("list");
%>

<table border="1px">
<tr>
<th>FirstName</th><th>LastName</th><th>Email</th><th>Password</th><th>Image</th>
</tr>
<%
for(int i=0; i<list.size();i++){
  DisplayBean bean = list.get(i);
  String firstName = bean.getFirstName();
  String lastName = bean.getLastName();
  String email = bean.getEmail();
  String password = bean.getPassword();
  
	%>
	<tr>
	<td><%= firstName %></td>
	<td><%= lastName %></td>
	<td><%= email %></td>
	<td><%= password %></td>
	<td><img src ="./ImageDownloader?email=<%=email%>" height="100" width="100" ></td>
	</tr> 
	<% 	  
}
%>
</table>
</body>
</html>