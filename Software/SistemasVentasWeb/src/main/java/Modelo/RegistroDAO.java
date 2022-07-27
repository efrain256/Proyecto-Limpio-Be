/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Llapapasca Montes
 */
public class RegistroDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List VentasYear() {
        String sql = "SELECT YEAR(FechaVentas)Año,SUM(Monto)Monto FROM ventas \n"
                + "GROUP BY year(FechaVentas)";
        List<Registro> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registro reg = new Registro();
                reg.setYear(rs.getString(1));
                reg.setTotal(rs.getDouble(2));
                lista.add(reg);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    public List VentasEmpleado() {
        String sql = "SELECT Nombres,SUM(ventas.Monto)Monto,SUM(detalle_ventas.Cantidad)Cantidad FROM empleado\n"
                + "INNER JOIN ventas on empleado.IdEmpleado= ventas.IdEmpleado\n"
                + "INNER JOIN detalle_ventas on ventas.IdVentas=detalle_ventas.IdVentas\n"
                + "GROUP BY empleado.IdEmpleado";
        List<Registro> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registro reg = new Registro();
                reg.setNombre_empleado(rs.getString(1));
                reg.setMonto(rs.getDouble(2));
                reg.setCantidad(rs.getInt(3));
                lista.add(reg);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    public List listar() {
        String sql = "SELECT * FROM producto\n"
                + "JOIN detalle_ventas ON producto.IdProducto=detalle_ventas.IdProducto\n"
                + "JOIN ventas ON detalle_ventas.IdVentas=ventas.IdVentas\n"
                + "JOIN empleado ON ventas.IdEmpleado=empleado.IdEmpleado";
        List<Registro> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registro reg = new Registro();
                reg.setNombre_producto(rs.getString(2));
                reg.setPresentacion(rs.getString(3));
                reg.setCantidad(rs.getInt(9));
                reg.setNumero_serie(rs.getString(14));
                reg.setFecha(rs.getString(15));
                reg.setMonto(rs.getDouble(16));
                reg.setNombre_empleado(rs.getString(20));
                lista.add(reg);
            }
        } catch (Exception e) {

        }
        return lista;
    }
}
