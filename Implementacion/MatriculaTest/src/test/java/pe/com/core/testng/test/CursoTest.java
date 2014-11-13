/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.core.testng.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.Assert;
import java.util.List;
import java.util.Random;
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
    private CursoDAO cursoDAO = context.getBean(CursoDAO.class);

    @BeforeClass
    public static void inicioClase() {
        System.out.println("Inicio de la clase");
    }

    @AfterClass
    public static void finClase() {
        System.out.println("Final de la Clase");
    }

    @Test(priority = 1)
    public void listCurso() {
        try {
            List<Curso> listCursos = cursoDAO.list();
            Assert.assertNotEquals(listCursos.size(), 0);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 0)
    public void saveCurso() {
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
            e.printStackTrace();
            Assert.fail("Fallo: " + e.getMessage());
        }
    }

    @Test(priority = 2)
    public void deleteCurso() {
        try {
            List<Curso> listCursos = cursoDAO.list();
            Assert.assertTrue(cursoDAO.delete(listCursos.get(listCursos.size() - 1)));
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Fallo: " + e.getMessage());
        }
    }
}
