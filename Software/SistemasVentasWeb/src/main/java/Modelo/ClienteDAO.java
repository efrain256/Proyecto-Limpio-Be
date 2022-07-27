package Modelo;

import Config.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;

public class ClienteDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Cliente buscar(String dni) {
        Cliente cli = new Cliente();
        String sql = "select * from cliente where Dni=" + dni;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setId(rs.getInt(1));
                cli.setDniRuc(rs.getString(2));
                cli.setNom(rs.getString(3));
                cli.setTel(rs.getString(4));
                cli.setCor(rs.getString(5));
                cli.setDir(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return cli;
    }

    public List<Cliente> lisClient(int an) {
        List<Cliente> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call ordena(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setInt(1, an);
            ResultSet rs = st.executeQuery();//obtener todo el listado 
            while (rs.next()) {
                Cliente cl = new Cliente();
                cl.setNom(rs.getString(1));
                cl.setImporte(rs.getDouble(2));
                lista.add(cl);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

//operaciones CRUD
    public List listar() {
        String sql = "select * from cliente";
        List<Cliente> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt(1));
                cli.setDniRuc(rs.getString(2));
                cli.setNom(rs.getString(3));
                cli.setTel(rs.getString(4));
                cli.setCor(rs.getString(5));
                cli.setDir(rs.getString(6));

                lista.add(cli);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    public int agregar(Cliente cli) {
        String sql = "insert into cliente(Dni, Nombre, Telefono, Correo, Direccion)values(?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getDniRuc());
            ps.setString(2, cli.getNom());
            ps.setString(3, cli.getTel());
            ps.setString(4, cli.getCor());
            ps.setString(5, cli.getDir());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public Cliente listarId(int id) {
        Cliente clie = new Cliente();
        String sql = "select * from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clie.setDniRuc(rs.getString(2));
                clie.setNom(rs.getString(3));
                clie.setTel(rs.getString(4));
                clie.setCor(rs.getString(5));
                clie.setDir(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return clie;
    }

    public int actualizar(Cliente cli) {
        String sql = "update cliente set Dni=?, Nombre=?, Telefono=?, Correo=?, Direccion=? where IdCliente=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getDniRuc());
            ps.setString(2, cli.getNom());
            ps.setString(3, cli.getTel());
            ps.setString(4, cli.getCor());
            ps.setString(5, cli.getDir());
            ps.setInt(6, cli.getId());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from cliente where IdCliente=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

}
