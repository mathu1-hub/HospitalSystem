<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.salarydata"%>
<%@page import="java.util.List"%>
<%@page import="model.SalaryModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<%
List<SalaryModel> list=DataAccess.salarydata.salaryDisplay();

for(SalaryModel e:list){
	%>
	<tr>
		<td> <%=e.getSid()%></td>
		<td> <%=e.getUsername() %> </td>
		
		<td> <%=e.getBsalary()%> </td>
		<td> <%=e.getOthour()%> </td>
		<td> <%=e.getOtAmount()%> </td>
		<td> <%=e.getEtf()%> </td>
		<td> <%=e.getEpf()%> </td>
		<td> <%=e.getNetamount()%> </td>
		<td> <%=e.getSdate()%> </td>
		<td></td>
		<td> </td>
		
		 
		 <td><form method="POST" action="../Admin/UpdateSalary.jsp">
					<input type="hidden" name="id"
						value="<%=e.getSid()%>" /> <input type="submit"
						value="Edit" />
				</form></td>
		<td><form method="POST" action="../DeleteSalaryServlet">
					<input type="hidden" name="id"
						value="<%=e.getSid()%>" /> <input type="submit"
						value="Delete" />
				</form></td>
		
		
	</tr>			
	<%	
	   }

%>	              
		
</body>
</html>