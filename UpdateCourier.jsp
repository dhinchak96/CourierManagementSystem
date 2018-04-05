<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<title>Shipment Update</title>
<style>
h3{
font-size:15px;
font-style:bold;
color:red;
}
p{
font-style:bold;
font-size:20px;
padding-left:50px;
margin-left:70px;
color:black;
border:2 px solid black;
}
input{
border:2px solid black;
border-style:groove;
}
#status{
display:none;
}
</style>
</head>
<body style="background-color:gray;">
<div class="container-fluid" style="background-color:powderblue;width:1200px;border:4px solid black;border-style:groove;">
<h4 align="right"><a href="EmployeeMenu.jsp"><b>Back</b></a></h4>
<marquee direction="right"><h2><img src="images/courier2.jpg" width=50 height=40>&nbsp &nbsp<font size="2" color="blue"><b>DHINCHAK SOFT PVT. LTD. (We Know Delievery Value.)</b></font>&nbsp &nbsp<img src="images/deliver.png" width=50 height=40></h2></marquee>
<img src="images/cour1.jpg" width=1150px height=400px>
<form action="UpdateCourierStatus.jsp" method="post"><br><br><br>
<p align="justify">Enter ConsginMent Number <input type="text" name="cid" style="margin-left:150px;" required > &nbsp &nbsp &nbsp<input type="submit" value="Get shipment"></p>
</form><br><br>
<% 
try{
	String nval=session.getAttribute("nconsig").toString();
	%>
	<h3 align="center"><%out.print(nval);%></h3>
	<% 
session.removeAttribute("nconsig");
	session.removeAttribute("msg");
}catch(Exception e){
}
%>
<% 
try{
	String val1=session.getAttribute("data").toString();
	%>
	<h3 align="center"><%out.print(val1);%></h3>
	<% 
session.removeAttribute("data");
}catch(Exception e){
}
%><br><br><br>
</div>
</body>
</html>