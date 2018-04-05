<%@page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> Login</title>
<link rel="icon" type="image/jpg/png" href="images/Admin.png">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="slider.css">
</head>
<style>
h1{
border:3px solid black;
padding-bottom:15px;
}
</style>
<body>
<div class="container" style="border:3px solid black; background-color:light blue;" >
<h1 align="center" style="color:black;"><b>Manager Login And Password Recovery Area</b></h1>
<div class="row">
<div class="col-sm-5" style="background-color:red; margin-left:40px;opacity:10;">
<form action="login.jsp" method="post" name="myform">
<h3 align="center" style="color:black;"><b>ENTER LOGIN DETAILS</b></h3>
<hr>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-user"></span>
</div>
<input type="text" name="usname" placeholder="Please Enter User Name" class="form-control" style="width:300px;" autocomplete="off" required>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-user"></span>
</div>
<input type="password" name="pass" placeholder="**********" class="form-control" style="width:300px;" autocomplete="off" required>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-th-list"></span>
</div>
<select name="ustype" class="form-control" style="width:300px;" required>
<option value="Select User Type">Select User Type</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select distinct emp_desg from employees order by emp_desg");
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(1)%></option>
<% 	
}
}catch(Exception e){
	e.printStackTrace();
}
%>

</select>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-th-list"></span>
</div>
<select name="branchid" class="form-control" style="width:300px;">
<option value="0">Select Branch Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from branch order by b_id");
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(1)%></option>
<% 	
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</select>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-ok"></span>
</div>
<input type="submit" value="Login" onclick="return fun()" style="height:50px; width:75px; background-color:green;" autocomplete="off">
</div>
</div>
</form>
<%
try{
String inlog=session.getAttribute("brid").toString();
%>
<p align="center" style="color:blue;border:1px black;border-style:groove;"><b><%out.print(inlog);%></b>&nbsp &nbsp<a href="loginPage.jsp"><b>Try Again</b></a></p>
<% 
session.removeAttribute("brid");
}catch(Exception e){
	
}
%>
</div>
<div class="col-sm-5" style="background-color:black;margin-left:97px; height:348.4px;">
<h3 align="center" style="color:white;"><b>RESET PASSWORD</b></h3>
<hr>
<form action="search.jsp" method="post">
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-user"></span>
</div>
<input type="text" name="usname" placeholder="Please Enter User Name" class="form-control" style="width:300px;"  autocomplete="off"  required>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-user"></span>
</div>
<input type="text" name="branchid" placeholder="Please Enter Branch Id" class="form-control" style="width:300px;" autocomplete="off" required>
</div>
</div>



<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-th-list"></span>
</div>
<select  name="squesn" class="form-control" style="width:300px;" required>
<option value="select job profile">Select your Security  Question</option>
<option value="Whats your pet name ?">Whats your pet name ?</option>
<option value="Whats your best friend name ?">Whats your best friend name ?</option>
<option value="Whats your best childhood name ?">Whats your best childhood name ?</option>
</select><br>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-user"></span>
</div>
<input type="password" name="sans" placeholder="Enter your answer here"  class="form-control" style="width:300;" autocomplete="off" required>
</div>
</div>
<div class="form-group">
<div class="input-group">
<div class="input-group-addon">
<span class="glyphicon glyphicon-search"></span>
</div>
<input type="submit" value="Search"  class="form-control" style="width:75px; height:50px; ">
</div>
</div>
</form>
<%
try{
session.removeAttribute("msg");
}catch(Exception e){

}
%>
</div>
</div><br>
<img src="images/cour.jpg" width="1135px" height="300px">
<%@include file="footer.jsp" %>
<script type="text/javascript">
function fun(){
var pas=document.myform.pass.value;
if(pas.length<6){
		alert("Password Atleast 6 alphabets long");
		myform.pass.focus();
		return false;
}
if(myform.ustype.selectedIndex==0){
	alert("Please Select User type");
	myform.ustype.focus();
	return false;
}
if(myform.branchid.selectedIndex==0){
	alert("Please Select Branch Id");
	myform.branchid.focus();
	return false;
}
return true;
}
</script>
</body>
</html>