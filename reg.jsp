<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
 <%@ page language="java" %>
        <table width="993" height="102" border="0">
          <tr>
            <td width="251" height="96"><img src="head.jpg" width="251" height="88" alt="Logo" /></td>
            <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main2.jsp">Home</a> |
              <% if(session.getAttribute("uname")==null) {
			%>
              <a href="login.jsp">Login</a>
              <%} else {
				%>
              <a href="logout.jsp">Logout</a>
              <%}%></td>
          </tr>
        </table>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
        String m=null, mn=null;
        String s=request.getParameter("name");
        String s2=request.getParameter("password");
        String s3=request.getParameter("date");
        String s4=request.getParameter("address");
		String s5=request.getParameter("phone");
		//int s6= Integer.parseInt(s5);
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
       Class.forName("com.mysql.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdata","root","test");
      
         Statement st=con.createStatement();
       
          ps= con.prepareStatement("insert into users values (?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,s2);
            ps.setString(3,s5);
           
           ps.setString(4,s4);
          // ps.setInt(5,s6);
          
               int insertResult = ps.executeUpdate();
               
               
             if (insertResult!=0)
            {
                 out.println("Successfully registered");
            }          
        %>
        <br><hr>
               To Login <a href="login.jsp">Click Here</a>
                <hr>
</body>
</html>