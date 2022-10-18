<%@page import="com.emergentes.Tareas"%>
<%@page import="java.util.ArrayList"%>
<% 
if(session.getAttribute("almacen")==null){
    ArrayList<Tareas>lisaux=new  ArrayList<Tareas>();
    session.setAttribute("almacen", lisaux);
    }
    
    ArrayList<Tareas>alm=(ArrayList<Tareas>)session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h1>Tareas Pendientes</h1>
        <fieldset style="background-color:#F7ECE0;border:5px groove #ccc;width:360px">
        <table border="1">
            <thead>
                <tr>
                    <th><a href="index.jsp">Pagina Principal</a></th>
                    <th><a href="nueva.jsp">Nueva Tarea</a></th>
                </tr>
            </thead>
        </table>
        
        </fieldset >
    <fieldset style="background-color:Beige;border:6px groove #ccc;width:350px">
        <legend><h3>Pendientes</h3></legend>
        <table border="2">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tarea</th>
                    <th>Completado</th>
                    <th>X</th>
                </tr>
            </thead>
            <%
            if(alm!=null) {
                for (Tareas p : alm) {       
            %>
            <tbody>
                <tr>
                    <td><%=p.getId() %></td>
                    <td><%=p.getTarea() %></td>
                    <td><input type="checkbox" name="lenguakje" value="id"></td>
                    <td><a href="PrincipalServlet?op=eliminar&id=<%=p.getId() %>">Eliminar</a></td>
                </tr>
            </tbody>
            <%
                }
            }
            %>
        </table>
    </fieldset> 
        <fieldset style="background-color:#F8ECE0;border:6px groove #ccc;width:350px">
        
        <a href="PrincipalServlet?op=vaciar">Borrar Todas las tareas</a>
       
        </fieldset >
    </center>
    </body>
</html>
