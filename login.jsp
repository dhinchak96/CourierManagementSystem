<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="javax.swing.*" %>
<%
	String usnam=request.getParameter("usname");
	String pwd=request.getParameter("pass");
	String ust=request.getParameter("ustype");
	String bid=request.getParameter("branchid");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from login where usname='"+usnam+"' and pass='"+pwd+"' and usertype='"+ust+"'  and branch_id='"+bid+"' ");
	if(rs.next()){
	 if(ust.equals("Admin")){session.setAttribute("brid",bid);
			response.sendRedirect("AdminOperation.jsp");}
	else if(ust.equals("Manager")){session.setAttribute("brid",bid);
			response.sendRedirect("ManagerOperation.jsp");}
	else{
		session.setAttribute("brid",bid);
		response.sendRedirect("EmployeeMenu.jsp");
		}
	}else{
		session.setAttribute("brid","Invalid Login Details");
		response.sendRedirect("loginPage.jsp");
	}
}catch(SQLException e){
e.printStackTrace();
}catch(ClassNotFoundException e){
e.printStackTrace();
}
%>