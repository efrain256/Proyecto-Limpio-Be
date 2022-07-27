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

/**
 *
 * @author Llapapasca Montes
 */
public class AdminDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Admin validar(String correo, String contrasena) {
        Admin admin = new Admin();
//Empleado em=null ;
        String sql = "select IdAdmin,Correo,aes_decrypt(Contrasena, 'lb') from admin where Correo=? and aes_decrypt(Contrasena, 'lb')=?";
        // String sql="select idEmpleado, Nombres, Telefono, Estado from empleado where User=? and Dni=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            while (rs.next()) {
                //em=new Empleado();
                admin.setId(rs.getInt(1));
                admin.setCor(rs.getString(2));
                admin.setCon(rs.getString(3));
            }
        } catch (Exception e) {
        }
        return admin;
    }
}
