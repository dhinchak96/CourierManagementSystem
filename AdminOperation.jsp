<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%!
static Connection con;
static Statement st;
ResultSet rs;
ResultSetMetaData rsmd;
static {
	try{
		
		Class.forName("oracle.jdbc.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
		st=con.createStatement();
		
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
<% 
try{
//	String q="select emp_desg,emp_id,emp_name,gender,dob,age,email,emp_add,emp_city,emp_state,emp_contact,b_id,b_name  from employees,branch where branch.b_id in (select bid from employees where emp_desg='Manager')";
	
	rs=st.executeQuery("select *from employees where emp_desg='Manager' order by emp_id");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<html>
<head>
<style>
tr,td{
padding:5px;
}
#manager
{
display:none;
}
#branch{
display:none;
}
#shipment{
display:none;
}
#contact{
display:none;
}
#dform1{
display:none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Menu</title>
<link rel="icon" href="images/Admin.png">
<link rel="stylesheet" href="Dropdown.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body style="background-color:gray;">
<div class="nav">
<ul>
<li><img src="images/courier4.jpg" width="100" height="50" style="padding:0px;"></li>
<li><a href="index.jsp">Home</a></li>
<li><a href="#">Users</a>
	<ul>
	<li><a href="addE.jsp"><font size="2">Add User</font></a></li>
	<li><a href="#" onclick="dform()"><font size="2">Remove User</font></a></li>
	<li><a href="UpdateEmployeeHome.jsp"><font size="2">Update User</font></a></li>
	</ul>
</li>
<li><a href="#">Branches</a>
	<ul>
	<li><a href="addB.jsp"><font size="2">Add Branch</font></a></li>
	<li><a href="UpdateBranchHome.jsp"><font size="2"> Update Branch</font></a></li>
	</ul>
</li>
<li><a href="#">List</a>
	 <ul>
		<li><a href="#" onclick="sList()"><font size="2"> List of Shipments</font></a></li>
		<li><a href="#" onclick="mList()"><font size="2"> List of Managers</font></a></li>
		<li><a href="#" onclick="bList()"><font size="2"> List of Branches</font></a></li>
		<li><a href="employeelist.jsp" ><font size="2"> List of Employees</font></a></li>
	</ul>
</li>
<li><a href="#">Report</a>
	<ul>
		<li><a href="BranchWiseReport.jsp"><font size="2">BranchWise Report</font></a></li>
	<!-- <li><a href="#"><font size="2">Date Wise Report</font></a></li> -->
	</ul>
</li>
<li><a href="#">contact</a>
		<ul>
		<li><a href="#" onclick="cList()"><font size="2"> Contact List </font></a></li>
		</ul>
</li>
<li><a href="loginPage.jsp">Logout</a></li>
</ul>
</div><br><br><br><br>
<div id="manager">
<center>
<table border="2" bgcolor="powderblue" width="100%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b>ALL MANAGER LIST WORKING WITH DHINCHAK SOFT</b> </p></caption></p>
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="3" color="blue" ><%=rs.getString(i) %></font></b></td>
	<% 
}
%>

</tr>	
<%
}
%>
</table>
</center>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<hr>
</div>



 <div id="branch">
 <center>
<table align="center" cellpadding="5" width="100%" >
<tr>
<% 
try{
	rs=st.executeQuery("select *from branch order by b_id");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="2" bgcolor="powderblue" width="110%" cellspacing="5" cellpadding="5">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># DHINCHAK SOFT PVT LTD BRANCHES LIST #</b> </p></caption></p>
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="3" color="white" ><%=rs.getString(i) %></font></b></td>
	<% 
}
%>

</tr>	
<%
}
%>
</table>
</center>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<hr>

 </div>




 <div id="shipment">
 <center>
