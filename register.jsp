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
</head>

<body>
 <center>
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
   <hr />
   <strong><em>Register here</em></strong>
   <form action="reg.jsp"><table><b>
           <tr><td>Name</td><td><input type="text" name="name"required></td></tr>
           
            <tr><td>Password</td><td><input type="password" name="password"required pattern=".{7,}"title="Must contain atleast 7 characters"></td></tr>
            <tr><td>Phone No.</td><td><input type="text" name="phone"required size="10"  /></td></tr>
            <tr><td>Date of Birth</td><td><input type="date" name="date"required></td></tr>
            <tr><td>Address</td><td><textarea name="address"required></textarea></td></tr>
                <br>
                </b></table><br />
     <input type="submit" value="Register" />
                    </form>
            <br><hr>
              Already Registered!! To Login <a href="login.jsp">Click Here</a>
                <hr>
                
    </center>
</body>
</html>