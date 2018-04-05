<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Check Employee Details</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
</head>
<body style="background-color:black;"><br>
<div class="container" style="width:1200px;height:450px; background-color:gray;margin-left:20px;"><br>
<h3 align="center"><u>UPDATE BRANCH DETAILS</u></h3><br>
<form action="" method="post">
<br><br>
<p align="center"><b>ENTER BRANCH ID :-</b>
<select name="bnch" class="form-control" style="margin-left:250px;border:2px solid:black; border-style:groove;" onchange="this.form.submit();">
<option value="0">Select Branch Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select b_id from branch");
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
	ResultSet rs1=st1.executeQuery("select b_id,b_name,b_timing,b_add,b_city,b_state,b_contact,b_pincode,emp_name as Manager from employees,branch where b_id='"+request.getParameter("bnch")+"' AND employees.bid=branch.b_id AND emp_desg='Manager' ");
	ResultSetMetaData rsmd=rs1.getMetaData();
	int count=rsmd.getColumnCount();
	%>
<center>
	<table border="2" bgcolor="powderblue" width="100%">
	<caption style="background-color:none; color:yellow;"><p align="center" style="font-size:20px;"><b># Branch Details Here #</b> </p></caption></p>
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
<p align="center"><a href="updateBprocess.jsp"><b>Update Record</b></a>&nbsp &nbsp &nbsp &nbsp<a href="UpdateBranch.jsp"><b>Reset Details</b></a></p>

</form><br><br>
</div>
</body>
</html>