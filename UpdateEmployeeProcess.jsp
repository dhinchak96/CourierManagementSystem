<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("bid");
String job=request.getParameter("jprofile");
String eid=request.getParameter("eid");
String enam=request.getParameter("ename");
String egen=request.getParameter("egender");
String edb=request.getParameter("edob");
String eag=request.getParameter("eage");
String emal=request.getParameter("eemail");
String ead= request.getParameter("eadd");
String ecty=request.getParameter("ecity");
String estat=request.getParameter("estate");
String econt=request.getParameter("econtact");
String epn=request.getParameter("epin");
String esal=request.getParameter("esal");
try
{
Class.forName("oracle.jdbc.OracleDriver");
Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
String sql="Update employees set bid=?,emp_desg=?,emp_id=?,emp_name=?,gender=?,dob=?,age=?,email=?,emp_add=?,emp_city=?,emp_state=?,emp_contact=?,pincode=?,salary=? where emp_id='"+eid+"'";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,id);
pst.setString(2,job);
pst.setString(3,eid);
pst.setString(4,enam);
pst.setString(5,egen);
pst.setString(6,edb);
pst.setString(7,eag);
pst.setString(8,emal);
pst.setString(9,ead);
pst.setString(10,ecty);
pst.setString(11,estat);
pst.setString(12,econt);
pst.setString(13,epn);
pst.setString(14,esal);
int i = pst.executeUpdate();
if(i > 0)
{
	session.setAttribute("UBmsg","Employee Details Updated Succesfully !!!!");
	response.sendRedirect("UpdateEmployeeHome.jsp");
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