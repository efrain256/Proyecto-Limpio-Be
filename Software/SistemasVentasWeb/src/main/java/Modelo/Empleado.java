package Modelo;

public class Empleado {

    int id;
    int admin;
    String dni; //tel
    String nom;
    String apel;//estado
    String cor;
    String con;
    String fot;

    public Empleado() {
    } 

    public Empleado(int id, int admin, String dni, String nom, String apel, String cor, String con, String fot) {
        this.id = id;
        this.admin = admin;
        this.dni = dni;
        this.nom = nom;
        this.apel = apel;
        this.cor = cor;
        this.con = con;
        this.fot = fot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApel() {
        return apel;
    }

    public void setApel(String apel) {
        this.apel = apel;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }

    public String getFot() {
        return fot;
    }

    public void setFot(String fot) {
        this.fot = fot;
    }


}
