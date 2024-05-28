<%-- 
    Document   : report
    Created on : May 11, 2019, 12:10:33 AM
    Author     : acer
--%>
<%@page import=" java.sql.*" %>
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
	
         <form class="form-inline" method="post" action="report.jsp">
                <input type="text" name="userId" class="form-control" placeholder="Search Seller ID">
                <input type="submit" name="save" class="btn btn-primary ml-2" placeholder="Search">
            </form> 
        <%
            int result;
            String userId = request.getParameter("IDnum");
            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/myproject?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

            if (request.getParameter("save") != null) {

                String sql = "select * from product where userId=?";
                PreparedStatement myPS = myConnection.prepareStatement(sql);
                myPS.setString(1, userId);

                ResultSet rs = myPS.executeQuery();

        %>
	<div class="container">
	<h2>Report </h2>
		   <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th>username</th>
                        <th> Product id</th>
			<th>product name</th>
			<th>Price </th>
			
		</tr>
	
		
		 
		
		  	
				
                    <%while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString("userId")%></td>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                         <td>RM<%= rs.getString("price")%>.00</td>
                    </tr>
                    <% }%>
                
                                
                          
                                
			</table>
		
        
        
		 </div>
         <%
        } else {
                String sql = "select * from user";
                PreparedStatement myPS = myConnection.prepareStatement(sql);


                ResultSet rs = myPS.executeQuery();
        %>  
        
         <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th>username</th>
                        <th> Product id</th>
			<th>product name</th>
			<th>Price </th>
			
		</tr>
	
		
		 
		
		  	
				
                    <%while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString("userId")%></td>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                         <td>RM<%= rs.getString("price")%>.00</td>
                    </tr>
                    <% }%>
                
                                
                          
                                
		             <% }%>
           
            </table>
        </div>

        <%
            
        %>
<jsp:include page="adminFooter.jsp"></jsp:include>
	
</body>
</html>