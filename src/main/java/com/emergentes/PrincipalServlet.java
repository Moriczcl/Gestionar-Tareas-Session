/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MoriczCL
 */
@WebServlet(name = "PrincipalServlet", urlPatterns = {"/PrincipalServlet"})
public class PrincipalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PrincipalServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PrincipalServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op=request.getParameter("op");
        if(op.equals("vaciar")){
        HttpSession ses =request.getSession();
        
        ses.invalidate();
        
        response.sendRedirect("index.jsp");
        }
        if(op.equals("eliminar")){
            int pos =-1;
            int buscado=-1;
            int id = Integer.parseInt(request.getParameter("id"));
            
            HttpSession ses=request.getSession();
            ArrayList<Tareas>lista=(ArrayList<Tareas>)ses.getAttribute("almacen");
            
            for(Tareas p:lista){
                pos++;
                if(p.getId()==id){
                    buscado=pos;
                }
            }
            lista.remove(buscado);
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String tarea =request.getParameter("tarea");
        
        Tareas tare=new Tareas();
        
        tare.setId(id);
        tare.setTarea(tarea);
        
        HttpSession ses=request.getSession();
        
        ArrayList<Tareas>lista=(ArrayList<Tareas>)ses.getAttribute("almacen");
        
        lista.add(tare);
        
        response.sendRedirect("pendientes.jsp");
        
    }

}
