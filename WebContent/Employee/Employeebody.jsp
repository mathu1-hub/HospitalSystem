<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="DB.Dbconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

<%
					Class.forName("com.mysql.jdbc.Driver");
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
 
 <div class="wrapper">
 	<div class="sidebar" data-color="blue">
 		<div class="sidebar-wrapper">
 			<div class="logo">
                <a href="#" class="simple-text pe-7s-home ">
				<b>	Employee</b>
                </a>
            </div>
             <ul class="nav">
                <li class="active">
                    <a href="dashboard.jsp">
                        <i class="pe-7s-graph"></i>
                         Dashboard
                      
                    </a>
                </li>
               
                <li>
                    <a href="leave.jsp">
                        <i class="pe-7s-add-user"></i>
                        Apply Leave
                    </a>
                </li>
              
            
                <li>
                    <a href="ManageLeave.jsp">
                        <i class="pe-7s-tools"></i>
                        Manage Leave
                    </a>
                </li>
               
            </ul>
            
 		</div>
 	</div>
 	 <div class="main-panel">
 	 	 <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
            
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"></a>
                </div>
                <div class="collapse navbar-collapse">
                  <ul class="nav navbar-nav navbar-right">
                        <li> <a >Welcome <%=username %></a></li>
                         <li><a href="../Employee/employeeUserProfile.jsp">Profile</a> </li>
                        <li><a href="../controller/logoutcontroller.jsp">Log Out</a></li>
				  </ul>
                </div>
            </div>
        </nav>
       
 	 	

</body>
</html>