<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body background="images/loginpage.jpg"><br><br><br>
<div class="container" style="width:800px;height:400px;border:5px solid green;background-color:rgb(154,80,120); margin-left:170px;"><br><br>
<h2 align="center" style="color:black;font-size:20px;">Successfully Logout !!!!!!</h2><br><br>
<%
session.removeAttribute("brid");
%>
<p align="center"><a href="loginPage.jsp" style="color:black"><b>Click here to Login</b></a> &nbsp &nbsp &nbsp &nbsp<a href="index.jsp"><b>Go To Home</b></a></p>
<% 
%>
</div>
</body>
</html>