<%@page import="java.sql.*"%>
<%@page import="javax.swing.*" %>
<%
try{
	String s1=request.getParameter("usname");
	String s2=request.getParameter("branchid");
	String s3=request.getParameter("squesn");
	String s4=request.getParameter("sans");
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select usname,branch_id,squsns,sansw from login where usname='"+s1+"' ");
if(rs.next()){
	session.setAttribute("msg",s1);
		response.sendRedirect("resetpass.jsp");
		}
else{
	out.print("Please Enter Valid Details");
}
}catch(Exception e){
	e.printStackTrace();
}
%>