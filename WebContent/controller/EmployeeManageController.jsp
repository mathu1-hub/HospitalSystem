<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>Manage Employee</title>
</head>
<body>
<%
List<EmployeeModel> list=DataAccess.empdata.employeeDisplay();

for(EmployeeModel e:list){
	%>
	 <tr>
		<td> <%=e.getEID() %> </td>
		<td> <%=e.getFName() %> </td>
		<td> <%=e.getLName() %> </td>
		<td> <%=e.getNIC() %> </td>
		<td> <%=e.getMobile() %> </td>
		<td> <%=e.getAddress() %> </td>
		<td> <%=e.getDepartment() %> </td>
		<td> <%=e.getJdate() %> </td>	
		
		<td> <%=e.getGender() %> </td>
		<td> <%=e.getUsername()%> </td>
		
		<td><form method="POST" action="../Admin/UpdateEmployee.jsp">
					
				<input type="hidden" name="id" 
						value="<%=e.getEID()%>" /> <input type="submit"
						value="Edit" />
				</form></td>
		<td><form method="POST" action="../DeleteEmployeeServlet">
					<input type="hidden" name="id"
						value="<%=e.getEID()%>" /> <input type="submit"
						value="Delete" />
				</form></td>
	</tr>	
	<%	
	   }

%>	              
		
</body>
</html>