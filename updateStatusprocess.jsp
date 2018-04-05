<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%
String s1=session.getAttribute("msg").toString();
out.print(s1);
//String s1=request.getParameter("shid");
String eid=request.getParameter("empid");
String p2=request.getParameter("nstat");
String dat=new Date().toLocaleString();
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
String q="insert into status values('"+s1+"','"+p2+"','"+dat+"','"+eid+"')";
st.executeUpdate(q);
session.setAttribute("data","Status Succesfully Updated");
response.sendRedirect("UpdateShipment.jsp");
}catch(Exception e)
{
}
%>