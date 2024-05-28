<%-- 
    Document   : indexRumah
    Created on : May 11, 2019, 12:45:15 PM
    Author     : acer
--%>

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
 				

 				<div class="col-md-9"><!-- right -->
 					<h2 style="text-align: center;">Product</h2><br>
 					
 				
 					
 					<c:forEach items="${list }" var="product">
 						
 						<c:if test="${ product.getFeatured() == 'yes'}" >
 							
		 					<div class="col-md-3"  >
		 						<img src="${product.getImage() }"  height="200" width="200"><br>
		 						<div class="text-center"><a style="color: black;"><c:out value="${product.getName() }"></c:out></a></div>	
		 						<p style="text-align: center;">Rm  <c:out value="${ product.getPrice() }"></c:out>.00</p>
                                                                <div class="text-center"><a class="btn btn-primary" href="Controller?page=cartlogin">Add to Cart</a> <br></div><br>
		 					
                                                        </div><br>
 							
 						</c:if>
 						
 						
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
</body>	
<jsp:include page="footer.jsp"></jsp:include>
	

</html>