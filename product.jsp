<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.name {
	font-weight: bold;
	font-size: 36px;
}
.gnrl {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.center1 {
	text-align: center;
}
.center1 table {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	font-weight: bold;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-family: Arial, Helvetica, sans-serif;
}
.right {
	text-align: right;
}
.norm {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body>
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
<p>
  <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%
		String pid=getServletContext().getAttribute("product").toString();
  	 String b1=getServletContext().getAttribute("b1").toString();
 	 String b2=getServletContext().getAttribute("b2").toString();
 	 String b3=getServletContext().getAttribute("b3").toString();
		//String hname="Grand";
		 PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdata","root","test");
      
         Statement st=con.createStatement();
		ps=con.prepareStatement("select * from books where isbn=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
<p class="name"><%=rs.getString(2)%>  </p>
         <%}
		 ps=con.prepareStatement("select * from books where isbn=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
</p>
<table width="997" height="399" border="0">
  <tr>
    <td width="358" class="center1"><img src=<%=rs.getString(7)%> width="200" height="300" alt=hname/></td>
    <%}
    ps=con.prepareStatement("select * from books where isbn=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1"> ISBN :</td>
        <td width="277" class="normal"><%=rs.getString(1)%></td>
      </tr>
      <tr>
        <td class="center1">Author:</td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr>
        <td class="center1">Publisher :</td>
        <td><%=rs.getString(5)%></td>
      </tr>
    
    </table>
    <p>
    
    
    <script>function hover(element) {
  element.setAttribute('src', "star.png");
}
function unhover(element) {
	  element.setAttribute('src', "star_off.png");
	}
</script>
<form action="p2.jsp">
<button type="submit" name="rate" value="1"><img src="star_off.png" onmouseover="hover(this);" onmouseout="unhover(this);" alt="submit"></button>
<button type="submit" name="rate" value="2"><img src="star_off.png" onmouseover="hover(this);" onmouseout="unhover(this);" alt="submit"></button>
<button type="submit" name="rate" value="3"><img src="star_off.png" onmouseover="hover(this);" onmouseout="unhover(this);" alt="submit"></button>
<button type="submit" name="rate" value="4"><img src="star_off.png" onmouseover="hover(this);" onmouseout="unhover(this);" alt="submit"></button>
<button type="submit" name="rate" value="5"><img src="star_off.png" onmouseover="hover(this);" onmouseout="unhover(this);" alt="submit"></button>
</form>
    
    
    
    
    
    
    
    <form action="buy.jsp"> 
<input type="hidden" name="name" value=<%=pid%>> 
<input type="image" src="tel-domain-buy-logo.jpg" name="buy" value="grand"> 
</form></p>

<form name="modelDetail1" method="post" action="servlet/CartController">
	
 		<input type="hidden" name="modelNo" value=<%=pid%>>
        
      <p>
        <input type="hidden" name="description" value="<%=rs.getString(2)%>"></p>
       
      
      <p>
     	 <input type="text" size="2" value="1" name="quantity"></p>
      
      <p>
      	<input type="hidden" name="price" value="10"></p>
      	
      	<input type="hidden" name="action" value="add"><input type="submit" name="addToCart" value="Add To Cart">
      </form>

  <%}%>



</td>
  </tr>
</table>
<table>
<tr><br><br>FIND SIMILAR BOOKS:
</tr>
<tr>
            <td width="28"><table width="20" height="73" border="0" align="center">
              
      
      
      
     
<%
		ps=con.prepareStatement("select * from books where ISBN =? or ISBN =? or ISBN =?");
		 ps.setString(1,b1);
		 ps.setString(2,b2);
		 ps.setString(3,b3);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
	
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
      
    
            <td width="240" class="center1"><table width="117" height="173" border="0" align="center">
       <%} %>
          </tr>


</table>

<% 
rs.close();



%>
</body>
</html>