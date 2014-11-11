<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pe.com.core.dao.CursoDAO"%>
<%@page import="pe.com.core.model.Curso"%>
<%@page import="pe.com.web.matriculaweb.util.ConstantesWeb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos - Eliminar</title>
        <link rel="icon" type="image/png" href="assets/imagenes/iconoMF.png" />
        <link rel="stylesheet" href="assets/css/Basico.css" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="assets/js/kickstart.js"></script> <!-- KICKSTART -->
        <link rel="stylesheet" href="assets/css/kickstart.css" media="all" /> <!-- KICKSTART -->
        <script>
            $(document).ready(function() {
                $("#listarCurso").removeClass("current");
                $("#crearCurso").removeClass("current");
                $("#modificarCurso").removeClass("current");
                $("#eliminarCurso").addClass("current");
            });
        </script>
    </head>
    <body>
        <div id="Contenedor">
            <%@include file="template/CabeceraT.jsp" %>
            <%@include file="template/MenuLateralT.jsp" %>
            <div id="ContenidoCentral">
                <h3 id="MensajeBienvenida">Eliminar Cursos</h3><br>
                <!-- Table sortable -->
                <table class="sortable">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Creditos</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <%
                        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
                        List<Curso> ListaDeCursos = new ArrayList<Curso>();
                        CursoDAO cursoDAO = context.getBean(CursoDAO.class);
                        ListaDeCursos = cursoDAO.list();
                        for (Curso C : ListaDeCursos) {
                    %>
                    <tbody>
                        <tr>
                            <td><%= C.getCodigo()%></td>
                            <td><%= C.getNombre()%></td>
                            <td><%= C.getCreditos()%></td>
                            <td><a id="linkEliminarCurso" onclick="if (!confirm('¿Esta seguro que desea eliminar este Curso?'))
                                        return false" href="Controller?action=<%= ConstantesWeb.ELIMINAR_CURSO%>&C=<%=C.getIdCurso()%>"><i class="icon-remove"></i></a></td>
                        </tr>                    
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <label style="text-align: center;color: transparent">-----***PRUEBAS DE SOFTWARE***-----</label>
            <%@include file="template/footer.jsp" %>
        </div>            
    </body>
</html>