<table align="center" cellpadding="5" width="100%" cellspacing="5">
<tr>
<% 
try{
rs=st.executeQuery("select b_name,sh_id,sh_type,from_city,to_city,cust_name,cust_add,cust_state,cust_contact,rec_name,rec_add,rec_state,rec_contact from branch,courier,customer,shipments where branch.b_id=courier.cbr_id AND courier.consig_id=shipments.sconsig_id AND customer.customer_id=shipments.scust_id order by sh_id");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="1" bgcolor="powderblue" width="80%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># Shipment List of All Branches #</b> </p></caption></p>
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="3" color="white" align="center" ><%=rs.getString(i) %></font></b></td>
	<% 
}
%>

</tr>	
<%
}
%>
</table>
</center>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<hr>

 </div>

 <div id="contact">
 <center>
<table align="center" cellpadding="5" width="100%" >
<tr>
<% 
try{
rs=st.executeQuery("select b_name,b_timing,b_add,b_city,b_state,b_contact,b_pincode,emp_name as Manager,emp_contact as Contact from branch,employees  where branch.b_id=employees.bid AND employees.emp_desg='Manager' order by b_id");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="1" bgcolor="powderblue" width="80%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># All Branches Contact List #</b> </p></caption></p>
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="3" color="black" ><%=rs.getString(i) %></font></b></td>
	<% 
}
%>

</tr>	
<%
}
%>
</table>
</center>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<hr>

 </div>

<div id="dform1" class="container" style="border:2px solid green; background-color:white; width:800px; height:300px;">
<h3 align="center" style="color:blue;"><b>DELETE EMPLOYEE RECORD</b></h3><br><br>
<form action="deleteEmp.jsp" method="post">
<p align="justify" style="margin-left:100px;"><b>ENTER EMPLOYEE ID :- </b><input type="text" name="dempid" placeholder="Enter Employee Id" size =30 required style="margin-left:150px;border:2px solid black; border-style:groove;" ></p>   
<br>
<p align="center"><input  type="submit" value="Delete Record" style="margin-left:240px; color:blue;border:2px solid black;border-style:ridge;">&nbsp<input  type="reset" value="RESET" style="color:blue;border:2px solid black;border-style:ridge;" required></p>
</form>
<%
try{
	String msg=session.getAttribute("msg").toString();
	out.print(msg);
	session.removeAttribute("msg");
}catch(Exception e){
	
}
%>
</div>
<script>
function mList() {
	var x=document.getElementById("manager");
	x.style.display="block";
	 var y=document.getElementById("branch");
	 var sh=document.getElementById("shipment");
	 var f=document.getElementById("dform1");
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
	 f.style.display="none";
	 y.style.display="none";
	 sh.style.display="none";
}
 function bList()
 {
 var y=document.getElementById("branch");
	y.style.display="block";
	var x=document.getElementById("manager");
	 var sh=document.getElementById("shipment");
	 var cn=document.getElementById("contact");
	 var f=document.getElementById("dform1");
	 f.style.display="none";
	 cn.style.display="none";
	 sh.style.display="none";
	 x.style.display="none";
 }
 function sList(){
	 var sh=document.getElementById("shipment");
	 sh.style.display="block";
	 var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var cn=document.getElementById("contact");
	 var f=document.getElementById("dform1");
	 f.style.display="none";
	 cn.style.display="none";
	 x.style.display="none";
	 y.style.display="none";
 }
 function cList()
 {
	 var cn=document.getElementById("contact");
	 cn.style.display="block";
	 var sh=document.getElementById("shipment");
	 var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var f=document.getElementById("dform1");
	 f.style.display="none";
	 sh.style.display="none";
	 x.style.display="none";
	 y.style.display="none";
 }
 function dform()
 {
	 var f=document.getElementById("dform1");
	 f.style.display="block";
	 var y=document.getElementById("branch");
		y.style.display="none";
		var x=document.getElementById("manager");
		 var sh=document.getElementById("shipment");
		 var cn=document.getElementById("contact");
		 cn.style.display="none";
		 sh.style.display="none";
		 x.style.display="none";
 }
</script>
</body>
</html>