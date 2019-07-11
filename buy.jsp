<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
         <% 
         String pid=request.getParameter("pid");
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdata","root","test");
      
       
         Statement st=conn.createStatement();
		 String sql = "SELECT * from users where name=?"; 
		 ps = conn.prepareStatement (sql); 
		
%> 
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="156"><img src="head.jpg" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right"> <a href="contact.jsp">Contact us</a> | <a href="main2.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>
<%
 String uname=(String)session.getAttribute("uname"); 
 if(session.getAttribute("uname")!=null) {
	 session.setAttribute("product",request.getParameter("pid"));
	 ps.setString(1,uname);
	 rs = ps.executeQuery (); %>
	 Please <span class="italics"><strong>confirm</strong></span> your latest information, or if any of the info, which you see is not correct then you may press the <span class="italics">Edit</span> button below:
     <%
	 while(rs.next())
	 { %>
</p>
<table width="981" height="108" border="0" cellspacing="0">
  <tr>
    <td width="134" height="29">&nbsp;</td>
    <td width="303" align="center"><form action="buyedit.jsp"><input type="submit" name="Edit" value="Edit" />
    <input type="hidden" name="name" value=<%=rs.getString(1)%> /></form></td>
  </tr>
  <tr>
    <td height="29" align="right"><strong>Phone No.</strong></td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td height="50" align="right"><strong>Address:</strong></td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
<p><form action="orderconf.jsp">
<input type="submit" name="Confirm" value="Confirm" />
</form></p>
<p>
  <%}
else {
	 session.setAttribute("product",request.getParameter("name"));%>
	Enter the following details:
</p>
<p>
<form action="orderconf.jsp">
<table width="450" height="142" border="0">
  <tr>
    <td width="92" height="33" align="right">Name:</td>
    <td width="342"><input type="text" name="name" required size="30"/></td>
  </tr>
  <tr>
    <td height="32" align="right">Phone No.</td>
    <td><input type="tel" name="phone" pattern="^\d{10}$" required size="20"/></td>
  </tr>
  <tr>
    <td height="60" align="right">Address:</td>
    <td><input type="text" name="address" required size="120"/></td>
  </tr>
</table>
<input type="submit" name="submit" value="Confirm" />
</form>
</p>
<%}%>
</body>
</html>