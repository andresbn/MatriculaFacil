package pe.com.core.model;

import javax.persistence.*;

@Entity
@Table(name="CURSO")
public class Curso {
    
    @Id
    @Column(name="idCurso")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idCurso;
    
    private String nombre;    
    private String codigo;
    private int creditos;
    private String requisitos;
    private int ciclo;

    public Curso() {
    }

    public Curso(int idCurso, String nombre, String codigo, int creditos, String requisitos, int ciclo) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.codigo = codigo;
        this.creditos = creditos;
        this.requisitos = requisitos;
        this.ciclo = ciclo;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getRequisitos() {
        return requisitos;
    }

    public void setRequisitos(String requisitos) {
        this.requisitos = requisitos;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }
    
    @Override
    public String toString() {
       return "idCurso="+idCurso+", nombre="+nombre+", codigo="+codigo+", creditos="+creditos+", requisitos="+requisitos+", ciclo="+ciclo;
    }    
}