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
<title>Update Employee </title>
<jsp:include page="Adminheader.jsp"></jsp:include>
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

input[type=text],input[type=email],input[type=password] select {
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
<jsp:include page="Adminbody.jsp"></jsp:include>
<%
int id=0;
String empid=request.getParameter("id");
 id=Integer.parseInt(empid);

EmployeeModel e = DataAccess.empdata.getEmployeeById(id);
if(id>0){
%>
<form action="../UpdateEmployeeServlet" method="POST"  >
								<table >
									<tbody>
									<tr>
										<td>Employee ID</td>
										<td><input type="text" name="id" disabled="disabled"
												value="<%=e.getEID()%>" /></td>
									</tr>
									<tr>
										
										<td  >First Name</td>
										<td><input type="text" 
												   name="FName"  id="FName" autocomplete="off" pattern='[A-Za-z\\s]*'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required  value="<%=e.getFName()%>"/><br>
											</td>
									</tr>
									<tr>
										<td  >Last Name</td>
									
													<td><input type="text" 
												   name="LName"  id="LName" autocomplete="off" pattern='[A-Za-z]+'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required value="<%=e.getLName()%>"/><br>
											</td>
									</tr>
									
									<tr>
										<td  >NIC Number</td>
										<td><input type="text" 
												   name="NIC"  id="NIC"  autocomplete="off" pattern='\d{9}[x|X|v|V]|\d{11}[x|X|v|V]' 
												   oninvalid="this.setCustomValidity('Check Correct NIC Number')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required value="<%=e.getNIC()%>"  /><br>
											</td>
									</tr>
									<tr>
										<td  >Phone Number</td>
										<td><input type="text" 
												   name="Mobile" id="Mobile" autocomplete="off" pattern="07[1,2,5,6,7,8][0-9]{7}" 
												   maxlength="10"  oninvalid="this.setCustomValidity('Check Correct Phone Number')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required value="<%=e.getMobile()%>"/><br>
											</td>
									</tr>
									<tr>
										<td  >Address</td>
										<td><input type="text" name="Address" id="Address" autocomplete="off" pattern="[a-zA-Z0-9]| |/|\\|@|#|\$|%|&)+" 
												    oninvalid="this.setCustomValidity('Check address ')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')"  checked required value="<%=e.getAddress()%>" /><br>
											</td>
									</tr>
									
									<tr>
										<td  >Department</td>
									
													<td><input type="text" 
												   name="department"  id="department" autocomplete="off" pattern='[A-Za-z]+'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required value="<%=e.getDepartment()%>"/><br>
											</td>
									</tr>
									
									<tr>
									
									<tr>
										<td  >Join Date</td>
										<td><input type="text" name="jdate" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select_date" value="<%=e.getJdate()%>"/></td>
									</tr>
									<tr>
										<td> Gender</td>
										<td><select name="gender">
												<option value="<%=e.getGender()%>"><%=e.getGender()%></option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
												
											</select></td>
									</tr>
									
									
									
									
									<tr>
										<td > </td>
										<td ><input type="hidden" name="id" value="<%=e.getEID()%>" /> <input type="submit" value="Update Employee"/> </td>
									</tr>
									</tbody>
								</table>
								</form>
<%
}
%>
 
<jsp:include page="Adminfooter.jsp"></jsp:include>
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