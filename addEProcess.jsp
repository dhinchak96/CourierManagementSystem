<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="javax.swing.*" %>
<%
//String sessionid=session.getAttribute("brid").toString();
	String bid=request.getParameter("branchid");
	String ustyp=request.getParameter("ustype");
	String id=request.getParameter("eid");
	String name=request.getParameter("ename");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("ebirth");
 int  age=Integer.parseInt(request.getParameter("eage"));
	String email=request.getParameter("eemail");
	String add=request.getParameter("eadd");
	String city=request.getParameter("ecity");
	String stat=request.getParameter("estate");
	String  cont=request.getParameter("econt");
	int pin=Integer.parseInt(request.getParameter("epin"));
	int sal=Integer.parseInt(request.getParameter("esal"));
	String eus=request.getParameter("eusname");
	String epas=request.getParameter("epass");
	String squs=request.getParameter("squsn");
	String sans=request.getParameter("sans");
		try{
		Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	String q="insert into employees values('"+bid+"','"+ustyp+"','"+id+"','"+name+"','"+gender+"',to_date('"+birth+"','dd/mm/yyyy'),'"+age+"','"+email+"','"+add+"','"+city+"','"+stat+"','"+cont+"','"+pin+"','"+sal+"',to_date(sysdate,'dd-mm,yy'))";
	st.executeUpdate(q);
	String q1="insert into login values('"+eus+"','"+epas+"','"+ustyp+"','"+bid+"','"+squs+"','"+sans+"')";
	st1.executeUpdate(q1);
	session.setAttribute("msg","Record Succesfully Inserted");
	response.sendRedirect("addE.jsp");
}catch(Exception f){
	out.print(f.getMessage());
}
%>