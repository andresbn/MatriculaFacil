<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pe.com.web.matriculaweb.util.ConstantesWeb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos - Crear</title>
        <link rel="icon" type="image/png" href="assets/imagenes/iconoMF.png" />
        <link rel="stylesheet" href="assets/css/Basico.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="assets/js/kickstart.js"></script> <!-- KICKSTART -->
        <link rel="stylesheet" href="assets/css/kickstart.css" media="all" /> <!-- KICKSTART -->
        <script>
            $(document).ready(function() {
                $("#listarCurso").removeClass("current");
                $("#crearCurso").addClass("current");
                $("#modificarCurso").removeClass("current");
                $("#eliminarCurso").removeClass("current");
            });
        </script>
    </head>
    <body>
        <%            boolean Exito = Boolean.parseBoolean(request.getParameter("eee"));
        %>
        <div id="Contenedor">
            <%@include file="template/CabeceraT.jsp" %>
            <%@include file="template/MenuLateralT.jsp" %>
            <div id="ContenidoCentral">
                <h3 id="MensajeBienvenida">Crear Curso</h3><br>
                <div style="padding-left: 20%">
                    <form name="frmCrearCurso" action="Controller" method="post">
                        <input type="hidden" name="action" value="<%= ConstantesWeb.CREAR_CURSO%>">
                        <table style="width: 60%">
                            <tr>
                                <td>
                                    <label for="txtNombre">Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="right">(Ej: Lenguaje1)</span></label>
                                </td>
                                <td>
                                    <input id="txtNombre" name="txtNombre" required type="text" maxlength="100" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtCodigo">Codigo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="right">(Ej: HU23)</span></label>
                                </td>
                                <td>
                                    <input id="txtCodigo" name="txtCodigo" required type="text" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtCreditos">Creditos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="right">(Ej: 3)</span></label>
                                </td>
                                <td>
                                    <input id="txtCreditos" name="txtCreditos" required type="number" min="1" max="6" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtRequisitos">Requisitos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="right">(Ej: HU20)</span></label>
                                </td>
                                <td>
                                    <input id="txtRequisitos" name="txtRequisitos" required type="text" maxlength="100" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtCiclo">Ciclo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="right">(Ej: 2)</span></label>
                                </td>
                                <td>
                                    <input id="txtCiclo" name="txtCiclo" required="" type="number" min="1" max="10" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Crear Curso" name="btnCrearCurso" id="btnCrearCurso"/></td>
                            </tr>
                        </table>
                    </form>
                    <%
                        if (Exito) {
                    %>
                    <!-- Success -->
                    <div class="notice success"><i class="icon-ok icon-large"></i> Curso Creado Correctamente! 
                        <a href="#close" class="icon-remove"></a></div>
                        <%
                            }
                        %>
                </div>
            </div>
            <label style="text-align: center;color: transparent">-----***PRUEBAS DE SOFTWARE***-----</label>
            <%@include file="template/footer.jsp" %>
        </div>
    </body>
</html>