<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<title> Check Employee Details</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
<style>
td,tr{
padding:5px;
}
</style>
</head>
<body ><br>
<p align="right"><a href="AdminOperation.jsp"><b>BACK</b></a></p>
<div class="container" style="width:1200px;height:450px; background-color:white;margin-left:20px;"><br>
<%
try{
	String val=session.getAttribute("UBmsg").toString();
	%>
	<h3 align="center" style="color:blue;border:2px solid black;border-style:ridge;"><%out.print(val);%>&nbsp &nbsp &nbsp<a href="UpdateEmployeeHome.jsp"><b>Update Another</b></a></h3>
	<% 
	session.removeAttribute("UBmsg");
}catch(Exception e){
	
}
%>
<div class="row" style="border:3px solid green;border-style:groove;">
<h3 align="center"><u>UPDATE EMPLOYEES DETAILS</u></h3><br>
<form action="" method="post">
<br><br>
<p align="center"><b>ENTER EMPLOYEE ID :-</b>
<select name="Neku" class="form-control" style="margin-left:250px;border:2px solid:black; border-style:groove;" onchange="this.form.submit();">
<option value="0">Select Employee Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select emp_id from employees where emp_id !='A1601' order by emp_id");
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(1)%></option>
<% 	
}
con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</select></p><br><br>
<p>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver").newInstance();
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st1=conn.createStatement();
	ResultSet rs1=st1.executeQuery("select * from employees where emp_id='"+request.getParameter("Neku")+"' AND emp_desg!='Admin' ");
%>
	<h3 align="center"> Employee Details Here </h3>
	<table border="2" cellspacing="5" cellpadding="5" width="100%">
	<tr>
	<td>Branch Id</td>
	<td>Profile</td>
	<td>Employee Id</td>
	<td>Employee Name</td>
	<td>Gender</td>
	<td>D.O.B</td>
	<td>Age</td>
	<td>Email</td>
	<td>Address</td>
	<td>City</td>
	<td>State</td>
	<td>Contact</td>
	<td>Pincode</td>
	<td>Salary</td>
	<td>Update</td>
	</tr>
<% 
if(rs1.next()){
	%>
	<tr>
	<td><%=rs1.getString(1) %></td>
	<td><%=rs1.getString(2) %></td>
	<td><%=rs1.getString(3) %></td>
	<td><%=rs1.getString(4) %></td>
	<td><%=rs1.getString(5) %></td>
	<td><%=rs1.getString(6) %></td>
	<td><%=rs1.getString(7) %></td>
	<td><%=rs1.getString(8) %></td>
	<td><%=rs1.getString(9) %></td>
	<td><%=rs1.getString(10) %></td>
	<td><%=rs1.getString(11) %></td>
	<td><%=rs1.getString(12) %></td>
	<td><%=rs1.getString(13) %></td>
	<td><%=rs1.getString(14) %></td>
	<td><a href="EditEmployee.jsp?id=<%=rs1.getString(3)%>">Update</a></td>
	</tr>
	<%
	}
}catch(Exception e){
	
}
	%>
	</table>
</form>
</div>
<br><br>
</div>
</body>
</html>