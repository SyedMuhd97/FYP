<%-- 
    Document   : adminApproveProduct
    Created on : May 10, 2019, 2:30:00 PM
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
	<h2>Register Product List:</h2>
		   <table style="table-layout: fixed;width: 100%;">
			
                       <tr>
			<th>ID</th>
			<th>Product Name</th>
			<th>Category</th>
                        <th>Quantity</th>
                        <th>price</th>
			
                       
			<th>Available</th>
                        <th>Seller ID</th>
                        <th>Image</th>
                        <th>Product Status</th>
			<th>Action</th>
		</tr>
	    
                       <%

                            

                                try {
                                    
                                   
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/"
                                            + "myproject?zeroDateTimeBehavior=convertToNull", "root", "");

                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM userregisterproduct ");
                                 

                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {
                                        
                                      
                                         int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        String category = rs.getString("category");
         
                                        String qty = rs.getString("qty");
                                        String price = rs.getString("price"); 
                                        String featured = rs.getString("featured");
                                         String userId = rs.getString("userId");
                                         
          
                                        String image = rs.getString("image");
                                        String pRegisterStatus= rs.getString("pRegisterStatus");
          
                                       
           
                                        
          
               
               
               %>
				<tr>	
                                    <td style="width: 50px;"><%= id%></td>
					<td style="width: 50px;"><%= name%></td>
					<td style="width: 50px;"><%= category%></td>
					<td style="width: 50px;"><%= qty%></td>
                                        <td style="width: 50px;"><%= price%></td>
                                        <td style="width: 50px;"><%= featured%></td>
                                       <td style="width: 50px;"><a href="admin/index.jsp"> <%= userId%></a></td>
                                        <td style="width: 50px;"><%= image%></td>
					    <td style="width: 50px;"><%= pRegisterStatus%></td>
                                            <td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=toApproveproduct&id=${row.id}" style="color: #6bb1f8;">Approve </a> ||
		<a href="<%= request.getContextPath() %>/admin?page=toRemoveApproveproduct&id=${row.id}" style="color:#6bb1f8;" onclick="return confirm('Are you sure to delete this product?')">Remove</a></td>
			  	</tr>
                                
                                <%}
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                              %>     
                                
			</table>
		
        
        
		 </div>
<jsp:include page="adminFooter.jsp"></jsp:include>
	
</body>
</html>
