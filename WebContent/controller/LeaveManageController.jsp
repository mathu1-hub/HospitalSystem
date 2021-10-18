<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.List"%>
<%@page import="model.EmployeeLeaveModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Leave</title>
</head>
<body>
<%
Connection con =Dbconnect.getConnection();
String email = (String) session.getAttribute("username");
String username;
String des;
String fdate;
String tdate;
String status;
PreparedStatement ps = con.prepareStatement("select * from employeeleave where email=?");

ps.setString(1, email);
ResultSet rs = ps.executeQuery();



while(rs.next()){
	username = rs.getString("email");
	des=rs.getString("description");
	fdate=rs.getString("fdate");
	tdate=rs.getString("tdate");
	status=rs.getString("status");
	//out.print("<b><span style='color:white;'>&nbsp;&nbsp;Hi&nbsp;  " + username + "</span></b>");
	%>
		<tr>
		<td><%=username %></td>
		<td><%=des %></td>
		<td><%=fdate %></td>
		<td><%=tdate %></td>
		<td><%=status %></td>
		</tr>
	<%
	
	   }

%>        
		
</body>
</html>