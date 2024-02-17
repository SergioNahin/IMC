package Controller;

import Model.DatosUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sergio Trinidad
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String nombre = request.getParameter("usuario");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String genero = request.getParameter("genero");
        String altura = request.getParameter("estatura");
        float alturaf = Float.parseFloat(altura);
        String peso = request.getParameter("peso");
        float pesof = Float.parseFloat(request.getParameter("peso"));
        String fecha = request.getParameter("fecha");
        String password = request.getParameter("password");

        DatosUsuario co = new DatosUsuario();
        DatosUsuario ac = new DatosUsuario();

        float IMCf = pesof / (alturaf * alturaf);

        request.setAttribute("IMC", IMCf);
        float IMC = (float) request.getAttribute("IMC");

        if (co.registrar(nombre, apellido, edad, genero, alturaf, pesof, IMC, fecha, password)
                && ac.historialIMC(nombre, alturaf, pesof, IMCf, fecha)) {
            response.sendRedirect("IMC.jsp");

        } else {
            response.sendRedirect("RegistroU.jsp");
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
