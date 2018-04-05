<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%!
static Connection con;
static Statement st;
ResultSet rs;
ResultSetMetaData rsmd;
static {
	try{
		
		Class.forName("oracle.jdbc.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
		st=con.createStatement();
		
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>

<%
try{
	String q="select b_id,b_name,b_timing,b_add,b_city,b_state,b_contact,b_pincode,emp_name as Contact_Person,emp_desg as Profile from branch,employees where branch.b_id=employees.bid";
	//String q="select *from branch";
	rs=st.executeQuery(q);
	rsmd=rs.getMetaData();
	int count=rsmd.getColumnCount();
%>
<html>
<body>
<center>
<table border="1" bgcolor="lightyellow">
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td><b><font size="2" color="red"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="2" color="black"><%=rs.getString(i) %></font></b></td>
	<% 
}
%>

</tr>	
<%
}
%>
</table>
</center>
</body>
</html>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<hr>