<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD Consignment</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/js/bootstrap.min.js">
<link rel="icon" type="images/jpg.png" href="images/add.png" >
<style>
p{
margin-left:60px;
margin-top:10px;
margin-bottom:20px;
text-format:bold;
color: black;
font-size:15px;
}
form{
padding:10px 20px 10px 20px;}
input{
margin-left:300px;
text-align:justify;
border:3px solid black;
border-style:groove;
}
legend{
margin-left:50px;
color:rgb(50,192,100);
font-size:25px;
}
#p1{
margin-left:300px;
}
#add{
margin-left:250px;
}
</style>
</head>
<body>
<div class="container" style="background-color:white; border:3px solid black;">
<%
try{
	String msg=session.getAttribute("msg").toString();
	%>
	<h3 align="center" style="color:black;"><%out.print(msg);%></h3>
	<%
session.removeAttribute("msg");
}catch(Exception e){
	
}
%>
<h4 align="right"><a href="EmployeeMenu.jsp"><b>Back</b></a></h4>
<form action="courierprocess.jsp" method="post" onsubmit="return validation()">
<h2 align="center" style="border:2px solid green; color: black; padding-top:5px; padding-bottom:5px;"><b>Add Consignment Details</b></h2><br><br>
<fieldset>
<legend><b>Consignment Information :-   </b></legend>
<p align="justify">Consignment Id :-   <input type="text" name="cid" id="add" autocomplete="off" style="margin-left:230px;" required></p>
<p align ="justify">From City :-       <input type="text" name="cfcity" id="add" autocomplete="off" style="margin-left:270px;" required></p>
<p align ="justify">To city :-         <input type="text" name="ctocity" id="add" autocomplete="off"  style="margin-left:290px;" required></p>
</fieldset><hr>
<fieldset>
<p align="justify" style="margin-left:150px; margin-top:40px;"><input type="submit" value="Add Consignment" autocomplete="off" style="margin-left:200px;"required><input type="reset" value="RESET DETAILS" autocomplete="off"  style="margin-left:150px;" required> </p>
</form>

</div>
</body>
</html>