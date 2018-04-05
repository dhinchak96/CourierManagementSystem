<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD BRANCH</title>
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
margin-left:120px;
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
<body>
<div class="container" style="background-color:white; border:3px solid black;">
<%
try{
	String data=session.getAttribute("branch").toString();
	%>
	<p align="center" style="color:blue; border:3ps solid black; border-style:groove;"><% out.print(data); %></p>
	<% 
	session.removeAttribute("branch");
}catch(Exception e){
}
%>
<p align="right"><font size="3" color="green"><b><a href="index.jsp">Home</a></b></font></p>
<form action="addBProcess.jsp" method="post">
<h2 align="center" style="border:2px solid green; color: black; padding-top:5px; padding-bottom:5px;"><b>Add New Branch Details</b></h2><br><br>
<fieldset>
<legend><b>Branch Information :- </b></legend>
 <p align="justify" >Branch ID :-&nbsp&nbsp &nbsp &nbsp &nbsp <input type="text" name="bid" pattern="B[0-9]{4}"size="30" autocomplete="off" required placeholder="ex. B1601"></p>
<p align="justify">Branch Name  :-  &nbsp&nbsp<input type="text" name="bname" size="30" width=242 height=43.33 autocomplete="off" id="bnm" required></p>
<p align="justify">Branch Timing :- &nbsp&nbsp<input type="text" name="btime" placeholder="ex.9 AM- 8 PM" autocomplete="off" required></p>
</fieldset>
<hr>

<fieldset>
<legend><b>Branch Address :- </b></legend>
<p align="justify">Village/Street :- &nbsp&nbsp&nbsp <input type="text" name="badd" id="add" autocomplete="off" required></p>
<p align ="justify">City  :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp<input type="text" name="bcity" id="add" autocomplete="off" required></p>
<p align ="justify">State :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input type="text" name="bstate" id="add" autocomplete="off" required></p>
<p align ="justify">Contact No. :- &nbsp &nbsp &nbsp &nbsp<input type="phone" pattern="(0|91)?[7-9][0-9]{9})" name="bcont" id="add" autocomplete="off" required></p>
<p align ="justify">Pincode  :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="pincode" pattern="[0-9]{6}" name="bpin" id="add"  autocomplete="off" required></p>
</fieldset><hr>
<fieldset>
<p align="justify" style="margin-left:400px; margin-top:40px;"><input type="submit" value="ADD BRANCH" autocomplete="off" required><input type="reset" value="RESET DETAILS" autocomplete="off" required> </p>
</form>
</div>
</body>
</html>