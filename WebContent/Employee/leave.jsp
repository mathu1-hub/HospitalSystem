<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="DB.Dbconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave</title>
<jsp:include page="Employeeheader.jsp"></jsp:include>
<style>

  table{
  	 	 font-weight: 300;
	 	 line-height: 40px;
	  
		 margin: auto;
   		 width: 50%;
   		 border: 3px solid green;
   		 padding: 100px;
   
   
	 }

 td {
   
    text-align: left;
    padding: 8px;
  
}

input[type=submit],input[type=reset] {
    width: 45%;
    height: 60px;
    background-color: blue;
    color: white;
   	left:50px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  
}

input[type=text],input[type=email] select {
    width: 70%;
    height: 35px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="Employeebody.jsp"></jsp:include>
<%
					
					Connection con =Dbconnect.getConnection();
					String email = (String) session.getAttribute("username");
					String username;
					PreparedStatement ps = con.prepareStatement("select * from employee where username=?");

					ps.setString(1, email);
					ResultSet rs = ps.executeQuery();

					

					if (null == email) {
						response.sendRedirect("EmployeeLogin.jsp");
					}

					if (rs.next()) {
						username = rs.getString("username");
						
					} else {
						username = "";

						
					}
					
				%>
 <form action="../EmployeeLeaveServlet" method="POST"  >
	<table >
		<tbody>
			<tr>
				<td  >User Name</td>
				<td><input type="text"   name="email"  value="<%=username %>" /><br></td>
			</tr>						
			<tr>
				<td  >Description</td>
				<td><input type="text" name="description" id="Address" autocomplete="off" pattern="[a-zA-Z0-9]| |/|\\|@|#|\$|%|&)+" 
						oninvalid="this.setCustomValidity('Check address ')"  onchange="try{setCustomValidity('')}catch(e){}"
					     oninput="setCustomValidity(' ')"  checked required /><br></td>
			</tr>
			<tr>
				<td  >From Date</td>
				<td><input type="text" name="fdate" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select_date" /></td>
			</tr>
			<tr>
				<td > To Date</td>
				<td><input type="text" name="tdate" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select" /></td>
			</tr>
			<tr>
				<td> Status</td>
				<td><select name="status">
						<option value="Request">Request</option>
					</select></td>
				</tr>
			<tr>
				<td > </td>
				<td ><input type="submit" value="Apply"  name="Submit" > </td>
			</tr>
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