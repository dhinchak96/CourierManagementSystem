<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD EMPLOYEE</title>
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
<div class="container" style="background-color:powderblue; border:3px solid gray;">
<form action="addEProcess.jsp" method="post" name="eform">
<h2 align="center" style="border:2px solid green; color:blue; padding-top:5px; padding-bottom:5px;"><b>Employee Application Form</b></h2><br><br>
<fieldset>
<p>Enter Branch Id :-
<select name="branchid" style="margin-left:130px;border:2px solid black;border-style:groove;">
<option valu="0">Select Branch Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from branch order by b_id");
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
</p>
<p align="justify">Job Profile :- &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
<select name="ustype" style="margin-left:115px; width:250px; border:2px solid black;border-style:groove;" required>
<option value="select job profile">Select Job Profile</option>
<option value="Manager">Manager</option>
<option value="Assistance">Assistance</option>
<option value="Delievery Boy">Delievery Boy</option>
 </select></p>
<p align="justify" >Employee ID :- &nbsp &nbsp &nbsp <input type="text" name="eid" pattern="[A-Z][A-Z][0-9]{4}" size="30" placeholder="Enter a valid Id starting with E" required></p>
<p align="justify">Employee Name  :-  <input type="text" name="ename" size=30 autocomplete="off"></p>
<p align="justify">Gender :-  
 <p id="p1"> <input type="radio" name="gender" value="Male" required>Male &nbsp &nbsp
 <input type="radio" name="gender" value="Female">Female &nbsp &nbsp
  <input type="radio" name="gender" value="Transgender">Transgender</p>
<p align="justify">Date Of Birth  :- &nbsp&nbsp&nbsp  <input type="text" placeholder="dd-mm-yyyy" name="ebirth" required autocomplete="off"></p>

<p align="justify">Employee Age  :- &nbsp  <input type="number" name="eage" min=18 max=27  placeholder="18 <= Age <=27" required autocomplete="off"></p>
<p align="justify">Email Id :- &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp <input type="text" name="eemail" pattern="[1-zA-Z][a-zA-Z0-9-.]*@[a-zA-Z0-9]*([.][a-zA-Z]+)+" size="30"  placeholder="dhinchaksoft10@gmail.com" required autocomplete="off"></p>
</fieldset>
<hr>

<fieldset>
<legend><b>Employee Address :- </b></legend>
<p align="justify">Village/Street :- &nbsp &nbsp <input type="text" name="eadd" id="add" required autocomplete="off"></p>
<p align ="justify">City  :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp<input type="text" name="ecity" id="add" required autocomplete="off"></p>
<p align ="justify">State :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input type="text" name="estate" id="add" required autocomplete="off"></p>
<p align ="justify">Contact No. :- &nbsp &nbsp &nbsp &nbsp<input type="text" name="econt" pattern="(0|91)?[7-9][0-9]{9})"  id="add" required autocomplete="off"></p>
<p align ="justify">Pincode  :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="number" pattern="[0-9]{6}" name="epin" id="add"  required autocomplete="off"></p>
</fieldset><hr>
<p id="p1">
<p align ="justify"> Salary  :-  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="number" min=15000  max= 40000 name="esal" id="add" required autocomplete="off"></p>
<p align ="justify"> Username :-   &nbsp &nbsp &nbsp &nbsp &nbsp<input type="text" name="eusname" id="add"  required autocomplete="off"></p>
<p align ="justify"> Password  :-  &nbsp &nbsp &nbsp &nbsp &nbsp<input type="password" name="epass" id="add"  required autocomplete="off"></p>

<p align="justify">Security Question :- &nbsp &nbsp &nbsp &nbsp &nbsp
<select  name="squsn" style="margin-left:115px; width:250px; border:2px solid black;border-style:groove;" required>
<option value="select job profile">Select your Security  Question</option>
<option value="Whats your pet name ?">Whats your pet name ?</option>
<option value="Whats your best friend name ?">Whats your best friend name ?</option>
<option value="Whats your best childhood name ?">Whats your best childhood name ?</option>
 </select>
 <input type="password" name="sans" placeholder="enter answer here" size=30"></p>
<br>
<p align="justify" style="margin-left:300px; margin-top:40px;"><input type="submit" value="Add Employee" onclick="return validate()" required> <input type="reset" value="RESET DETAILS" required></p>
</form>
<%
try{
	String data=session.getAttribute("msg").toString();
	%>
	<p align="center" style="color:blue; border:3ps solid black; border-style:groove;"><% out.print(data); %></p>
	<% 
	session.removeAttribute("msg");
}catch(Exception e){
}
%>
</div>
<script >
function validate()
{
	var sans=document.eform.sans.value;
	if(sans.length<6){
		alert("Answer Should Contain 6 Alphabets");
		return false;
	}
	if(eform.branchid.selectedIndex==0){
		alert("Please Select Branch Id");
		eform.branchid.focus();
		return false;
	}
	if(eform.ustype.selectedIndex==0){
		alert("Please Select UserType");
		eform.ustype.focus();
		return false;
	}
	if(eform.squsn.selectedIndex==0){
		alert("Please Select Security Question ");
		eform.squsn.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>