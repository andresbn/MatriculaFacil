<%@page import="pe.com.web.matriculaweb.util.ConstantesWeb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matricula</title>
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
                <h3 id="MensajeBienvenida">Bienvenido Administrador</h3><br>
                <!-- Caption -->
                <img src="assets/imagenes/matriculaFacil.png" style="margin-left: 10%"/>
            </div>
            <label style="text-align: center;color: transparent">-----***PRUEBAS DE SOFTWARE***-----</label>
            <%@include file="template/footer.jsp" %>
        </div>
    </body>
</html>