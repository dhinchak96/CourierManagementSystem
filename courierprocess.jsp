<%@page import="java.sql.*" %>
<%
String sessionid=session.getAttribute("brid").toString();
//String s1=request.getParameter("cbid");
String s2=request.getParameter("cid");
String s3=request.getParameter("cfcity");
String s4=request.getParameter("ctocity");
String s5=request.getParameter("cstat");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	int c=st.executeUpdate("select consig_id from courier where consig_id='"+s2+"'");
	if(c>0)
	{
		session.setAttribute("msg","Consignment already exist Choose Different");
		response.sendRedirect("courier.jsp");
	}
	else if(c==0){
		Statement st1=con.createStatement();
		String q="insert into courier values('"+s2+"','"+sessionid+"','"+s3+"','"+s4+"')";
		st1.executeUpdate(q);
		session.setAttribute("msg","Consigment Created Succcessfully");
		response.sendRedirect("courier.jsp");
	}
 }catch(Exception e){
		e.printStackTrace();
	}
%>
