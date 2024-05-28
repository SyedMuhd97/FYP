<%-- 
    Document   : adminApproveProductForm
    Created on : Jun 23, 2019, 3:18:19 AM
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
        
          <%

                          String id=request.getParameter("id");

                                try {
                                    
                                   
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/"
                                            + "myproject?zeroDateTimeBehavior=convertToNull", "root", "");

                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM userregisterproduct where id= ?");
                                  ps.setString(1, id);

                                    ResultSet rs = ps.executeQuery();

                                    while (rs.next()) {
                                        
                                      
             
                                        String name = rs.getString("name");
                                        String price = rs.getString("price");
                                        String qty = rs.getString("qty");
         
                                        String category = rs.getString("category");
                                        String image = rs.getString("image"); 
                                       
          
                                       
           
                                        
          
               
               
               %>

               
           
	
	<div class="signup-header">
	 	<h2>Add User Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="approve_Product">
	 <input type="hidden" name="id" value="<c:out value="<%= id %>"/>">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<c:out value="<%= name %>"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="price" value="<c:out value="<%= price %>"></c:out>" required>
	 	</div>
                
                <div class="signup-group">
	 		<label>Quantity</label>
	 		<input type="text" name="qty" value="<c:out value="<%= qty %>"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
                                    <input list="category" name="category" value="<c:out value="<%= category %>"></c:out>" required>
<datalist id="category">
  <option value="mobiles" >
  <option value="laptops">
   <option value="clothing" >
  <option value="home decor">   
</datalist>        
	 	</div>
	 	
	 	
	 		

	 	<div class="signup-group">
	 		<label>Image</label>
	 		<img style="height: 160px;width: 160px;" src="<c:out value="<%= image %>"></c:out>">
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Add">	 
		</div>
	 </form>
	
	

               
                  <%}
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                              %> 
      </body>                        
                              
<footer  >
		<div class="footer"> &copy;kedaiUMT e-Shop
	      <a href="Controller?page=index"> kedaiUMT.com</a>
	    </div>
	</footer>
</html>