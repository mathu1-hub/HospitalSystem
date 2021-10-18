<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>
<style>
body{background-color:white;
background-image: url("images/img.jpg");
}
h1{padding:0px 43%}
  table{
  	 	 font-weight: 300;
	 	 line-height: 40px;
	  
		 margin: auto;
   		 width: 50%;
   		 
   		 padding: 100px;
   
   
	 }

 td {
   
    text-align: left;
    padding: 8px;
  
}

input[type=submit]{
    width: 45%;
    height: 60px;
    background-color: blue;
    color: white;
   	left:50px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  
}

input[type=text],input[type=password]  {
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

<h1>LOGIN</h1>
 <form action="controller/logincontroller.jsp" method="POST"  >
 	
	<table >
		
		<tbody>
		
			<tr>
				<td><a href="Employee/EmployeeLogin.jsp"><b>User Login</b></a></td>
				
			
			</tr>
			<tr>
				<td><a href="Admin/AdminLogin.jsp"><b>Admin Login</b></a></td>
									
				
			</tr>
									
									
			
		</tbody>
	</table>
</form>

</body>
</html>