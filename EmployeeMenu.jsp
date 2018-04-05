<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%
String sessionid=session.getAttribute("brid").toString();
%>
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
#manager
{
display:none;
}
#branch{
display:none;
}
#employee{
display:none;
}
#shipment{
display:none;
}
#contact{
display:none;
}
   td,tr{
padding:5px;
border:3px solid black;
border-style:groove;
font-style:bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Menu</title>
<link rel="icon" href="images/Admin.png">
<link rel="stylesheet" href="Dropdown.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body style="background-color:powderblue;">
<div class="nav">
<ul>
<li><img src="images/courier4.jpg" width="100" height="50" style="padding:0px;"></li>
<li><a href="index.jsp">Home</a></li>
<li><a href="#">Users</a>
	<ul>
	<li><a href="#"><font size="2">Update Employee</font></a></li>
	</ul>
</li>
<li><a href="#">Courier</a>
		<ul>
		<li><a href="courier.jsp"><font size="2">Add Consignment</font></a></li>
		<li><a href="UpdateCourier.jsp"><font size="2">Update Consignment status</font></a></li>
		<li><a href="addShipment.jsp"><font size="2">Add Shipments</font></a>
		<li><a href="UpdateShipment.jsp"><font size="2">Update Shipment status</font></a>
		<li><a href="TrackConsign.jsp"><font size="2">Track ConsignMent Status</font></a>
	</ul>
</li>
<li><a href="#">List</a>
	 <ul>
		<li><button class="btn btn-primary" onclick="sList()"><font size="2"> List of Shipments</font></button></li>
		<li><button class="btn btn-primary" onclick="mList()"><font size="2"> List of Managers</font></button></li>
		<li><button class="btn btn-primary" onclick="bList()"><font size="2"> List of Branches</font></button></li>
		<li><button class="btn btn-primary" onclick="eList()"><font size="2"> List of Employees</font></button></li>
	</ul>
</li>
<li><a href="#">contact</a>
		<ul>
		<li><button class="btn btn-primary" onclick="cList()"><font size="2"> Contact List </font></button></li>
		</ul>
</li>
<li><a href="logout.jsp">Logout</a></li>
</ul>
</div>
<br><br><br><br>

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
	rs=st.executeQuery("select *from branch");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="2" bgcolor="powderblue" width="100%">
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
	<td><b><font size="3" color="red" ><%=rs.getString(i) %></font></b></td>
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



 <div id="employee">
 <center>
<table align="center" cellpadding="5" width="100%" >
<tr>
<% 
try{
	rs=st.executeQuery("select *from employees where emp_desg!='Admin' AND bid='"+sessionid+"'");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="1" bgcolor="powderblue" width="80%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># EMPLOYEES LIST #</b> </p></caption></p>
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
	<td><b><font size="3" color="red" ><%=rs.getString(i) %></font></b></td>
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
<table align="center" cellpadding="5" width="100%" >
<tr>
<% 
try{
rs=st.executeQuery("select distinct b_name,sh_id,sh_type,from_city,to_city,cust_name,cust_add,cust_state,cust_contact,rec_name,rec_add,rec_state,rec_contact from branch,courier,customer,shipments,employees where branch.b_id=courier.cbr_id AND courier.consig_id=shipments.sconsig_id AND customer.customer_id=shipments.scust_id AND employees.bid='"+sessionid+"'");
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
	<td><b><font size="3" color="red" ><%=rs.getString(i) %></font></b></td>
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
	<td><b><font size="3" color="red" ><%=rs.getString(i) %></font></b></td>
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


<script>
function mList() {
	var x=document.getElementById("manager");
	x.style.display="block";
	 var y=document.getElementById("branch");
	 var c=document.getElementById("employee");
	 var sh=document.getElementById("shipment");
	 y.style.display="none";
	 c.style.display="none";
	 sh.style.display="none";
}
 function bList()
 {
 var y=document.getElementById("branch");
	y.style.display="block";
	var x=document.getElementById("manager");
	 var c=document.getElementById("employee");
	 var sh=document.getElementById("shipment");
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
	 sh.style.display="none";
	 x.style.display="none";
	 c.style.display="none";	
 }
 function eList()
 { 
	 var c=document.getElementById("employee");
	c.style.display="block";
	var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var sh=document.getElementById("shipment");
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
	 sh.style.display="none";
	 x.style.display="none";
	 y.style.display="none";	

 }
 function sList(){
	 var sh=document.getElementById("shipment");
	 sh.style.display="block";
	 var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var z=document.getElementById("employee");
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
	 x.style.display="none";
	 y.style.display="none";
	 z.style.display="none";
 }
 function cList()
 {
	 var cn=document.getElementById("contact");
	 cn.style.display="block";
	 var sh=document.getElementById("shipment");
	 var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var z=document.getElementById("employee");
	 sh.style.display="none";
	 x.style.display="none";
	 y.style.display="none";
	 z.style.display="none";
 }
</script>
</body>
</html>