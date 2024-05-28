<%-- 
    Document   : searchUser
    Created on : Jun 25, 2019, 3:11:38 PM
    Author     : acer
--%>

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>



<jsp:include page="header.jsp"></jsp:include>
	
	<div class="tiazon-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-4"><!-- left -->
 						<div class="list-group"><!-- products -->
						  <a href="Controller?page=all-products" class="list-group-item" style="background:  #d6d4d3;">
						    All Products
						  </a>
						  <a href="Controller?page=mobiles" class="list-group-item">Mobiles</a>
						  <a href="Controller?page=laptops" class="list-group-item">Laptops</a>
						  <a href="Controller?page=clothing" class="list-group-item">Clothing</a>
						  <a href="Controller?page=home-decor" class="list-group-item">Furniture</a>
						</div> 
 				</div><!-- left -->

 				<div class="col-md-8"><!-- right -->
 					
                                     <%
            int result;
            String username = request.getParameter("username");
            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/myproject?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

            if (request.getParameter("save") != null) {

                String sql = "select * from user where username=?";
                PreparedStatement myPS = myConnection.prepareStatement(sql);
                myPS.setString(1, username);

                ResultSet rs = myPS.executeQuery();

        %>



        <div class="well" style=" margin-top: 50px">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th> Name</th>
                        <th>user ID </th>
                        <th></th>
                    
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("username")%></td>
                        <td>
                            <a class="badge badge-danger my-0" href="pDetail.jsp?IDnum=<%= rs.getString(3)%>">Detail</a>
                        </td>
                          <td>
                            <a class="badge badge-danger my-0" href="processDelete.jsp?IDnum=<%= rs.getString(3)%>" onclick="return confirm('Are you sure want to delete this record?');">Delete</a>
                        </td>

                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <%
        } else {
                String sql = "select * from user";
                PreparedStatement myPS = myConnection.prepareStatement(sql);


                ResultSet rs = myPS.executeQuery();
        %>  
         <div class="well" style=" margin-top: 50px">
            <table class="table table-hover">
                <thead>
                    <tr>
                           <th>Email</th>
                        <th> Name</th>
                        <th>user ID </th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {%>
                    <tr>
                          <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("username")%></td>
                        <td>
                            <a class="badge badge-danger my-0" href="pDetail.jsp?IDnum=<%= rs.getString(3)%>">Detail</a>
                        </td>
                        <td>
                            <a class="badge badge-danger my-0" href="processDelete.jsp?IDnum=<%= rs.getString(3)%>" onclick="return confirm('Are you sure want to delete this record?');">Delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>

        <%
            }
        %>   
                                    
                                    
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
</body>	
<jsp:include page="footer.jsp"></jsp:include>
	

</html>





