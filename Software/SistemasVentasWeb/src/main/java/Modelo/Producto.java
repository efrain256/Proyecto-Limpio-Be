
package Modelo;


public class Producto {
int id;
String nom;
String presen;//estado
double pre;
int stock;

    public Producto() {
    }

    public Producto(int id, String nom, String presen, double pre, int stock) {
        this.id = id;
        this.nom = nom;
        this.presen = presen;
        this.pre = pre;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPresen() {
        return presen;
    }

    public void setPresen(String presen) {
        this.presen = presen;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }



}
