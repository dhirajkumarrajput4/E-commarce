<%@page import="com.learn.mycart.entities.User"%>

<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not loged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin ! Your are not access this page");
            response.sendRedirect("login.jsp");
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel-Products</title>
        <style>
            body{
                background:#e2e2e2!important;
            }
            
        </style>
        
        <%@include file="Component/comman_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Component/navbar.jsp"%>
        
        <h1>Hello World!</h1>
        
        
        <%@include file="Component/comman_bootstrap_modal.jsp" %>
    </body>
</html>
