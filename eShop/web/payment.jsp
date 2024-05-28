<%-- 
    Document   : payment
    Created on : May 11, 2019, 2:11:03 PM
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
	<jsp:include page="header.jsp"></jsp:include>
	 <% String userId =(String)session.getAttribute("username");%>
	<div class="signup-header">
	 	<h2>Make Payment</h2>
	 </div>

	 <form method="post" action="Controller">
	 <input type="hidden" name="page" value="make_payment">
     
	 	<div class="signup-group">
	 		<label>buyer ID</label>
	 		<input type="text" name="userId" value="<%= userId%>"   required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Total price</label>
	 		<input type="number" name="totalPrice" placeholder="product total price" required>
	 	</div>
	 <div class="signup-group">
	 		<label>Payment Detail</label>
	 		<input type="text" name="payDetail" placeholder="product payment detail" >
	 	</div>
	 	
	 
         
	 	<div class="signup-group">
	 		 <label for="fileupload"> Select an receipt to upload</label>
	 		<input type="file" name="receipt" required><br>
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Pay">	 
		</div>
	 </form>
	
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>