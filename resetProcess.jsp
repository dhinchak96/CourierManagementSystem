<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String pas=request.getParameter("pswd");
String usn=session.getAttribute("msg").toString();
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
Statement st=con.createStatement();
int c=st.executeUpdate(" update login set pass='"+pas+"' where usname='"+usn+"'");
if(c>0)
{
	session.setAttribute("res","Password Reset Succesfully ");
	response.sendRedirect("resetpass.jsp");
}
}catch(Exception e){
e.printStackTrace();
}
%>