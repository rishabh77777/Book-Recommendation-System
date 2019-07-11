<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {
	text-align: right;
}
#form1 {
	text-align: center;
}
.normal {
	text-align: left;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.unormal {
	font-family: Arial, Helvetica, sans-serif;
}
.center1 {	text-align: center;
}
</style>
</head>
<body>
<%@ page language="java" %>
<table width="993" height="330" border="0">
  <tr>
    <td width="205" height="89"><img src="head.jpg" width="251" height="88" alt="Logo" />
    <hr /></td>
    <td width="972"><table width="723" height="88" border="0">
      <tr>
        <td width="513" class="right">
        <% if(session.getAttribute("uname")==null) {
			%>
           <a href="contact.jsp">Contact</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Signup</a>|<a href="main2.jsp"> Home</a>
            <%} else {
				%>
                <a href="contact.jsp">Contact</a> |<a href="logout.jsp">Logout</a>
                <%}%>
                </td>
      </tr>
      <tr>
        <td><form id="form1" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>
  <tr>
  
    <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  
  
  
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal" height="10">PUBLICATIONS</td>
          </tr>
          
     <%
		
		 PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        String cat;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdata","root","test");
      int c=60;
         Statement st=con.createStatement(); 
         ps=con.prepareStatement("select distinct publisher from books");
         rs=ps.executeQuery();
         while(rs.next()&&c>0)
         { cat=rs.getString(1);
          
          c--;
   %>  
          
          
          
          
          
          <tr>
            <td><form action="cat.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="<%=cat %>" /><a href="cat.jsp?id=<%=rs.getString(1)%>"><%=cat %></a></form></td>
          </tr>
          
          <%} %>
          
        </table></td>
      </tr>
     
      
    </table></td>
    <td><table width="550" height="84" border="0">
      <tr class="normal">
      
      
      
       <td height="10">CHECK THESE OUT:</td>
      </tr>
     <%// %> <tr>
        <td height="261"><table width="74" height="28" border="0">
          <tr>
            <td width="28"><table width="20" height="73" border="0" align="center">
              
      
      
      
     
<%
String pub=request.getParameter("id");
		ps=con.prepareStatement("select * from books where publisher=?");
		 ps.setString(1,pub);
	int i=0,x=23;
		 rs=ps.executeQuery();
		 while(rs.next()&&x>0)
		 {
			 x--;
			 i++;
			 String a="abcd";
			 String id = rs.getString("isbn");
			 String url = rs.getString("urlm");
             String title = rs.getString("title");
             String author = rs.getString("author");
             
            %>
       <tr>
                <td><form method="post" action="ser/C"> 
<input type="hidden" name="product" value=<%=id%>> 
<input name="buy" type="image" value="grand" src=<%=url%> width="111" height="135"> 
</form></td>
              </tr>
            </table>
              <p class="center1"> <%=title%></p>
              <p class="center1"><b><%=author%><b></p>
            </td>
      <%       if(i%6==0)
             {
             
             %>    
         
      </tr><tr>
      <%} %>
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
             
       <%} %>
             
      
            
            
          </tr>
        </table></td>
      </tr>
      
    </table></td>
  </tr>
</table>

</body>
</html>
