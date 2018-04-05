<%@page import="java.sql.*"%>
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
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Menu</title>
<link rel="icon" href="images/cour2.jpg">
<link rel="stylesheet" href="Dropdown.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<style>
tr,td{
padding:5px;
}
tr,td{
color:black;
}
#customer{
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
#dform1{
display:none;
}
</style>
</head>
<body style="background-color:powderblue;">
<%
String sessionid=session.getAttribute("brid").toString();
%>
<div class="nav">
<ul>
<li><img src="images/courier4.jpg" width="100" height="50"></li>
<li><a href="index.jsp">Home</a></li>
<li><a href="#">Employees</a>
		<ul>
		<li><a href="addE.jsp"><font size="2">Add Employee</font></a></li>
		<li><a href="#" onclick="dform()"><font size="2">Remove Employee</font></a></li>
		<li><a href="#"><font size="2">Update Employee</font></a>
		</ul>
</li>
<li><a href="#">List</a>
	 <ul>
		<li> <a href="#"><font size="2">List of Shipments</font></a></li>
		<li><a href="#" onclick="bList()"><font size="2">List of Branches</font></a></li>
		<li><a href="#" onclick="eList()"><font size="2">List of Employees</font></a> </li>
		<li><a href="#" onclick="custList()"><font size="2">List of Customer</font></a></li>
	</ul>
</li>
<li><a href="#">Report</a>
	 <ul>
		<li> <a href="ConsignMentReport.jsp"><font size="2">ConsignMent Report</font> </a></li>
		<li><a href="ShipmentReport.jsp"><font size="2"> Shipments Report</font> </a></li>
		<li><a href="CustomerReport.jsp"><font size="2"> Customer Report</font> </a> </li>
		<li><a href="#"><font size="2">Billing Report</font></a></li>
	</ul>
</li>
<li><a href="#">Contact</a>
		<ul>
		<li><a href="#" onclick="cList()"><font size="2">Contact</font></a></li>
		</ul>
	</li>
<li><a href="logout.jsp">Logout</a></li>
</ul>
</div>


<div id="customer">
<br><br>
<% 
try{
rs=st.executeQuery("select  cust_name as Customer,cust_add,cust_city,sh_id as ShipmentID,rec_name,rec_add,rec_contact,b_name from customer,shipments,branch where customer.br_id=branch.b_id AND customer.customer_id=shipments.scust_id AND branch.b_id='"+sessionid+"'");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="2" bgcolor="powderblue" width="100%" cellspacing="5" cellpadding="5">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># Customer List Who Booked Shipments  #</b> </p></caption></p>
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
	<td><b><font size="3" color="blue" align="center" ><%=rs.getString(i) %></font></b></td>
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
<table align="center" border="2" cellpadding="5" width="120%" cellspacing="5" >
<tr>
<% 
try{
	rs=st.executeQuery("select *from branch");
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




<div id="employee">
<center>
<table align="center" cellpadding="5" width="120%" cellspacing="5" >
<tr>
<% 
try{
	rs=st.executeQuery("select *from employees where emp_desg!='Admin' AND bid='"+sessionid+"'");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<center>
<table border="1" bgcolor="powderblue" width="120%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># EMPLOYEES LIST WORKING WITH DHINCHAK SOFT PVT LTD. #</b> </p></caption></p>
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

<br><br><br>
<div id="dform1" class="container" style="border:2px solid green; background-color:white; width:900px; height:400px;">
<h3 align="center" style="color:blue;"><b>DELETE EMPLOYEE RECORD</b></h3><br><br><br><br>
<form action="deleteEmp.jsp" method="post">
<p align="justify" style="margin-left:100px;"><b>ENTER EMPLOYEE ID :- </b><input type="text" name="dempid" placeholder="Enter Employee Id" size =30 required style="margin-left:150px;border:2px solid black; border-style:groove;" ></p>   
<br>
<p align="center"><input  type="submit" value="DELETE RECORD" style="margin-left:180px; color:blue;border:2px solid black;border-style:ridge;">&nbsp &nbsp<input  type="reset" value="RESET" style="color:blue;border:2px solid black;border-style:ridge;" required></p>
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



<div id="contact">
 <center>
<table align="center" border="2" cellpadding="5" width="120%" >
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
	<td><font size="3" color="blue" ><%=rs.getString(i) %></font></td>
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
function custList()
{
	var cust=document.getElementById("customer");
	cust.style.display="block";
	var branch=document.getElementById("branch");
	branch.style.display="none";
	var emp=document.getElementById("employee");
	emp.style.display="none";
	var demp=document.getElementById("dform1");
	demp.style.display="none";
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
}
function bList()
{
	var branch=document.getElementById("branch");
	branch.style.display="block";
	var cust=document.getElementById("customer");
	cust.style.display="none";
	var emp=document.getElementById("employee");
	emp.style.display="none";
	var demp=document.getElementById("dform1");
	demp.style.display="none";
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
}
function eList()
{
	var emp=document.getElementById("employee");
	emp.style.display="block";
	var branch=document.getElementById("branch");
	branch.style.display="none";
	var cust=document.getElementById("customer");
	cust.style.display="none";
	var demp=document.getElementById("dform1");
	demp.style.display="none";
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
}
function dform(){
	var demp=document.getElementById("dform1");
	demp.style.display="block";
	var emp=document.getElementById("employee");
	emp.style.display="none";
	var branch=document.getElementById("branch");
	branch.style.display="none";
	var cust=document.getElementById("customer");
	cust.style.display="none";
	 var cn=document.getElementById("contact");
	 cn.style.display="none";
}
function cList()
{
	 var cn=document.getElementById("contact");
	 cn.style.display="block";
	 var cus=document.getElementById("customer");
	 var x=document.getElementById("branch");
	 var y=document.getElementById("manager");
	 var z=document.getElementById("employee");
	 var f=document.getElementById("dform1");
	 cus.style.display="none";
	 f.style.display="none";
	 x.style.display="none";
	 y.style.display="none";
	 z.style.display="none";
}
</script>
</body>
</html>