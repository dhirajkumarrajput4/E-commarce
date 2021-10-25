<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.P_Category"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>

        <!--Add css amd Java Script--> 
        <%@include file="Component/comman_css_js.jsp"%>

    </head>
    <body>
        <%@include file="Component/navbar.jsp"%>

        <div class="row mt-3 mx-1">
            
            <%  
                String c = request.getParameter("category");

                String val = request.getParameter("val");
                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                System.out.println("Value of c is  : " + c);

                //get all products
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;
                if (c == null || c.trim().equals("0")) {
                    list = dao.getAllProduct();
                } else {
                    //Retrive product by Category
                    int idc = Integer.parseInt(c.trim());
                    list = dao.getAllProductByCid(idc);

                }

                //get all category
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<P_Category> clist = cdao.getCategory();
            %>

            <div class="col-md-2 mt-3">
                <!--show Category-->
                <div class="row">
                    
                <div class="list-group">

                    <%
                        if (c == null || c.trim().equals("0")) {
                    %>
                    <a href="index.jsp?category=0" class="list-group-item list-group-item-action active">
                        ALL PRODUCTS
                    </a>
                    <%
                    } else {%>
                    <a href="index.jsp?category=0" class="list-group-item list-group-item-action">
                        ALL PRODUCTS
                    </a>
                    <%
                        }
                    %>



                    <%
                        //data retrieve  by for each loop
                        for (P_Category cat : clist) {

                            String string = String.valueOf(cat.getCategoryId());
//                        if(c.equalsIgnoreCase(string))
//                        {
                    %>

                    <a href="index.jsp?category=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action active"><%=cat.getCategoryTitle()%></a>

                    <%
//                    }
//                        else {
                    %>
                                        <!--<a href="index.jsp?category=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>-->
                    <%
                        }
//                        }

                    %>


                </div>
                    
                </div>  
                    
            </div>

            <div class="col-md-10">
                <!--show products-->

                <!--row-->
                <div class="row">
                    <div class="col md-12">

                        <div class="card-columns">
                            <!--travesing products-->
                            <%                                for (Product p : list) {
                            %>

                            <!--Product cart-->
                            <div class="card mt-3 product-card">
                                <div class="container text-center">

                                    <img class="card-img-top m-2" style="max-height: 200px;height: auto; max-width: 100%; width:auto;" src="img/product/<%=p.getProductPhoto()%>" alt="product_pic">

                                </div>
                                <div class="card-body">

                                    <h6 class="card-title"><%=p.getProductName()%></h6>
                                    <p class="card-text"><%=Helper.get10Word(p.getProductDescription())%></p>
                                </div>

                                <div class="card-footer">
                                    
                                    <div class="container text-center"> 
                                    <p><b>&#x20B9 <%=p.getPriceAfterApplyingDiscount()%>/-</b> <span class="text-secondary discount-lable">M.R.P - &#x20B9<del><%=p.getProductPrice()%></del> (<%=p.getProductDiscount()%>% off )</span></p>
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to card</button>
                                    <button class="btn btn-outline-success">Buy now</button>
                                    </div>
                                </div>
                            </div> 




                            <%
                                }

                                if (list.size() == 0) {
                                    out.println("<h3>Sorry !! No product available in this category</h3>");
                                }
                            %>
                        </div>
                    </div>


                </div>
            </div>

        </div>
             <%@include file="Component/comman_bootstrap_modal.jsp"%>
             
    </body>
</html>
