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
String p1=request.getParameter("cid");
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
PreparedStatement pst=con.prepareStatement("select consig_id from courier where consig_id=?");
pst.setString(1,p1);
ResultSet rs=pst.executeQuery();
if(rs.next())
{  session.setAttribute("msg", p1);
%>
<br><br><br><br>
<div class="container-fluid" style="background-color:powderblue;border:2px solid black;border-style:groove;width:1200px;height:450px;margin-left:20px;">
<h3 align="center"><u>UPDATE OLD STATUS</u> </h3><br><br>
<form action="CourierStatusProcess.jsp" method="post">
<!-- <p align="justify">Enter Shipment Id:- <input type="text" name="shid" required></p><br> -->
<p>Enter Employee Id:- <input type="text" name="empid" style="margin-left:200px;border:2px solid green; border-style:groove;" size=30 required></p><br>
<p>New Status :-
<select name="nstat" style="margin-left:255px;border:2px solid black;border-style:groove;">
<option value="Select New Status">Select New Status</option>
<option value="Item Booked at">Not Dispatch Yet</option>
<option value="Item Recieved at">ConsignMent Dispatch By</option>
<option value="Item Dispatch To Branch">ConsignMent Recieved By</option>
</select>
</p><br><br>
<input type="submit" value="UPDATE ConsignMent" style="color:blue;border:3px solid black;font-style:bold;border-style:ridge; margin-left:550px;">&nbsp &nbsp<input type="reset" value="RESET DETAILS" style="color:blue;font-style:bold;border:3px solid black;border-style:ridge;">
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
	session.setAttribute("nconsig"," Sorry ConsignMent Does not Exist");
	response.sendRedirect("UpdateCourier.jsp");
}
}catch(Exception e)
{
	out.print(e.getMessage());
}
%>
</body>
</html>