<%-- 
    Document   : error
    Created on : 22/10/2014, 04:30:58 PM
    Author     : Roy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matricula - Error</title>
        <link rel="icon" type="image/png" href="assets/imagenes/iconoMF.png" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="assets/js/kickstart.js"></script> <!-- KICKSTART -->
        <link rel="stylesheet" href="assets/css/kickstart.css" media="all" /> <!-- KICKSTART -->
        <link rel="stylesheet" href="assets/css/Basico.css" type="text/css"/>
        <script>
            $(document).ready(function() {
                $("#listarCurso").removeClass("current");
                $("#crearCurso").removeClass("current");
                $("#modificarCurso").removeClass("current");
                $("#eliminarCurso").removeClass("current");
            });
        </script>
    </head>
    <body>
        <div id="Contenedor">
            <%@include file="template/CabeceraT.jsp" %>
            <%@include file="template/MenuLateralT.jsp" %>
            <div id="ContenidoCentral">
                <%
                    if (request.getParameter("mensaje") != null) {
                %>
                <h3 id="MensajeBienvenida">Error</h3><br>
                <!-- Caption -->
                Ha ocurrido un error:<br>
                <p style="color: red;font-size: 15px"><%= request.getParameter("mensaje")%></p>
                <%
                    }
                %>
            </div>
            <label style="text-align: center;color: transparent">-----***PRUEBAS DE SOFTWARE***-----</label>
            <%@include file="template/footer.jsp" %>
        </div>
    </body>
</html>

