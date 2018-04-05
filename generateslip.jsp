<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>generate bill</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/js/bootstrap.min.js">
<link rel="icon" type="images/jpg.png" href="images/add.png" >
<style>
p{
margin-left:60px;
margin-top:10px;
margin-bottom:20px;
text-format:bold;
color: black;
font-size:15px;
}
form{
padding:10px 20px 10px 20px;}
input{
margin-left:300px;
text-align:justify;
border:3px solid black;
border-style:groove;
}
legend{
margin-left:50px;
color:rgb(50,192,100);
font-size:25px;
}
#p1{
margin-left:300px;
}
#add{
margin-left:250px;
}
</style>
</head>
<body><br><br>
<div class="container" style="background-color:white; border:3px solid black;width:800px;height:500px;">
<form action="" method="post">
<h2 align="center" style="border:2px solid green; color: black; padding-top:5px; padding-bottom:5px;"><b>Generate Bill</b></h2><br><br>
<p align="justify" >Invoice Number :- &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
<select name="invoice" style="margin-left:100px; width:250px; border:2px solid black;border-style:groove;" onchange="this.form.submit();">
<option value="Select Invoice Number Number"> Select Invoice Number</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select inv_nu from invoic");
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
</p><br><br>
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select b_name,sh_id,inv_nu,cust_name,cust_city,rec_name,rec_city,sh_weight,sh_price,bking_date from invoic,shipments,customer,branch where customer.br_id=branch.b_id AND customer.customer_id=shipments.scust_id AND shipments.sh_id=invoic.ish_id AND inv_nu='"+request.getParameter("invoice")+"'");
	%>
	<center>
	<table border="1" cellspacing="5" cellpadding="5" width="100%">
	<tr>
	<td>Branch Name</td>
	<td>Shipment Number</td>
	<td>Invoice Number</td>
	<td>Sender Name</td>
	<td>Sender City</td>
	<td>Reciever Name</td>
	<td>Reciever City</td>
	<td>Weight</td>
	<td>Price</td>
	<td>Booking Date</td>
	<td>Print</td>
	</tr>
	<% 
if(rs.next()){
	%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
	<td><%=rs.getString(8) %></td>
	<td><%=rs.getString(9) %></td>
	<td><%=rs.getString(10) %></td>
	<td><a href="#">Print</a></td>
	</tr>
	<%
	}
%>
	</table>
	</center>
<% 
}catch(Exception e)
{
}
%>
</form>
</div>
</body>
</html>