<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Form </title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="icon" type="images/jpg.png" href="images/adde.jpg" >
<style>
p{
margin-left:60px;
margin-top:10px;
margin-bottom:20px;
text-format:bold;
color: black;
font-size:15px;
font-style:italic;
}
form{
padding:10px 20px 10px 20px;}
input{
margin-left:120px;
text-align:justify;
border:3px solid black;
border-style:ridge;
color:blue;
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
<body>
<div class="container" style="background-color:gray; border:3px solid gray; border-style:groove;">
<h4 align="right"><a href="EmployeeMenu.jsp"><b>Back</b></a></h4>
<%
try{
	String data=session.getAttribute("shipment").toString();
	%>
	<p align="center" style="color:blue; border:3ps solid black; border-style:groove;"><% out.print(data); %></p>
	<p align="right"><font size="2" color="blue"><a href="generateslip.jsp"><b>Generate Bill Here</b></a></font></p>
	<% 
	session.removeAttribute("shipment");
}catch(Exception e){
	
}
%>
<form action="shipmentsProcess.jsp" method="post">
<h2 align="center" style="border:2px solid green; color:white; padding-top:5px; padding-bottom:5px;"><b>Shipments Booking Form </b></h2><br><br>
<fieldset>
<!-- <p align="justify">Branch ID :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type="text" placeholder="enter Branch id "  name="brnchid" size =30 reuired></p> -->
<p align="justify">Consignment ID :- &nbsp &nbsp &nbsp &nbsp &nbsp <input type="text" placeholder="enter Consignment id" name="consgid" size =30 reuired></p>
<p align="justify">Employee ID :- &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type="text" placeholder="enter Employee id "  name="employid" size =30 reuired></p>
</fieldset>
<hr>
<fieldset>
<legend><b>Sender Information :- </b></legend>
<p align="justify">Sender ID :- <input type="text" placeholder="enter Sender id" name="senderid" size =30 style="margin-left:270px;" required></p>
<p align="justify">Sender Name :- <input type="text" placeholder="enter Sender name" name="sendname" size =30 style="margin-left:245px;" reuired></p>
<p align="justify">Village/Street :-  <input type="text" name="sadd" id="add" size =30 required></p>
<p align ="justify">City  :-   &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp<input type="text" name="scity" id="add" size=30 required></p>
<p align ="justify">State :-   &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input type="text" name="sstate" id="add" size=30 required></p>
<p align ="justify">Contact No. :-  &nbsp &nbsp<input type="text" name="scont"  id="add" size=30 required></p>
<p align ="justify">Pincode  :-   &nbsp &nbsp &nbsp &nbsp &nbsp<input type="number" name="spin" id="add" size=30  required></p>
</fieldset><hr>
<fieldset>
<legend><b>Reciever Information :- </b></legend>
<p align="justify">Reciever Name :-   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type="text" placeholder="enter reciever name" name="recname" size =30 reuired></p>
<p align="justify">Village/Street :-  &nbsp <input type="text" name="radd" id="add" size=30 required></p>
<p align ="justify">City  :-   &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp<input type="text" name="rcity" id="add" size=30 required></p>
<p align ="justify">State :-   &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input type="text" name="rstate" id="add" size=30 required></p>
<p align ="justify">Contact No. :-  &nbsp &nbsp &nbsp<input type="text" name="rcont"  id="add" size=30 required></p>
<p align ="justify">Pincode  :-   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="number" name="rpin"  size=30 id="add"  required></p>
</fieldset><hr>
<br>
<legend><b>Shipments Details :- </b></legend>
<p align="justify">Shipment ID :- <input type="text" placeholder="enter shipment id "  name="shipid" size =30 style="margin-left:315px;" reuired></p>
<p align="justify">Shipment Type :- <select name="shtype" style="margin-left:300px; width:250px; border:2px solid black;border-style:groove;">
<option value="Documents">Documents</option>
<option value="Documents">Acessories</option>
<option value="Documents">Clothes</option>
<option value="Documents">Anything Else</option>
</select> 
</p>
<p align ="justify"> Shipment Weight :- &nbsp  &nbsp &nbsp &nbsp &nbsp<input type="number" name="sweight" id="add" size=30 required></p>
<p align="justify">Shipments  Delievery Type :-   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <select name="sdtype" style="margin-left:100px; width:250px; border:2px solid black;border-style:groove;">
<option value="Normal">Normal</option>
<option value="Standard">Standard</option>
</select> 
</p>
<p align ="justify">Shipment Price   :-    &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input type="number" name="sprice" id="add" required></p>
<p align ="justify">Shipment Invoice No.   :- &nbsp &nbsp<input type="text" name="sinvoice" id="add" required></p>
</fieldset>
<hr>
<p align="justify" style="margin-left:250px; margin-top:40px;color:yellow;"><input type="submit" value="Book Shipments"  style="background-color:green; border:2px solid black; border-style:groove;"required><input type="reset" value="RESET DETAILS"  style="background-color:green; border:2px solid black; border-style:groove;"required></p>
</form>
</div>
</body>
</html>