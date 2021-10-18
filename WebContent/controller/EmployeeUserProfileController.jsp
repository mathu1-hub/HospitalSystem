<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.List"%>
<%@page import="model.EmployeeModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>
<body>
<%
Connection con =Dbconnect.getConnection();
String email = (String) session.getAttribute("username");
String username;
String FName;
String LName;
String NIC;

String Address;
String Department;
String jdate;
String bdate;
String gender;
String em;
int id;
int Mobile;
PreparedStatement ps = con.prepareStatement("select * from employee where username=?");

ps.setString(1, email);
ResultSet rs = ps.executeQuery();



while(rs.next()){
	id=rs.getInt("EID");
	FName=rs.getString("FName");
	LName=rs.getString("LName");
	NIC=rs.getString("NIC");
	Mobile=rs.getInt("Mobile");
	Address=rs.getString("Address");
	Department=rs.getString("department");
	jdate=rs.getString("jdate");
	bdate=rs.getString("bdate");
	gender=rs.getString("gender");
	em=rs.getString("email");
	username = rs.getString("username");
	
		%>
		<tr>
		
		<td><%=FName %></td>
		
		<td><%=LName %></td>
		<td><%=NIC %></td>
		<td><%=Mobile %></td>
		<td><%=Address %></td>
		<td><%=Department %></td>
		<td><%=jdate %></td>
		<td><%=bdate %></td>
		<td><%=gender %></td>
		<td><%=em %></td>
		<td><%=username %></td>
		
		</tr>
	<%
	
	   }

%>        
		
</body>
</html>