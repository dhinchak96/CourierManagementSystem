<%@page import="java.sql.*" %>
<html>
<head>
<title>Update Status Here</title>
<style>
h3{
font-size:25px;
font-style:bold;
color:red;
}
p{
font-style:bold;
font-size:20px;
padding-left:50px;
margin-left:200px;
color:black;
border:2 px solid black;
}
input{
border:2px solid black;
border-style:groove;
}
</style>
</head>
<body style="margin:0px;background-color:gray;">
<% 
String p1=request.getParameter("shid");
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
PreparedStatement pst=con.prepareStatement("select sh_id from shipments where sh_id=?");
pst.setString(1,p1);
ResultSet rs=pst.executeQuery();
if(rs.next())
{  session.setAttribute("msg", p1);
%>
<br><br><br><br>
<div class="container-fluid" style="background-color:powderblue;border:2px solid black;border-style:groove;width:1200px;height:450px;margin-left:20px;">
<h3 align="center"><u>UPDATE OLD STATUS</u> </h3><br><br>
<form action="updateStatusprocess.jsp" method="post">
<!-- <p align="justify">Enter Shipment Id:- <input type="text" name="shid" required></p><br> -->
<p>Enter Employee Id:- <input type="text" name="empid" style="margin-left:200px;border:2px solid green; border-style:groove;" size=30 required></p><br>
<p>New Status :-
<select name="nstat" style="margin-left:255px;border:2px solid black;border-style:groove;">
<option value="Select New Status">select New Status</option>
<option value="Item Booked at">Item Booked At</option>
<option value="Item Recieved at">Item Recieved At</option>
<option value="Item Dispatch To Branch">Item Dispatch To Branch</option>
<option value="Item Dispatch To Reciever">Item Dispatch To Reciever</option>
<option value="Item Delievered">Item Delievered To Reciever Successfully!!</option>
</select>
</p><br><br>
<input type="submit" value="UPDATE STATUS" style="color:blue;border:3px solid black;font-style:bold;border-style:ridge; margin-left:550px;">&nbsp &nbsp<input type="reset" value="RESET DETAILS" style="color:blue;font-style:bold;border:3px solid black;border-style:ridge;">
</form>
<% 
try{
String val=session.getAttribute("data").toString();
%>
<p align="center"><font size="4" color="red"><b><% out.print(val);%></b></font></p>;   
<% 
session.removeAttribute("data");
}catch(Exception e){
}
%>
</div>
<%  
}
else
{
	session.setAttribute("nship"," Sorry Shipment Does not Exist");
	response.sendRedirect("UpdateShipment.jsp");
}
}catch(Exception e)
{
	out.print(e.getMessage());
}
%>
</body>
</html>