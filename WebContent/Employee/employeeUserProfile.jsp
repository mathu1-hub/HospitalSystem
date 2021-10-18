<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.empdata"%>
<%@page import="model.EmployeeModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile </title>
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
			
				<th>FName</th>
				
				<th>LName</th>
				<th>NIC</th>
				<th>Mobile</th>
				<th>Address </th>
				<th>Position</th>
				<th>jdate</th>
				<th>bdate</th>
				<th>gender</th>
				<th>Email</th>
				<th>username</th>
				
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<jsp:include page="../controller/EmployeeUserProfileController.jsp"></jsp:include>
		</tbody>
	</table>
</form>
</div>
</div>

</body>
<script src="../font/script/jquery-1.12.4.js"></script>
<script src="../font/script/jquery-ui.js"></script>

<script type="text/javascript">

	 $(function(){
	        $("#select_date").datepicker({ dateFormat: 'yy-mm-dd',
				todayHighlight:true,
				showOtherMonths:true,
				
				selectOtherMonth:true,
				autoclose:true,
				changeMonth:true,
				changeYear:true,
				 });
	      
	    });


	 $(function(){
	        $("#select").datepicker({ dateFormat: 'yy-mm-dd',
				todayHighlight:true,
				showOtherMonths:true,
				
				selectOtherMonth:true,
				autoclose:true,
				changeMonth:true,
				changeYear:true,
				 });
	      
	    });
</script>


</html>