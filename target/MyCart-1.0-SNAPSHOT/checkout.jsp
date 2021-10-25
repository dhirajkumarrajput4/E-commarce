<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not loged in !! Login first for Order products");
        response.sendRedirect("login.jsp");
        return;
    }


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
        <%@include file="Component/comman_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Component/navbar.jsp"%>

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--card--> 
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Your selected items</h3>
                            <div class="cart-body"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <!--card--> 
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Add your details</h3>
                            <form action=" " method="">
                                <div class="form-group">
                                    <label for="Email1">Your name</label>
                                    <input type="text" value="<%=user.getUserName()%>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="Email1">Email address</label>
                                    <input type="email" value="<%=user.getUserEmail()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="Phone">Mobile</label>
                                    <input type="tel" value="<%=user.getUserPhone()%>" class="form-control" id="tel" aria-describedby="emailHelp" placeholder="Enter Phone" name="phone">
                                </div>
                                <div class="form-group">
                                    <label for="address">Your shipping address</label>
                                    <textarea class="form-control" value="<%=user.getUserAddress()%>" placeholder="Enter your address" id="address" rows="3" name="address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <%@include file="Component/comman_bootstrap_modal.jsp"%>
    </body>
</html>