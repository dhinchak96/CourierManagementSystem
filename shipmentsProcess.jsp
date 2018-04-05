<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%
String sessionid=session.getAttribute("brid").toString();
//String s1=request.getParameter("brnchid");
String s2=request.getParameter("consgid");
String s3=request.getParameter("employid");
String s4=request.getParameter("senderid");
String s5=request.getParameter("sendname");
String s6=request.getParameter("sadd");
String s7=request.getParameter("scity");
String s8=request.getParameter("sstate");
String s9=request.getParameter("scont");
String s10=request.getParameter("spin");
String s11=request.getParameter("recname");
String s12=request.getParameter("radd");
String s13=request.getParameter("rcity");
String s14=request.getParameter("rstate");
String s15=request.getParameter("rcont");
int s16=Integer.parseInt(request.getParameter("rpin"));
String s17=request.getParameter("shipid");
String s18=request.getParameter("shtype");
int s19=Integer.parseInt(request.getParameter("sweight"));
String s20=request.getParameter("sdtype");
int  s21=Integer.parseInt(request.getParameter("sprice" ));
String s22=request.getParameter("sinvoice");
String s23=new Date().toLocaleString();
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st1=con.createStatement();
	String q1="insert into customer values('"+sessionid+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"')";
	st1.executeUpdate(q1);
	Statement st2=con.createStatement();
	String q2="insert into shipments values('"+s17+"','"+s2+"','"+s4+"','"+s3+"','"+s18+"','"+s19+"','"+s21+"','"+s11+"','"+s12+"','"+s13+"','"+s14+"','"+s16+"','"+s15+"','"+s23+"')";
		st2.executeUpdate(q2);
	Statement st3=con.createStatement();
	String q3="insert into invoic values('"+s22+"','"+s17+"','"+s23+"')";
	st3.executeUpdate(q3);
	session.setAttribute("shipment","Successfully Booked Shipments");
response.sendRedirect("addShipment.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>
