<%-- 
    Document   : search
    Created on : Jun 25, 2019, 8:30:37 AM
    Author     : acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Custom styles for this template -->
        <link href="css/business-frontpage.css" rel="stylesheet">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css" type="text/css"/>

    </head>
    <style>
        body {
            font-family: arial;
        }
    </style>
    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #ff4d4d">
           
        </nav>
        <div class="container mt-5">
            <form class="form-inline" method="post" action="search.jsp">
                <input type="text" name="id" class="form-control" placeholder="Search No Matrics">
                <input type="submit" name="save" class="btn btn-primary ml-2" placeholder="Search">
            </form>
        </div>
        <%
            int result;
            String id = request.getParameter("IDnum");
            Class.forName("com.mysql.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/myproject";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

            if (request.getParameter("save") != null) {

                String sql = "select * from user where id=?";
                PreparedStatement myPS = myConnection.prepareStatement(sql);
                myPS.setString(1, id);

                ResultSet rs = myPS.executeQuery();

        %>



        <div class="well" style=" margin-top: 50px">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>ID Number</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("id")%></td>
                        <td>
                            <a class="badge badge-danger my-0" href="MemberDetail.jsp?IDnum=<%= rs.getString(3)%>">Detail</a>
                        </td>
                        <td>
                            <a class="badge badge-danger my-0" href="processMemDelete.jsp?IDnum=<%= rs.getString(3)%>" onclick="return confirm('Are you sure want to delete this record?');">Delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <%
        } else {
                String sql = "select * from user";
                PreparedStatement myPS = myConnection.prepareStatement(sql);


                ResultSet rs = myPS.executeQuery();
        %>  
         <div class="well" style=" margin-top: 50px">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>ID Number</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {%>
                    <tr>
                          <td><%= rs.getString("id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("username")%></td>
                        <td>
                            <a class="badge badge-danger my-0" href="MemberDetail.jsp?IDnum=<%= rs.getString(3)%>">Detail</a>
                        </td>
                        <td>
                            <a class="badge badge-danger my-0" href="processMemDelete.jsp?IDnum=<%= rs.getString(3)%>" onclick="return confirm('Are you sure want to delete this record?');">Delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>

        <%
            }
        %>
    </body>
</html>
