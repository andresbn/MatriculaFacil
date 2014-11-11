/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.web.matriculaweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pe.com.core.dao.CursoDAO;
import pe.com.core.model.Curso;
import pe.com.web.matriculaweb.util.ConstantesWeb;

/**
 *
 * @author Roy Taza Rojas
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

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
        String accion = request.getParameter("action");

        switch (accion) {
            case ConstantesWeb.CREAR_CURSO:
                this.crearCurso(request, response);
                break;
            case ConstantesWeb.MODIFICAR_CURSO:
                this.modificarCurso(request, response);
                break;
            case ConstantesWeb.ELIMINAR_CURSO:
                this.eliminarCurso(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    protected void crearCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean b = true;
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

        CursoDAO cursoDAO = context.getBean(CursoDAO.class);
        Curso curso = new Curso();

        curso.setNombre(request.getParameter("txtNombre"));
        curso.setCodigo(request.getParameter("txtCodigo"));
        curso.setCreditos(Integer.parseInt(request.getParameter("txtCreditos")));
        curso.setRequisitos(request.getParameter("txtRequisitos"));
        curso.setCiclo(Integer.parseInt(request.getParameter("txtCiclo")));
        cursoDAO.save(curso);

        response.sendRedirect("CrearCurso.jsp?eee=" + b);
    }

    protected void modificarCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean b = false;

        Curso curso = new Curso();
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        CursoDAO cursoDAO = context.getBean(CursoDAO.class);

        curso.setIdCurso(Integer.parseInt(request.getParameter("txtIdCurso")));
        curso.setNombre(request.getParameter("txtNombre"));
        curso.setCodigo(request.getParameter("txtCodigo"));
        curso.setCreditos(Integer.parseInt(request.getParameter("txtCreditos")));
        curso.setRequisitos(request.getParameter("txtRequisitos"));
        curso.setCiclo(Integer.parseInt(request.getParameter("txtCiclo")));

        if (cursoDAO.update(curso)) {
            b = true;
        }

        response.sendRedirect("ModificarCurso2.jsp?eee=" + b + "&C=" + curso.getIdCurso());
    }

    protected void eliminarCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        CursoDAO cursoDAO = context.getBean(CursoDAO.class);
        Curso curso = new Curso();
        int codigo = Integer.parseInt(request.getParameter("C"));
        curso = cursoDAO.get(codigo);

        cursoDAO.delete(curso);
        response.sendRedirect("EliminarCurso.jsp");
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
