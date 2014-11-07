/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.com.core.dao;
import java.util.List;
import pe.com.core.model.Curso;

/**
 *
 * @author zcrome
 */
public interface CursoDAO {

	public void save(Curso curso);
	
	public List<Curso> list();
        
        public boolean update(Curso curso);
        
        public boolean delete (Curso curso);
        
        public Curso get(int id);
	
}
