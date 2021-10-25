package com.learn.mycart.servlate;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.P_Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "ProductOperationServlate", urlPatterns = {"/ProductOperationServlate"})
public class ProductOperationServlate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op = request.getParameter("operation");

            if (op.trim().equals("category")) {
                //fetch category details
                String catTitle = request.getParameter("catTitle");
                String catDescription = request.getParameter("catDecription");

                //P_Category object created
                P_Category category = new P_Category();
                category.setCategoryTitle(catTitle);
                category.setCategoryDescription(catDescription);

                CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());

                int catId = dao.saveCategory(category);

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category Successfully saved" + "CategoryID" + catId);
                response.sendRedirect("admin.jsp");
//                out.println("Saved Category ID  : "+catId);
                return;

            } // addProduct  form data
            else if (op.trim().equals("product")) {
                //fetch products details from form
                System.out.println("Product form method called");

                String pName = request.getParameter("product_name");
                String pDesc = request.getParameter("prodcut_description");
                int pPrice = Integer.parseInt(request.getParameter("product_price"));
                int pDiscount = Integer.parseInt(request.getParameter("prodcut_discount"));
                int pQuantity = Integer.parseInt(request.getParameter("product_quantity"));
                int pCategoryId = Integer.parseInt(request.getParameter("prodcut_category_id"));
                Part part = request.getPart("product_pic");

                Product product = new Product();

                product.setProductName(pName);
                product.setProductDescription(pDesc);
                product.setProductPrice(pPrice);
                product.setProductDiscount(pDiscount);
                product.setProducctQuantity(pQuantity);
                product.setProductPhoto(part.getSubmittedFileName());

                //get category by id from database
                CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
                P_Category category = cdo.getCategoryById(pCategoryId);
                System.out.println("get category");
                product.setCategory(category); //set product category 
                System.out.println("set category in product");

                // save product
                ProductDao Pdao = new ProductDao(FactoryProvider.getFactory());

                Pdao.saveProduct(product);

                //pic Upload folder and databse
                try {

                    String path = request.getRealPath("img") + File.separator + "product" + File.separator + part.getSubmittedFileName();
                    System.out.println("Path: "+path);
                    //uploading code
                    FileOutputStream fos = new FileOutputStream(path);

                    InputStream is = part.getInputStream();

                    //data reading
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Product Successfully saved");
                response.sendRedirect("admin.jsp");
                return;

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
