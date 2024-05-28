<%-- 
    Document   : userProfileEdit2
    Created on : May 11, 2019, 4:28:17 AM
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
	
	<div class="signup-header">
	 	<h2>Edit Product</h2>
	 </div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="edit_profile">
	 <input type="hidden" name="username" value="<c:out value="${u.getUsername() }"/>">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<c:out value="${u.getName() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="text" name="email" value="<c:out value="${u.getEmail() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="address" value="<c:out value="${u.getAddress() }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
			<input type="submit" value="update">	 
		</div>
	 </form>
	
	
</body>

<footer  >
		<div class="footer"> &copy;kedaiUMT e-Shop
	      <a href="Controller?page=index"> kedaiUMT.com</a>
	    </div>
	</footer>
</html>
