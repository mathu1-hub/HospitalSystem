<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("user_session");
session.setAttribute("login_message", "Sign out Successfull");
%>
<script type="text/javascript">
window.location.href="http://localhost:8085/HospitalManagementSystem/";
</script>
</body>
</html>