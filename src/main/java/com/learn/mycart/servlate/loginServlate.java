package com.learn.mycart.servlate;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author apptech
 */
@WebServlet(name = "loginServlate", urlPatterns = {"/loginServlate"})
public class loginServlate extends HttpServlet {

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

            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            //Validation
            //Authanticating user
            UserDao userdao = new UserDao(FactoryProvider.getFactory());
            User user = userdao.getUserByEmailAndPassword(userEmail, userPassword);
//            System.out.println("User IS: "+user);

            HttpSession httpsession = request.getSession();

            if (user == null) {
                out.println("<h1>Invailid details</h1>");
                httpsession.setAttribute("message", "Invailed Details try again !!");
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("<h1>Wellcome " + user.getUserName() + "</h1>");
                out.println("<h1>Thank You for LogIn</h1>");

                //logedIn
                httpsession.setAttribute("current_user", user);
                if(user.getUserType().equals("admin"))
                {
                    //admin User
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal"))
                    {
                      // normal user
                        response.sendRedirect("normalUser.jsp");
                    }
                        
                else
                    {
                        out.println("We have not identified this type of User");
                    }

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
