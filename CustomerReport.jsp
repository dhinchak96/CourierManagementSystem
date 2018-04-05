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
	
	rs=st.executeQuery("select b_name,cust_name,cust_city,cust_contact,sh_id,rec_name,rec_city,rec_contact,inv_nu from branch,shipments,customer,invoic,courier where  courier.consig_id=shipments.sconsig_id AND customer.br_id=branch.b_id AND customer.customer_id=shipments.scust_id AND shipments.sh_id=invoic.ish_id AND customer.br_id='"+sessionid+"' order by customer_id");
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<html>
<head>
<title>Customer Report</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid" style="backround-color:blue;border:3px solid black;border-style:groove;width:1100px;height:500px;">
<p align="right" style="font-size:18px;"><a href="ManagerOperation.jsp">Back</a></p>
<h3 align="center" style="color:black">!! Customer Report !!</h3><br><br>
<center>
<table border="2" cellpadding="5" cellspacing="5" width="100%">
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td><b><font size="2" color="red"><%=rsmd.getColumnName(i)%></font></b></td>
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
	<td><b><font size="2" color="black"><%=rs.getString(i) %></font></b></td>
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
</body>
</html>