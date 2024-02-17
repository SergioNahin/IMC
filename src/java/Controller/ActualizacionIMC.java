package Controller;

import Model.DatosUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sergio Trinidad
 */
@WebServlet(name = "ActualizacionIMC", urlPatterns = {"/ActualizacionIMC"})
public class ActualizacionIMC extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession sesion = request.getSession(false);
        if (sesion.getAttribute("usuario") != null) {
            String nombre = (String) sesion.getAttribute("usuario");
            float alturaf = Float.parseFloat(request.getParameter("estatura"));
            float pesof = Float.parseFloat(request.getParameter("peso"));

            float IMCf = pesof / (alturaf * alturaf);

            request.setAttribute("IMC", IMCf);
            float IMC = (float) request.getAttribute("IMC");

            // Obtén la fecha actual
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fecha = sdf.format(new Date());

            DatosUsuario co = new DatosUsuario();
            DatosUsuario ac = new DatosUsuario();

            if (co.actualizarIMC(nombre, alturaf, pesof, IMCf, fecha)
                    && ac.historialIMC(nombre, alturaf, pesof, IMCf, fecha)) {

                response.sendRedirect("IMC.jsp");
            } else {
                response.sendRedirect("NuevoIMC.jsp");
            }

        } else {
            // Lógica para manejar el caso en que el usuario no está autenticado
            response.sendRedirect("index.jsp");
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
