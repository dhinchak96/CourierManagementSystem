<%@page import="java.sql.*" %>
<html>
<head>
<title>Report</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
</head>
<body><br><br>
<div class="container-fluid" style="width:1000px;height:300px;border:3px solid black;border-style:groove;margin-left:90px;">
<% 
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select b_name,sh_id,inv_nu,cust_name,cust_city,rec_name,rec_city,sh_weight,sh_price,bking_date from invoic,shipments,customer,branch where customer.br_id=branch.b_id AND customer.customer_id=shipments.scust_id AND shipments.sh_id=invoic.ish_id");
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
</div>
</body>
</html>