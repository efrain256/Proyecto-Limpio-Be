/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Llapapasca Montes
 */
public class Registro {
    
    String nombre_empleado;
    String nombre_producto;
    String presentacion;
    int cantidad;
    double monto;
    String numero_serie;
    String fecha;
    String year;
    double total;

    public Registro() {
    }

    public Registro(String nombre_empleado, String nombre_producto, String presentacion, int cantidad, double monto, String numero_serie, String fecha, String year, double total) {
        this.nombre_empleado = nombre_empleado;
        this.nombre_producto = nombre_producto;
        this.presentacion = presentacion;
        this.cantidad = cantidad;
        this.monto = monto;
        this.numero_serie = numero_serie;
        this.fecha = fecha;
        this.year = year;
        this.total = total;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getNumero_serie() {
        return numero_serie;
    }

    public void setNumero_serie(String numero_serie) {
        this.numero_serie = numero_serie;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
   
}
