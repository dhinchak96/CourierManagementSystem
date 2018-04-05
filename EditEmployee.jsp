
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
try{
	Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
String sql ="select * from employees where emp_id='"+id+"' AND emp_desg !='Admin'";
ResultSet rs = st.executeQuery(sql);
if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Branch</title>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
<style>
p{
margin-left:150px;
margin-top:10px;
margin-bottom:20px;
font-style:bold;
color:  black;
font-size:15px;
}

input{
margin-left:150px;
text-align:center;
border:3px solid black;
border-style:groove;
font-style:italic;
color:blue;
background-color:white;
}
</style>
</head>
<body style="background-color:gray;">
<div class="container-fluid" style="width:1000px;height:920px;border:5px solid black;border-style:groove; background-color:powderblue;margin-left:100px;"><br><br>
<h3 align="center"><b>EDIT EMPLOYEE INFORMATION</b></h3><br><br>
<form method="post" action="UpdateEmployeeProcess.jsp">
<p align="justify">Branch Id :- &nbsp &nbsp <input type="hidden" name="bid" value="<%=rs.getString(1) %>"  size=30 style="margin-left:220px;"></p>
<p align="justify">Job profile :- &nbsp &nbsp &nbsp<input type="text" name="jprofile" value="<%=rs.getString(2) %>"  size=30 style="margin-left:215px;"></p>
<p align="justify">Employee Id :- <input type="hidden" name="eid" value="<%=rs.getString(3) %>"  size=30 style="margin-left:220px;"></p>
<p align="justify">Employee Name :- <input type="text" name="ename" value="<%=rs.getString(4) %>"  size=30 style="margin-left:200px;"></p>
<p align="justify">Gender :- <input type="text" name="egender" value="<%=rs.getString(5)%>"  size=30 style="margin-left:255px;"></p>
<p align="justify">D.O.B :- <input type="text" name="edob" value="<%=rs.getString(6) %>"  size=30 style="margin-left:260px;"></p>
<p align="justify">Employee Age :- <input type="text" name="eage" value="<%=rs.getString(7) %>"  size=30 style="margin-left:210px;"></p>
<p align="justify">Email :- <input type="text" name="eemail" value="<%=rs.getString(8) %>"  size=30 style="margin-left:265px;"> </p>
<p align="justify">Address :- <input type="text" name="eadd" value="<%=rs.getString(9) %>"  size=30 style="margin-left:250px;"></p>
<p align="justify">City :-&nbsp&nbsp &nbsp &nbsp <input type="text" name="ecity" value="<%=rs.getString(10) %>"  size=30 style="margin-left:250px;"></p>
<p align="justify">State :-&nbsp &nbsp &nbsp<input type="text" name="estate" value="<%=rs.getString(11) %>"  size=30 style="margin-left:250px;"></p>
<p align="justify">Contact :-<input type="text" name="econtact" value="<%=rs.getString(12) %>"  size=30 style="margin-left:250px;"></p>
<p align="justify">Pincode :-<input type="text" name="epin" value="<%=rs.getString(13) %>"  size=30 style="margin-left:250px;"></p>
<p align="justify">Salary :- <input type="text" name="esal" value="<%=rs.getString(14) %>" size=30 style="margin-left:255px;"></p><br><br>
<p align="justify">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="submit" value="UPDATE RECORD">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<a href="UpdateBranchHome.jsp"><b>BACK</b></a></p>
</form>
</div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>