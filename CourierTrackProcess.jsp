<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String shnum=request.getParameter("cnumber");
try{
	Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
String q="select consig_id from courier where consig_id='"+shnum+"'";
ResultSet rs=st.executeQuery(q);
if(rs.next())
{ 
		ResultSet rs1=st.executeQuery("select con_id,current_stat,b_name,b_city,dat_time from branch,employees,cou_status,courier where branch.b_id=employees.bid AND courier.consig_id=cou_status.con_id AND cou_status.cemp_id=employees.emp_id AND courier.consig_id='"+shnum+"' order by dat_time");		
		ResultSetMetaData rsmd=rs.getMetaData();
		int count=rsmd.getColumnCount();
%>
<center>
<table border="2" bgcolor="powderblue" width="100%">
<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b>Consignment Current Status</b> </p></caption></p>
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
	response.sendRedirect("TrackConsign.jsp");
}
%>
</table>
<p align="center"><a href="TrackConsign.jsp"><font size="3" color="green"><button><b>Click here To check Another</b></button></font></a> <a href="index.jsp"><font size="3" color="green"><button><b>Home</b></button></font></a></p> 
</center>
<% 
}catch(SQLException e){
e.printStackTrace();
}catch(ClassNotFoundException e){
e.printStackTrace();
}
%>
