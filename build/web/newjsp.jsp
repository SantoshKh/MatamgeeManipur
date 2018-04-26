<%-- 
    Document   : newjsp
    Created on : 27 Feb, 2015, 9:16:15 AM
    Author     : SK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! double pi=3.14;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String mess="good morning";%>
        <h1>Hello World!</h1>
        <%=mess%>
        <%=pi%>
    </body>
</html>
