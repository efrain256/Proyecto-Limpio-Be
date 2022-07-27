package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado buscar(int id) {
        Empleado em = new Empleado();
        String sql = "select * from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt(1));
                em.setNom(rs.getString(4));
            }
        } catch (Exception e) {
        }
        return em;
    }
    
    
    public Empleado validar(String correo, String contrasena) {
        Empleado em = new Empleado();
//Empleado em=null ;
        String sql = "select IdEmpleado,IdAdmin,Dni,Nombres,Apellidos,Correo,aes_decrypt(Contrasena, 'lb'),Foto from empleado where Correo=? and aes_decrypt(Contrasena, 'lb')=?";
        // String sql="select idEmpleado, Nombres, Telefono, Estado from empleado where User=? and Dni=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            while (rs.next()) {
                //em=new Empleado();
                em.setId(rs.getInt(1));
                em.setAdmin(rs.getInt(2));
                em.setDni(rs.getString(3));
                em.setNom(rs.getString(4));
                em.setApel(rs.getString(5));
                em.setCor(rs.getString(6));
                em.setCon(rs.getString(7));
                em.setFot(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return em;
    }
    //operaciones CRUD

    public List listar() {
        String sql = "select IdEmpleado,IdAdmin,Dni,Nombres,Apellidos,Correo,aes_decrypt(Contrasena, 'lb'),Foto from empleado";
        List<Empleado> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setId(rs.getInt(1));
                em.setAdmin(rs.getInt(2));
                em.setDni(rs.getString(3));
                em.setNom(rs.getString(4));
                em.setApel(rs.getString(5));
                em.setCor(rs.getString(6));
                em.setCon(rs.getString(7));
                em.setFot(rs.getString(8));

                lista.add(em);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    public int agregar(Empleado em) {
        String sql = "insert into empleado(IdAdmin,Dni, Nombres, Apellidos, Correo, Contrasena, Foto)values(?,?,?,?,?,aes_encrypt(?,'lb'),?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, em.getAdmin());
            ps.setString(2, em.getDni());
            ps.setString(3, em.getNom());
            ps.setString(4, em.getApel());
            ps.setString(5, em.getCor());
            ps.setString(6, em.getCon());
            ps.setString(7, em.getFot());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public Empleado listarId(int id) {
        Empleado emp = new Empleado();
        String sql = "select * from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setAdmin(rs.getInt(2));
                emp.setDni(rs.getString(3));
                emp.setNom(rs.getString(4));
                emp.setApel(rs.getString(5));
                emp.setCor(rs.getString(6));
                emp.setCon(rs.getString(7));
                emp.setFot(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return emp;
    }

    public int actualizar(Empleado em) {
        String sql = "update empleado set IdAdmin=?, Dni=?, Nombres=?, Apellidos=?, Correo=?, Contrasena=aes_encrypt(?,'lb'), Foto=? where IdEmpleado=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, em.getAdmin());
            ps.setString(2, em.getDni());
            ps.setString(3, em.getNom());
            ps.setString(4, em.getApel());
            ps.setString(5, em.getCor());
            ps.setString(6, em.getCon());
            ps.setString(7, em.getFot());
            ps.setInt(8, em.getId());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from empleado where IdEmpleado=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

}
