<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Branch Report</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
</head>
<body style="background-color:gray;">
<p align="right"><a href="AdminOperation.jsp"><b>BACK</b></a></p>
<marquee direction="left"><h2 style="color:white;">Dhinchak Soft Pvt Ltd. (We Know Delievery Value.)</h2></marquee>
<div class="container" style="width:1200px;height:450px; background-color:powderblue;margin-left:20px;border:5px green;border-style:groove;"><br>
<h3 align="center"><u>Check Employee List</u></h3><br>
<form action="" method="post">
<br><br>
<p align="center"><b>ENTER BRANCH ID :-</b>
<select name="Neku" class="form-control" style="margin-left:250px;border:2px solid:black; border-style:groove;" onchange="this.form.submit();">
<option value="0">Select Branch Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select b_id from branch where b_id !='B1601'");
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
	ResultSet rs1=st1.executeQuery("select bid,emp_desg,emp_id,emp_name,gender,dob,age,email,emp_add,emp_contact from employees where  bid='"+request.getParameter("Neku")+"' order by bid");
	ResultSetMetaData rsmd=rs1.getMetaData();
	int count=rsmd.getColumnCount();
	%>
 <center>
	<table border="2" bgcolor="powderblue" width="100%">
	<caption style="background-color:white;"><p align="center" style="font-size:15px;color:black;"><b># Employee List #</b></p></caption></p>
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
	while(rs1.next()){
	%>
	<tr>
	<% 
	for(int i=1;i<=count;i++){
		%>
		<td><b><font size="3" color="black" ><%=rs1.getString(i) %></font></b></td>
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
	conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form><br><br>
</div>
</body>
</html>