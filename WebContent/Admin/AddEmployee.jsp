<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Add</title>
<jsp:include page="Adminheader.jsp"></jsp:include>
<style>

  table{
  	 	 font-weight: 300;
	 	 line-height: 40px;
	  
		 margin: auto;
   		 width: 50%;
   		 border: 3px solid red;
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

input[type=text],input[type=email] ,input[type=password]  {
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
 <form action="../AddEmployeeServlet" method="POST"  >
								<table >
									<tbody>
									<tr>
										<td  >First Name</td>
										<td><input type="text" 
												   name="FName"  id="FName"  autocomplete="off" pattern='[A-Za-z\\s]*'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									<tr>
										<td  >Last Name</td>
									
													<td><input type="text" 
												   name="LName"  id="LName" autocomplete="off" pattern='[A-Za-z]+'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									
									<tr>
										<td  >NIC Number</td>
										<td><input type="text" 
												   name="NIC"  id="NIC"  autocomplete="off" pattern='\d{9}[x|X|v|V]|\d{11}[x|X|v|V]' 
												   oninvalid="this.setCustomValidity('Check Correct NIC Number')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required   /><br>
											</td>
									</tr>
									<tr>
										<td  >Phone Number</td>
										<td><input type="text" 
												   name="Mobile" id="Mobile" autocomplete="off" pattern="07[1,2,5,6,7,8][0-9]{7}" 
												   maxlength="10"  oninvalid="this.setCustomValidity('Check Correct Phone Number')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									<tr>
										<td  >Address</td>
										<td><input type="text" name="Address" id="Address" autocomplete="off" pattern="[a-zA-Z0-9]| |/|\\|@|#|\$|%|&)+" 
												    oninvalid="this.setCustomValidity('Check address ')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')"  checked required /><br>
											</td>
									</tr>
									
									<tr>
										<td  >Position</td>
									
													<td><input type="text" 
												   name="department"  id="department" autocomplete="off" pattern='[A-Za-z]+'
												   oninvalid="this.setCustomValidity('Only characters are allowed')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')" checked required /><br>
											</td>
									</tr>
									
									<tr>
									
									<tr>
										<td  >Join Date</td>
										<td><input type="text" name="jdate" data-date-format='yyyy-mm-dd' autocomplete="off"   id="select_date" /></td>
									</tr>
									
									<tr>
										<td> Gender</td>
										<td><select name="gender">
												<option value="0">Select</option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
												
											</select></td>
									</tr>
									
									<tr>
										<td  >Username</td>
									
													<td><input type="text" 
												   name="username"  id="email" autocomplete="off" pattern="[a-z0-9._%+-]{1,40}[@]{1}[a-z]{1,10}[.]{1}[a-z]{3}"
												   oninvalid="this.setCustomValidity('Incorrect')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')"  placeholder="valid@gmail.com" checked required /><br>
											</td>
									</tr>
									<tr>
										<td  >Password</td>
										<td><input type="password" name="password"  autocomplete="off" pattern="[a-zA-Z0-9]| |/|\\|@|#|\$|%|&)+" 
												    oninvalid="this.setCustomValidity('Check address ')"  
												   onchange="try{setCustomValidity('')}catch(e){}"
					     						   oninput="setCustomValidity(' ')"  checked required /><br>
											</td>
									</tr>
									<tr>
										<td > </td>
										<td ><input type="submit" value="Add Employee"  name="Submit" > </td>
									</tr>
									</tbody>
								</table>
								</form>
    <jsp:include page="Adminfooter.jsp"></jsp:include>

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