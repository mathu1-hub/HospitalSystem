<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.EmplayeeLeaveData"%>
<%@page import="model.EmployeeLeaveModel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Leave </title>
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
<jsp:include page="Adminbody.jsp"></jsp:include>
<%

String empid=request.getParameter("id");
int id=Integer.parseInt(empid);


EmployeeLeaveModel a = DataAccess.EmplayeeLeaveData.getEmpLeaveById(id);

%>
<form action="../UpdateLeaveServlet" method="POST"  >
								<table >
									<tbody>
									<tr>
										<td>Employee ID</td>
										<td><input type="text" name="id" disabled="disabled"
												value="<%=a.getId()%>" /></td>
									</tr>
									<tr>
										
										<td  >Email</td>
										<td><input type="text" name="email" readonly="readonly" value="<%=a.getEmail() %>"
												 /></td>
									</tr>
									<tr>
										
										<td  >Description</td>
										<td><input type="text" name="description" readonly="readonly" value="<%=a.getDescription() %>"
												 /></td>
									</tr>
									<tr>
										
										<td  >From date</td>
										<td><input type="text" name="fdate" readonly="readonly" value="<%=a.getFdate() %>"
												 /></td>
									</tr>
									
										<tr>
										
										<td  >To date</td>
										<td><input type="text" name="tdate" readonly="readonly" value="<%=a.getTdate() %>" /></td>
									</tr>
									<tr>
										<td> Status</td>
										<td><select name="status">
												<option value="<%=a.getStatus()%>"><%=a.getStatus()%></option>
												<option value="Pending">Pending</option>
												<option value="Approved">Approved</option>
												<option value="Rejected">Rejected</option>
											</select></td>
										</tr>
														
									<tr>
										<td > </td>
										<td ><input type="hidden" name="id" value="<%=a.getId()%>" /> <input type="submit" value="Update"/> </td>
									</tr>
									</tbody>
								</table>
								</form>
<%

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