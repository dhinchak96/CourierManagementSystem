<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Branch Report</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
</head>
<body style="background-color:gray;">
<marquee direction="left"><h2 style="color:white;">Dhinchak Soft Pvt Ltd. (We Know Delievery Value.)</h2></marquee>
<div class="container" style="width:1200px;height:450px; background-color:powderblue;margin-left:20px;border:5px green;border-style:groove;"><br>
<h3 align="center"><u>Check BranchWise Report</u></h3><br>
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
	ResultSet rs1=st1.executeQuery("select b_id,b_name,emp_name as Manager,count(consig_id) as TotalConsignment,count(sh_id)as TotalShipments,sum(sh_price)as RupeyCollection from branch,courier,shipments,employees where branch.b_id=employees.bid AND courier.consig_id=shipments.sconsig_id AND employees.emp_id=shipments.semp_id AND b_id='"+request.getParameter("Neku")+"' group by b_id,b_name,emp_name");
	ResultSetMetaData rsmd=rs1.getMetaData();
	int count=rsmd.getColumnCount();
	%>
<center>
	<table border="2" bgcolor="powderblue" width="100%">
	<caption style="color:black;"><p align="center" style="font-size:20px;"><b># Branch Report #</b> </p></caption></p>
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