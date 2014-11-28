/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.com.core.dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import pe.com.core.model.Curso;
import org.apache.log4j.Logger;
/**
 *
 * @author zcrome
 */
public class CursoDAOImp implements CursoDAO{

    private SessionFactory sessionFactory;
    private final static Logger LOGGER = Logger.getLogger(CursoDAOImp.class);    
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void save(Curso curso) {
        try {
            Session session = this.sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            session.persist(curso);
            tx.commit();
            session.close();
            
        } catch (Exception e) {
             LOGGER.error("Sorry, something wrong!", e);
        }
    }

    public List<Curso> list() {
        List<Curso> lista = null;
        
        try {
          Session session = this.sessionFactory.openSession();
          lista = session.createQuery("from Curso").list();
          session.close();        
            
        } catch (Exception e) {
            LOGGER.error("Sorry, something wrong!", e);
          }
	return lista;
    }

    public boolean update(Curso curso) {
        try {
            Session session = this.sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            session.update(curso);
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            LOGGER.error("Sorry, something wrong!", e);
            return false;
        }
        
        return true;
    }

    public boolean delete(Curso curso) {
        try {
            Session session = this.sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            session.delete(curso);
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            LOGGER.error("Sorry, something wrong!", e);
            return false;
        }
        
        return true;
    }

    public Curso get(int id) {
        Curso curso = null;
        
        try {           
            
            Session session = this.sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            curso = (Curso)session.get(Curso.class, id);
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            LOGGER.error("Sorry, something wrong!", e);
        }
        return curso;   
    }
    
    
}
