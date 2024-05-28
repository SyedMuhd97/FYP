<%-- 
    Document   : header.jsp
    Created on : May 9, 2019, 4:30:05 PM
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

       <header> 
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
            
		<h1>
			<a href="#">kedaiUMT e-Shop</a>
		</h1>
		<nav>
			<ul>
				
				<c:choose>
					<c:when test="${session == null}">
                                                <li><a href="indexRumah.jsp">Home</a></li>
						<li><a href="Controller?page=login">Login</a></li>
						<li><a href="Controller?page=sign-up">Sign-up</a></li>
                                              
                                                
					</c:when>
					<c:when test="${session != null}">
                                                 <li><a href="Controller?page=index">Home</a></li>
                                               <li><a href="userProfile.jsp"><c:out value="${username }"></c:out></a></li>
                                               <li> <a href="userProfileEdit.jsp" >Update My Profile</a></li>
                                               
                                               <li> <a href="Controller?page=userRegisterProduct">Sell Product</a></li>
						  <li><a href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
                                                 <li><a href="Controller?page=logout" style="color: greenyellow;" onclick="return confirm('Are you sure to logout?')">Logout</a></li>
					</c:when>
                                                 	
						
                                                
				</c:choose>
				
			</ul>
		</nav>
	</header>
                        
                        
                        	