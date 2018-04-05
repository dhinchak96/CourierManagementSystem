<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="javax.swing.*" %>
<%
	String id=request.getParameter("bid");
	String bname=request.getParameter("bname");
	String time=request.getParameter("btime");
	String add=request.getParameter("badd");
	String city=request.getParameter("bcity");
	String stat=request.getParameter("bstate");
	String cont=request.getParameter("bcont");
	String pin=request.getParameter("bpin");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	String q="insert into branch values('"+id+"','"+bname+"','"+time+"','"+add+"','"+city+"','"+stat+"','"+cont+"','"+pin+"')";
	st.executeUpdate(q);
	session.setAttribute("branch","Record Succesfully Inserted");
	response.sendRedirect("addB.jsp");
}catch(SQLException e){
e.printStackTrace();
}catch(ClassNotFoundException e){
e.printStackTrace();
}
%>