<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - MyCart</title>
        <%@include file="Component/comman_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>

        <div class="container">

            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">

                        <div class="card-header  custom-bg text-white">
                            <h3 class="text-center">Login here</h3>
                        </div>
                        <div class="card-body">
                            
                            <%@include file="Component/message.jsp"%>
                            
                             <%  HttpSession httpsession=request.getSession();
                                 httpsession.removeAttribute("message");
                             %>
                            <form action="loginServlate" method="post">
                                <div class="form-group ">
                                    <label for="Email1">Email address</label>
                                    <input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter email" name="email">

                                </div>
                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                                </div>

                                <a href="register.jsp" class="text-center d-block mb-3">New User click here</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </body> 
</html>
