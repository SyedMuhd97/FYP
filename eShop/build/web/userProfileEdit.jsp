<%-- 
    Document   : userProfileEdit
    Created on : May 9, 2019, 9:14:59 PM
    Author     : acer
--%>

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="container">
	<h2>Update Profile:</h2>
	
	    
                       <%

                            String username=(String)session.getAttribute("username");

                                try {
                                    
                                   
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/"
                                            + "myproject?zeroDateTimeBehavior=convertToNull", "root", "");

                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM user where username= ?");
                                  ps.setString(1, username);

                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {
                                        
                                      
             
                                        String name = rs.getString("name");
                                        String email = rs.getString("email");
         
                                        String address = rs.getString("address");
                                        String password = rs.getString("password"); 
                                       
          
                                       
           
                                        
          
               
               
               %>
			<div class="signup-header">
	 	<h2> <%= username %> </h2>
	 </div>

	 <form method="post" action="userProfileEditProcess.jsp">
	 
	
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<%= name %>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>email</label>
	 		<input type="text" name="email" value="<%= email %>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Address</label>
	 		<input type="text" name="address" value="<%= address %>" required>
	 	</div>
                
                <div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" value="<%= password %>" required>
	 	</div>
	 	
	 	<div class="signup-group">
			
                      <input  type="submit" value="update"/>
		</div>
	 </form>
                                
                                <%}
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                              %>     
                                
			</table>
		
        
        
		 </div>
<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>