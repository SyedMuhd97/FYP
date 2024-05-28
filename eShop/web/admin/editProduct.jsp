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
	 	<h2>Edit Product</h2>
	 </div>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="edit_product">
	 <input type="hidden" name="id" value="<c:out value="${p.getId() }"/>">
     
	 	<div class="signup-group">
	 		<label>Name</label>
	 		<input type="text" name="name" value="<c:out value="${p.getName() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Price</label>
	 		<input type="number" name="price" value="<c:out value="${p.getPrice() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
                                    <input list="category" name="category" value="<c:out value="${p.getCategory() }"></c:out>" required>
<datalist id="category">
  <option value="mobiles" >
  <option value="laptops">
   <option value="clothing" >
  <option value="home decor">   
</datalist>        
	 	</div>
	 	
	 	
	 		<label>Availability</label>
                        <br>   <input type="radio" name="featured" value="yes" checked> yes<br>
  <input type="radio"  name="featured" value="no"> no<br>         

	 	</div>         
                     

	 	</div>
	 	<div class="signup-group">
	 		<label>Image</label>
	 		<img style="height: 160px;width: 160px;" src="<c:out value="${p.getImage() }"></c:out>">
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Process">	 
		</div>
	 </form>
	
	
</body>

<footer  >
		<div class="footer"> &copy;kedaiUMT e-Shop
	      <a href="Controller?page=index"> kedaiUMT.com</a>
	    </div>
	</footer>
</html>