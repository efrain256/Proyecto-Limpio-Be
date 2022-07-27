
package Modelo;


public class Cliente {
    int id;
    String dniRuc;
    String nom;
    String tel;
    String cor;//es
    String dir;
    private double importe;
    
    public Cliente() {
    }

    public Cliente(int id, String dniRuc, String nom, String tel, String cor, String dir) {
        this.id = id;
        this.dniRuc = dniRuc;
        this.nom = nom;
        this.tel = tel;
        this.cor = cor;
        this.dir = dir;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDniRuc() {
        return dniRuc;
    }

    public void setDniRuc(String dniRuc) {
        this.dniRuc = dniRuc;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }
}
