/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinkpad-Falcort
 */
public class ConnexionPage extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConnexionPage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConnexionPage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        Boolean connected = false;
        Boolean id = false;
        Boolean isLogged = false;

        for (int i =0; i < cookies.length; i++)
        {
            Cookie cookieTmp = cookies[i];
            if (cookieTmp.getName().equals("id"))
            {
                id = true;
            }
            if (cookieTmp.getName().equals("isLogged"))
            {
                isLogged = true;
            }
        }
        if(id && isLogged)
        {
            connected = true;
            response.sendRedirect(request.getContextPath() + "/");
        }
        else
        {
            this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);   
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        Boolean connected = false;
        Boolean id = false;
        Boolean isLogged = false;

        for (int i =0; i < cookies.length; i++)
        {
            System.out.println(i);
            Cookie cookieTmp = cookies[i];
            if (cookieTmp.getName().equals("id"))
            {
                System.out.println("ID TROUVER");
                id = true;
            }
            if (cookieTmp.getName().equals("isLogged"))
            {
                System.out.println("LOGG TROUVER");
                isLogged = true;
            }
        }
        if(id && isLogged)
        {
            connected = true;
            response.sendRedirect(request.getContextPath() + "/");
        }
        else
        {
            this.getServletContext().getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);   
        }
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
