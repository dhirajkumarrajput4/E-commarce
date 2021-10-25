<%@page import="com.learn.mycart.entities.User"%>
<%
    User user2=(User)session.getAttribute("current_user");

    if(user2==null)
    {
        session.setAttribute("message", "You are not LogedIn !! Please LogedIn first !!");
        response.sendRedirect("login.jsp");
    }
    else
    {
        if(user2.getUserType().equals("admin"))
        {
            session.setAttribute("message", "Only normal User Access this page");
            response.sendRedirect("login.jsp");
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User Page</title>
        <%@include  file="Component/comman_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp"%>
        <h1>This is Normal User page</h1>
    </body>
</html>
