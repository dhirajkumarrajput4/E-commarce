<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="Component/comman_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Component/navbar.jsp"%>

        <div class="container-fluid px-9">

            <div class="row mt-1">
                <div class="col-md-5 offset-md-4">

                    <div class="card px-10">

                        <%@include file="Component/message.jsp"%>   
                        
                        <%  HttpSession httpsession = request.getSession();
                            httpsession.removeAttribute("message");
                        %>
                        <div class="card-body ">
                            <div class="container text-center">
                                <img alt="SignUp" src="img/Signup.png">
                            </div>

                            <h3 class="text-center my-1">Sing up here!!</h3>
                            <form action="RegisterServlate" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           placeholder="Enter here" required>
                                </div>    
                                <div class="form-group">
                                    <label for="name">User Email</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           placeholder="Enter here" required>
                                </div>

                                <div class="form-group">
                                    <label for="name">User Password</label>
                                    <input type="password" class="form-control" id="password" name="password" 
                                           placeholder="Enter here" required>
                                </div>
                                <div class="form-group">
                                    <label for="name">User Phone</label>
                                    <input type="number" class="form-control" id="phone" name="phone" 
                                           placeholder="Enter here" required>
                                </div>
                                <div class="form-group">

                                    <label for="name">User Address</label>
                                    <textarea style="height: 150px" class="form-control" placeholder="Enter your address" name="address" required></textarea>
                                </div>
                        </div>
                        <div class="container text-center mt-0">
                            <button class="btn btn-outline-success">Register</button> 
                            <button class="btn btn-outline-warning">Reset</button> 
                        </div>


                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
</body>
</html>
