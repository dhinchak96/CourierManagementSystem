<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>

</head>
<style>
input{
color:blue;
border:2px solid black;
border-style:groove;
}
p{
color:green;
margin-left:160px;
font-style:bold;
font-size:18px;
}
</style>
<body style="background-color:gray;"><br><br>
<h2 align="center">RESET PASSWORD</h2>
<div class="container" style="width:800px;height:400px;background-color:powderblue;border:3px solid black;margin-left:200px;"><br><br>
<br><br><br>
<form action="resetProcess.jsp" method="post" name="pform">
<p align="justify">Enter New Password   :- <input type="password" placeholder="New Password" name="pswd" id="pass" size=30 style="margin-left:100px;" required autocomplete="off"></p>
<p align="justify">Confirm New Password :- <input type="password" placeholder="Confirm Password" size=30 id="cpass" style="margin-left:80px;" autocomplete="off" srequired></p>
<p align="justify" style="margin-left:450px;"><input type="submit" onclick="return fuck()" value="Reset Password">&nbsp<input type="reset" value="Clear Password"></p>
<%
try{
	String val=session.getAttribute("res").toString();
	%>
	<h3 align="center" style="color:green;"><%out.print(val);%></h3>
	<p align="right"><a href="loginPage.jsp"><b>Click Here To Login</b></a>
	<% 
	
	session.removeAttribute("res");
	}catch(Exception e){
		
	}
%>
</div>
</body>
<script type="text/javascript">
function fuck()
{
	var pass=document.pform.pass.value;
	var cpass=document.pform.cpass.value;
if(pass!=cpass){
		alert("Password Does Not Match With Confirm Password");
		return false;
}
}
</script>
</html>