<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheets" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<form action="" method="post">
<select name="Neku" class="form-control" style="width:300px;" onchange="this.form.submit();">
<option value="0">Select Branch Id</option>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select   *from branch");
while(rs.next()){
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(1)%></option>
<% 	
}
con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</select><br>
<table class="table table-bordered table-striped">
<%
try{
	Class.forName("oracle.jdbc.OracleDriver").newInstance();
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cms","dhinchak");
	Statement st1=conn.createStatement();
	ResultSet rs1=st1.executeQuery("select b_name,sh_id,from_city,to_city,cust_name,cust_add,cust_contact,rec_name,rec_add,rec_contact from branch,courier,shipments,customer where b_id='"+request.getParameter("Neku")+"' AND courier.cbr_id=branch.b_id AND courier.consig_id=shipments.sconsig_id AND customer.customer_id=shipments.scust_id");
	ResultSetMetaData rsmd=rs1.getMetaData();
	int count=rsmd.getColumnCount();
	%>
	<center>
	<table border="1" bgcolor="powderblue" width="80%">
	<caption style="background-color:green; color:yellow;"><p align="center" style="font-size:20px;"><b># All Branches Contact List #</b> </p></caption></p>
	<tr>
	<%
	for(int i=1;i<=count;i++){
	%>
	<td align="center"><b><font size="3" color="black"><%=rsmd.getColumnName(i)%></font></b></td>
	<%
	}
	%>
	</tr>
	<%
	while(rs1.next()){
	%>
	<tr>
	<% 
	for(int i=1;i<=count;i++){
		%>
		<td><b><font size="3" color="black" ><%=rs1.getString(i) %></font></b></td>
		<% 
	}
	%>

	</tr>	
	<%
	}
	%>
	</table>
	</center>
	<%
	conn.close();
}catch(Exception e){
	
}
%>
</table>
</form>
</div>
</body>
</html>