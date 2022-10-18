

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <fieldset style="background-color:#F8ECE0;border:6px groove #ccc;width:350px">
        <h1>Nueva Tarea</h1>
        <form action="PrincipalServlet" method="post">
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" name="id" value=""size="2"></td>
            </tr>
            <tr>
                <td>Tarea:</td>
                <td><input type="text" name="tarea"></td>
            </tr>
            
            <tr>
                <td></td>
                <td><input type="submit" value="Procesar"</td>
            </tr>
        </table>
        </form>
       
        </fieldset >
    
    </center>
    </body>
</html>
