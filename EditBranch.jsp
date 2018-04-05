
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
try{
	Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
String sql ="select * from branch where b_id='"+id+"'";
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
margin-left:300px;
margin-top:10px;
margin-bottom:20px;
font-style:bold;
color: solid black;
font-size:15px;
}

input{
margin-left:150px;
text-align:justify;
border:3px solid black;
border-style:groove;
}
</style>
</head>
<body style="background-color:gray;">
<div class="container-fluid" style="width:1000px;height:600px;border:5px solid black;border-style:groove; background-color:powderblue;margin-left:100px;"><br><br>
<h3 align="center"><b>EDIT BRANCH INFORMATION</b></h3><br><br>
<form method="post" action="updateBranchprocess.jsp">
<p align="justify">Branch Id :- <input type="hidden" name="bid" value="<%=rs.getString(1) %>"></p>
<p align="justify">Branch Name :- &nbsp &nbsp <input type="text" name="bname" value="<%=rs.getString(2) %>"></p>
<p align="justify">Branch Time :- &nbsp &nbsp &nbsp<input type="text" name="btime" value="<%=rs.getString(3) %>"></p>
<p align="justify">Branch Address :- <input type="text" name="badd" value="<%=rs.getString(4) %>"></p>

<p align="justify">Branch City :-&nbsp&nbsp &nbsp &nbsp <input type="text" name="bcity" value="<%=rs.getString(5) %>"></p>
<p align="justify">Branch State :-&nbsp &nbsp &nbsp<input type="text" name="bstate" value="<%=rs.getString(6) %>"></p>
<p align="justify">Branch Contact :-<input type="text" name="bcontact" value="<%=rs.getString(7) %>"></p>
<p align="justify">Branch Pincode :-<input type="text" name="bpin" value="<%=rs.getString(8) %>"></p><br><br>
<p align="justify">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<input type="submit" value="UPDATE RECORD">&nbsp &nbsp &nbsp<a href="UpdateBranchHome.jsp"><b>BACK</b></a></p>
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