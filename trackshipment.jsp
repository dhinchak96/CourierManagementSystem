<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<title>Track Shipment here</title>
<style>
img{
margin:0px;
}
h3{
font-style:bold;
color:yellow;
}
p{
font-style:bold;
font-size:20px;
padding-left:50px;
margin-left:70px;
color:blue;
border:2 px solid black;
}
input{
border:2px solid black;
border-style:ridge;
}
</style>
</head>
<body>
<div class="container" style="background-color:powderblue; margin-top:5px;border:2px solid black;"><br>
<p align="right"><a href="index.jsp"><font size="3" color="green"><button><b>HOME</b></button></font></a></p>
<img src="images/chome.jpg" width="1145" height="250"><br>
<marquee direction="right"><img src="images/courier3.png" width=100></marquee><br><br>
<marquee> <h3 > Track Your Shipment Here (We Know Deleviery Value)</h3></marquee><br><br>
<form action="trackprocess.jsp" method="post">
<p align="justify">Enter Your Shipment Number <input type="text" name="shnumber" style="margin-left:150px;" required > &nbsp &nbsp &nbsp<input type="submit" value="Get Status" onclick="tStatus()"></p>
</form><br><br>
<%
try{
	String nav=session.getAttribute("nship").toString();
	%>
	<p align="center"><font size="3" color="red"><b><%out.print(nav);%></b></font></p>
	<% 
session.removeAttribute("nship");
}catch(Exception e){
	
}
%>
</div>
</body>
</html>