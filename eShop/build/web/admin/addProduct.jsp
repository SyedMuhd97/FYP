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
	
	<div class="signup-header">
	 	<h2>Add New Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="add_product">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" placeholder="product name goes here"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="number" min="0" max="12" name="price" placeholder="product price" required>
	 	</div>
         <div class="signup-group">
	 		<label>Quantity</label>
	 		<input type="number" min="0" max="12" name="qty" placeholder="product quantity" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
                                    <input list="category" name="category" placeholder="Product Category" required>
<datalist id="category">
  <option value="mobiles" >
  <option value="laptops">
   <option value="clothing" >
  <option value="home decor">   
</datalist>        
	 	</div>
	 	
	 
         
	 	<div class="signup-group">
	 		 <label for="fileupload"> Select an image to upload</label>
	 		<input type="file" name="image" required><br>
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	
		<jsp:include page="adminFooter.jsp"></jsp:include>
</body>
</html>