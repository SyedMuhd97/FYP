<%-- 
    Document   : userRegisterProduct2
    Created on : Jun 25, 2019, 11:15:42 AM
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
	<jsp:include page="adminHeader.jsp"></jsp:include>
	
	
	 
	
	   
	  
	
	<div class="container">
	<h2>User List:</h2>
		   <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th>Product id</th>
                        <th>Matric Number</th>
			<th>Name</th>
			<th>product status</th>
			
			
			<th>Action</th>
		</tr>
	
		
		           <%

                          String userId=request.getParameter("userId");

                                try {
                                    
                                   
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/"
                                            + "myproject?zeroDateTimeBehavior=convertToNull", "root", "");

                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM userregisterproduct where userId= ?");
                                  ps.setString(1, userId);

                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {
                                        
                                      
                                         String id = rs.getString("id");
                                        String name = rs.getString("name");
                                        String pRegisterStatus = rs.getString("pRegisterStatus");
                                       
         
                                      
                                       
          
                                       
           
                                        
          
               
               
               %>
		
		  	
				<tr>
					<td style="width: 50px;"><%= id %></td>
                                        <td style="width: 100px;"><%= userId %></td>
					<td style="width: 100px;"><%= name %></td>
					<td style="width: 100px;"><%= pRegisterStatus %></td>
					
					
					<td style="width: 100px;">
					<a href="<%= request.getContextPath() %>/admin?page=deleteUser&id=${row.id}" style="color:#6bb1f8;" onclick="return confirm('Are you sure to delete this user?')">delete</a></td>
				</tr>
                                
                           
                                
			</table>
		
         </div>
              <%}
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                              %> 
		
<jsp:include page="adminFooter.jsp"></jsp:include>
	
</body>
</html>