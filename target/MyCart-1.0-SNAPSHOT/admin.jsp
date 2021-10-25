
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.P_Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
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

    CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
    List<P_Category> list = categorydao.getCategory();
    
//getting count
Map<String,Long> map=Helper.getCounts(FactoryProvider.getFactory());



        

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <style>
            body{
                background:#e2e2e2!important;
            }
            
        </style>
        
        <%@include file="Component/comman_css_js.jsp"%>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>

        <div class="container admin">
            <div id="map">
                <%@include file="Component/message.jsp"%>      <!-- message for saved data-->
                <%  HttpSession httpsession = request.getSession();
                    httpsession.removeAttribute("message");
                %>
                <!--First Row of container-->

                <div class="row mt-3">
                    <div class="col-4">
                        <!--first cart-->
                        <div class="card" data-toggle="tooltip" data-placement="left" title="Total Users">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/Users.png" alt="user_icon">
                                </div>
                                <h1><%=map.get("userCount")%></h1>
                                <h2 class="text-uppercase text-muted">Users</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" data-toggle="tooltip" data-placement="bottom" title="Total Categories">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/list.png" alt="user_icon">
                                </div>
                                <h1><%=list.size()%></h1>
                                <h2 class="text-uppercase text-muted">Category</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" data-toggle="tooltip" data-placement="right" title="Total Products">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/product.png" alt="user_icon">
                                </div>
                                <h1><%=map.get("productCount")%></h1>
                                <h2 class="text-uppercase text-muted">Products</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Second row of container-->
                <div class="container container-fluid">
                    <div class="row mt-3">
                        <div class="col-md-6">

                            <div class="card" data-toggle="modal" data-target="#add_category">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/calculator.png" alt="user_icon">
                                    </div>
                                    <p class="mt-2">Click here to add new category</p>
                                    <h2 class="text-uppercase text-muted">Add Category</h2>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">

                            <div class="card" data-toggle="modal" data-target="#add_product">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/plus.png" alt="user_icon">
                                    </div>
                                    <p class="mt-2">Click here to add new products</p>
                                    <h2 class="text-uppercase text-muted">Add Product</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Thierd row-->
                
                <!--View Products-->
                <div class="row mt-3">
                    <div class="col-md-12">

                        <div class="card" onclick="window.location='viewproducts.jsp'" data-toggle="tooltip" data-placement="top" title="Click to view Products">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 80px;" class="img-fluid rounded-circle" src="icons/view.png" alt="user_icon">
                                    </div>
                                    <p class="mt-2">Click here to view all the Products</p>
                                    <h2 class="text-uppercase text-muted">View Products</h2>
                                </div>
                            </div>

                        </div>
                </div>
            </div>



            <!--Add Category model-->

            <!-- Modal -->
            <div class="modal fade" id="add_category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!--category form-->

                            <form action="ProductOperationServlate" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="operation" value="category">

                                    <input type="text" class="form-control" name="catTitle" placeholder="Enter category title here" required>

                                </div>
                                <div class="form-group">
                                    <textarea style="height: 200px;" class="form-control"placeholder="Enter category decription" name="catDecription" required></textarea>      
                                </div>
                                <div class="cantainer text-center">
                                    <button class="btn btn-outline-success">Add Category</button>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>

            <!--End add category model-->  




            <!--Add Product Model-->
            <!--Model-->

            <div class="modal fade" id="add_product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content ">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!--Add product form-->

                            <form action="ProductOperationServlate" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="operation" value="product">
                                    <input type="text" class="form-control" name="product_name" placeholder="Enter prodcut name here" required>
                                </div>
                                <div class="form-group">
                                    <textarea style="height: 100px;" class="form-control"placeholder="Enter category decription" name="prodcut_description" required></textarea>      
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="product_price" placeholder="Enter prodcut price here" required>

                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="prodcut_discount" placeholder="Enter prodcut discount here" required>

                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="product_quantity" placeholder="Enter prodcut quantity here" required>

                                </div>

                                <!--Retrieve Category from database-->

                                <!--This is available on top-->
                                <%
    //                                CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
    //                                List<P_Category> list = categorydao.getCategory();
                                %>

                                <div class="form-group">
                                    <select name="prodcut_category_id" class="form-control">
                                        <option value="">Select Category</option>
                                        <%                                        for (P_Category c : list) {
                                        %>

                                        <option value="<%=c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option> 

                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="product_pic">Product pic</label><br>
                                    <input type="file" id="product_pic" name="product_pic" required>
                                </div>

                        </div>

                        <div class="cantainer text-center mb-3 mt-0">
                            <button class="btn btn-outline-success">Add product</button>
                        </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--End add product model-->
 <script>
    
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
</body>
</html>
