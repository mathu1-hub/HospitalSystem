<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.empdata"%>
<%@page import="java.util.List"%>
<%@page import="model.EmployeeModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Patient</title>
</head>
<body>
<%

Connection conn= Dbconnect.getConnection();

String sqlString = "SELECT * FROM patient";
Statement myStatement = conn.createStatement();
ResultSet rs=myStatement.executeQuery(sqlString);

if(!rs.isBeforeFirst())
{
    %>
        <tr>
        <td colspan="3"><center><%out.print("No Files!"); %></center></td>
        </tr>
    <%
}    

while(rs.next())
{   
%>
    <tr>
        <td><%=rs.getString("pid") %> </td>
        <td><%=rs.getString("pname") %></td>
          <td><%=rs.getString("pdescription") %></td>
            <td><%=rs.getString("date") %></td>
             <td><%=rs.getString("empname") %></td>
             
        <td><a href="../Admin/viewfile.jsp?id=<%=rs.getString("pid")%>">View</a></td>
        
        <td><form method="POST" action="../Admin/UpdatePatient.jsp">
					<input type="hidden" name="id"
						value="<%=rs.getString("pid")%>" /> <input type="submit"
						value="Edit" />
				</form></td>
		<td><form method="POST" action="DeletePatientServlet">
					<input type="hidden" name="id"
						value="<%=rs.getString("pid")%>"/> <input type="submit"
						value="Delete" />
				</form></td>
    </tr>
<%
}

%>	              
		
</body>
</html>