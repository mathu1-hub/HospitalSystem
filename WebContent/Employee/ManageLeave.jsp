<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Leave</title>
<jsp:include page="Employeeheader.jsp"></jsp:include>
<style>

table{
  	 	 margin: auto;
   		 width: 100%;
   		padding: 100px;
   
   
}

td {
   
    text-align: left;
    padding: 8px;
  color:black;
}


</style>
</head>
<body>
<jsp:include page="Employeebody.jsp"></jsp:include>





<form>
	<table>
		<thead>
			<tr style="color:black">
				
				<th>Email</th>
				<th>Description</th>
				<th>From Date</th>
				<th>To Date </th>
				<th>Status </th>
				
				
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<jsp:include page="../controller/LeaveManageController.jsp"></jsp:include>
		</tbody>
	</table>
</form>
		                  

</div>
</div>
</body>

</html>