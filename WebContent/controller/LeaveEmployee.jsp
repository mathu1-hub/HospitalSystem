<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.EmplayeeLeaveData"%>
<%@page import="java.util.List"%>
<%@page import="model.EmployeeLeaveModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<%
List<EmployeeLeaveModel> list=DataAccess.EmplayeeLeaveData.employeeLeaveDisplay();

for(EmployeeLeaveModel e:list){
	%>
	<tr>
		
		<td> <%=e.getEmail() %> </td>
		
		<td> <%=e.getDescription()%> </td>
		<td> <%=e.getFdate()%> </td>
		<td> <%=e.getTdate()%> </td>
		<td> <%=e.getStatus()%> </td>
		
		<td></td>
		<td> </td>
		
		 <td><form method="POST" action="../Admin/UpdateEmployeeLeave.jsp">
					<input type="hidden" name="id"
						value="<%=e.getId()%>" /> <input type="submit"
						value="Edit" />
				</form></td>
		
		 <td><form method="POST" action="../DeleteLeaveServlet">
					<input type="hidden" name="id"
						value="<%=e.getId()%>" /> <input type="submit"
						value="Delete" />
				</form></td>
	</tr>		
	<%	
	   }

%>	              
		
</body>
</html>