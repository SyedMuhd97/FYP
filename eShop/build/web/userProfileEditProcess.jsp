<%-- 
    Document   : userProfileEditProcess
    Created on : May 11, 2019, 3:30:44 AM
    Author     : acer
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JOptionPane"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <jsp:useBean id="u" class="com.beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
       
        try {
            int status = 0;
            
            String username=(String)session.getAttribute("username");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String password=request.getParameter("password");
        
                                 Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/"
                                            + "myproject?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement ps = con.prepareStatement("update user set name=?,email=?,address=?,password=? where username=?");
            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, password);
          
            ps.setString(5, username);
            status = ps.executeUpdate();
            
            if(status >0){
                JOptionPane.showMessageDialog(null, "Succesfully update", "Info", JOptionPane.INFORMATION_MESSAGE);
                response.sendRedirect("index.jsp");
            }
            else{
                JOptionPane.showMessageDialog(null, "Unable to update", "Info", JOptionPane.INFORMATION_MESSAGE);
                response.sendRedirect("index.jsp");
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
%>
    </body>
</html>

