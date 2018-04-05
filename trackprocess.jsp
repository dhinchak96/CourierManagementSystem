<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String shnum=request.getParameter("shnumber");
try{
	Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
String q="select sh_id from shipments where sh_id='"+shnum+"'";
ResultSet rs=st.executeQuery(q);
if(rs.next())
{ 
		ResultSet rs1=st.executeQuery("select b_name,sh_id,current_state,date_time from branch,shipments,employees,status where employees.emp_id=status.empl_id AND branch.b_id=employees.bid AND shipments.sh_id=status.ssh_id AND shipments.sh_id='"+shnum+"' order by date_time");		
		ResultSetMetaData rsmd=rs.getMetaData();
		int count=rsmd.getColumnCount();
%>
<center>
<table border="2" bgcolor="powderblue" width="100%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b>Shipment Current Status</b> </p></caption></p>
<tr>
<%
for(int i=1;i<=count;i++){
%>
<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
<%
}
%>
</tr>
<%
while(rs1.next()){
%>
<tr>
<% 
for(int i=1;i<=count;i++){
	%>
	<td><b><font size="3" color="blue" ><%=rs1.getString(i) %></font></b></td>
	<% 
}
%>
</tr>	
<%
}
}else{
	session.setAttribute("nship","Shipment does not exist");
	response.sendRedirect("trackshipment.jsp");
}
%>
</table>
<p align="center"><a href="trackshipment.jsp"><font size="3" color="green"><button><b>Click here To check Another</b></button></font></a> <a href="index.jsp"><font size="3" color="green"><button><b>Home</b></button></font></a></p> 
</center>
<% 
}catch(SQLException e){
e.printStackTrace();
}catch(ClassNotFoundException e){
e.printStackTrace();
}
%>
