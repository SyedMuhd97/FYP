<%-- 
    Document   : adminApprovePayment
    Created on : May 13, 2019, 9:57:10 PM
    Author     : acer
--%>
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
	
	 <sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/myproject" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from payment
		 
	   </sql:query>
	   
	  
	
	<div class="container">
	<h2>User List:</h2>
		   <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th> id</th>
                        <th>totalPrice</th>
			<th>buyerID</th>
			<th>paymentStatus</th>
			<th>receipt</th>
			
			<th>Action</th>
		</tr>
	
		
		 <c:forEach items="${result.rows }" var="row">
		
		  
				<tr>
					<td style="width: 50px;"><c:out value="${row.id }"></c:out></td>
                                        <td style="width: 100px;"><c:out value="${row.totalPrice}"/></td>
					<td style="width: 100px;"><c:out value="${row.userId}"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.paymentStatus }"></c:out></td>
					<td style="width: 100px;"><img src="${row.receipt}" height="100" width="150" ></td>
					
					<td style="width: 100px;"><a href="<%= request.getContextPath() %>/admin?page=aPayment&id=${row.id}" style="color: #6bb1f8;">Approve</a> ||
					<a href="<%= request.getContextPath() %>/admin?page=deletePayment&id=${row.id}" style="color:#6bb1f8;" onclick="return confirm('Are you sure to delete this product?')">delete</a></td>
				</tr>
                                
                              </c:forEach>   
                                
			</table>
		
        
        
		 </div>
<jsp:include page="adminFooter.jsp"></jsp:include>
	
</body>
</html>