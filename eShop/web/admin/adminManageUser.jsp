<%-- 
    Document   : adminManageUser
    Created on : May 9, 2019, 6:11:24 PM
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
        
             
      <div class="list-group">
            <form class="form-inline" method="post" action="admin/searchUser.jsp">
               <input type="text" name="username" /> &nbsp;
                <input type="submit" name="save" value="search"/>
            </form>
        </div>
	
	 <sql:setDataSource user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/myproject" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from user
		 
	   </sql:query>
	   
	  
	
	<div class="container">
	<h2>User List:</h2>
		   <table style="table-layout: fixed;width: 100%;">
			<tr>
			<th>User id</th>
                        <th>Matric Number</th>
			<th>Name</th>
			<th>Address</th>
			<th>email</th>
			
			<th>Action</th>
		</tr>
	
		
		 <c:forEach items="${result.rows }" var="row">
		
		  	
				<tr>
					<td style="width: 50px;"><c:out value="${row.id }"></c:out></td>
                                        <td style="width: 100px;"><c:out value="${row.username}"/></td>
					<td style="width: 100px;"><c:out value="${row.name }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.address }"></c:out></td>
					<td style="width: 100px;"><c:out value="${row.email}"/></td>
					
					<td style="width: 100px;">
					<a href="<%= request.getContextPath() %>/admin?page=deleteUser&id=${row.id}" style="color:#6bb1f8;" onclick="return confirm('Are you sure to delete this user?')">delete</a></td>
				</tr>
                                
                              </c:forEach>   
                                
			</table>
		
        
        
		 </div>
<jsp:include page="adminFooter.jsp"></jsp:include>
	
</body>
</html>