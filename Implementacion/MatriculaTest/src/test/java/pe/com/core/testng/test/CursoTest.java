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
    private CursoDAO cursoDAO = context.getBean(CursoDAO.class);

    @BeforeClass
    public static void inicioClase() {
        System.out.println("Inicio de la clase");
    }

    @AfterClass
    public static void finClase() {
        System.out.println("Final de la Clase");
    }

    @Test
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
            e.printStackTrace();
            Assert.fail("Fallo: " + e.getMessage());
        }
    }
}
