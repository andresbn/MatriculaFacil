/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.core.testng.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.Assert;
import java.util.List;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import pe.com.core.dao.CursoDAO;
import pe.com.core.model.Curso;

/**
 *
 * @author Roy
 */
public class CursoTest {

    ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
    private final CursoDAO cursoDAO = context.getBean(CursoDAO.class);

    @BeforeClass
    public static void inicioClase() {
        System.out.println("Inicio de la clase");
    }

    @AfterClass
    public static void finClase() {
        System.out.println("Final de la Clase");
    }

    @Test(priority = 0)
    public void saveCursoCorrecto() {
        try {
            Curso curso = new Curso();
            curso.setCiclo(6);
            curso.setCodigo("SI329");
            curso.setCreditos(2);
            curso.setNombre("Evolucion de Software");
            curso.setRequisitos("IHC y Dispositivos Moviles");
            cursoDAO.save(curso);
            Assert.assertNotEquals(curso.getIdCurso(), 0);
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 1)
    public void listCurso() {
        try {
            List<Curso> listCursos = cursoDAO.list();
            Assert.assertNotEquals(listCursos.size(), 0);
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 2)
    public void updateCursoCorrecto() {
        try {
            List<Curso> listCursos = cursoDAO.list();
            Curso curso = listCursos.get(listCursos.size() - 1);
            curso.setCiclo(5);
            curso.setCodigo("AS123");
            curso.setCreditos(5);
            curso.setNombre("Evolucion de Software - Modificado");
            curso.setRequisitos("IHC - Modificado");
            Assert.assertTrue(cursoDAO.update(curso));
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 3)
    public void deleteCursoCorrecto() {
        try {
            List<Curso> listCursos = cursoDAO.list();
            Assert.assertTrue(cursoDAO.delete(listCursos.get(listCursos.size() - 1)));
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 5)
    public void saveCursoIncorrecto() {
        try {
            String codigoCurso = "";
            Curso curso = new Curso();
            curso.setCiclo(5);
            for (int i = 0; i < 60; i++) {
                codigoCurso += "a";
            }
            curso.setCodigo(codigoCurso);
            curso.setCreditos(5);
            curso.setNombre("Evolucion de Software - Modificado");
            curso.setRequisitos("IHC - Modificado");
            cursoDAO.save(curso);
            Assert.assertEquals(curso.getIdCurso(), 0);
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 6)
    public void updateCursoIncorrecto() {
        try {
            Curso curso = new Curso();
            curso.setIdCurso(-1);
            curso.setCiclo(5);
            curso.setCodigo("AS123");
            curso.setCreditos(5);
            curso.setNombre("Evolucion de Software - Modificado");
            curso.setRequisitos("IHC - Modificado");
            Assert.assertFalse(cursoDAO.update(curso));
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 7)
    public void deleteCursoIncorrecto() {
        try {
            Curso curso = new Curso();
            curso.setIdCurso(-1);
            Assert.assertFalse(cursoDAO.delete(curso));
        } catch (Exception e) {
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

}
