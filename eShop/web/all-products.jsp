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
 					<h2 style="text-align: center;">All Products</h2><br>
 					
 					<h5>Sort by(Price):</h5>
					<form action="Controller" method="get" style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="all-products">
					<select name="sort">
					<option value="low-to-high">Low to high</option>
					<option value="high-to-high">high to low</option>
					</select>
					<input type="submit" value="Go!">
					</form>
 					
                                </div>
                                
                                <h2> All Products </h2>
                                                 
                   <div class="col-md-12">                    
		 <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th>Image</th>
			<th>Name</th>
			<th>Price</th>
			<th>Option</th>
		</tr>
	
 					<c:forEach items="${list }" var="product">
                                             
                                                 
 						
 						<c:if test="${product.getFeatured() == 'yes' }">
 							
		 					
                                                            <tr>
                                          <td style="width: 100px;"><img src="${product.getImage() }" height="100" width="150"  class="img-responsive"  ></td>                      
					
                                        <td style="width: 100px;"><c:out value="${product.getName() }"></c:out></td>
					<td style="width: 100px;"> <c:out value="RM${ product.getPrice() }"></c:out>.00</td>
                                        <td style="width: 100px;"><button type="button" ><a class="btn btn-primary" href="Controller?page=addtocart&action=index&id=<c:out value="${product.getId()}"/>">Add to Cart</a></button> <br></td>

		 						
		 				</tr></c:if>
		 				 </c:forEach>	
 					</table>		
 					</div>	
 					
						
 			
 			</div>
 		</div></div>
 	
	
</body>	
	<jsp:include page="footer.jsp"></jsp:include>
	

</html>