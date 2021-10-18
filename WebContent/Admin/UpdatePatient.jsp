<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.Dbconnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.EmplayeeLeaveData"%>
<%@page import="model.patient"%>

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

input[type=text],input[type=email] {
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
	String pid=request.getParameter("id");



patient a = DataAccess.patientdata.getPatientById(pid);
%>
<form action="../UpdatePatientServlet" method="POST" enctype="multipart/form-data"  >
								<table >
									<tbody>
									<tr>
										<td>Patient ID</td>
										<td><input type="text" name="id" disabled="disabled"
												value="<%=a.getPid()%>" /></td>
									</tr>
									<tr>
										
										<td  >Patient Name</td>
										<td><input type="text" name="pname"  value="<%=a.getPname()%>"
												 /></td>
									</tr>
									<tr>
										
										<td  >Patient Description</td>
										<td><input type="text" name="pdescription" value="<%=a.getPdescription() %>"
												 /></td>
									</tr>
									<tr>
										<td  >Join Date</td>
										<td><input type="text" name="date" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select_date" value="<%=a.getDate()%>"/></td>
									</tr>
									<tr>
										<td> Employee</td>
										<td><select class="form-control" name="empname"  >
												<option value="<%=a.getEmpname()%>"> <%=a.getEmpname()%></option>
												<%
													try{
														Connection con=Dbconnect.getConnection();
													     Statement ps=con.createStatement();
													     ResultSet rs=ps.executeQuery("select username from employee");
													     while(rs.next()){
													    	 %>
													    	 	<option value="<%=rs.getString("username")%>"><%=rs.getString("username") %></option>
													    	 <%
													     }
														con.close();
														rs.close();
													}catch(Exception e){
														e.printStackTrace();
													}
												%>
											</select></td>
									</tr>
									<tr>
										<td  >Select Patient file</td>
									
											<td><input type="file" name="file" value="<%=a.getPath()%>"/><br>
											</td>
									</tr>
										<td > </td>
										<td ><input type="hidden" name="id" value="<%=a.getPid()%>" /> <input type="submit" value="Update"/> </td>
									</tr>
									</tbody>
								</table>
								</form>
<%

%>
 

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