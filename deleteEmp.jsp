<%@page import="java.sql.*" %>
<%@page import="javax.swing.*" %>
<%
String empid=request.getParameter("dempid");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	int c=st.executeUpdate("select emp_id from employees where emp_id='"+empid+"' ");
	if(c>0)
	{
		Statement st1=con.createStatement();
		st1.executeUpdate("delete employees where emp_id='"+empid+"'");
		session.setAttribute("msg"," Record Successfully Delete");
		response.sendRedirect("AdminOperation.jsp");
	}
	else
	{
		session.setAttribute("msg","Employees Does Not Exist");
		response.sendRedirect("AdminOperation.jsp");
	}
}catch(Exception e)
{
e.printStackTrace();	
}
%>
