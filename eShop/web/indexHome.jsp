<%-- 
    Document   : indexHome
    Created on : May 9, 2019, 4:46:11 PM
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
    <style>
        body {
    background-image: url("bimg/umt1.png");
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
}
    </style>

	<header>
		<h1>
				<a href="#">kedaiUMT e-Shop</a>
		</h1>
		<nav>
			<ul>
				
				<c:choose>
					<c:when test="${session == null}">
                                                 <li><a href="indexHome.jsp">Home</a></li>
						<li><a href="Controller?page=login">Student Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
                                        <li><a href="Controller?page=index">Home</a></li>
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a href="admin/login.jsp">Admin</a></li>
			</ul>
		</nav>
	</header>
 <div>	
  </div>
      
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>