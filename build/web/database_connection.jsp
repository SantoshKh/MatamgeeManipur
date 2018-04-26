<%-- 
    Document   : database_connection
    Created on : 27 Feb, 2015, 10:03:41 PM
    Author     : SK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/socialnetwork","root","root");
    </body>
</html>
