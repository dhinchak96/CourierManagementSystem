<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("bid");
String name=request.getParameter("bname");
String time=request.getParameter("btime");
String addr=request.getParameter("badd");
String city=request.getParameter("bcity");
String stat=request.getParameter("bstate");
String cont=request.getParameter("bcontact");
String pin=request.getParameter("bpin");
try
{
Class.forName("oracle.jdbc.OracleDriver");
Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
String sql="Update branch set b_id=?,b_name=?,b_timing=?,b_add=?,b_city=?,b_state=?,b_contact=?,b_pincode=? where b_id='"+id+"'";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,id);
pst.setString(2, name);
pst.setString(3,time );
pst.setString(4, addr);
pst.setString(5,city);
pst.setString(6, stat);
pst.setString(7, cont);
pst.setString(8,pin);
int i = pst.executeUpdate();
if(i > 0)
{
	session.setAttribute("UBmsg","Branch Details Updated Succesfully !!!!");
	response.sendRedirect("UpdateBranchHome.jsp");
}
else
{
out.print("There is a problem in updating Record.");
} 
}catch(SQLException sql)
{
	request.setAttribute("error", sql);
	out.println(sql);
}
%>