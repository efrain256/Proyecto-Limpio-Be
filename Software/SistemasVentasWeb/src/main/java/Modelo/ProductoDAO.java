package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Producto buscar(int id) {
        Producto pro = new Producto();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pro.setId(rs.getInt(1));
                pro.setNom(rs.getString(2));
                pro.setPresen(rs.getString(3));
                pro.setPre(rs.getDouble(4));
                pro.setStock(rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return pro;
    }

    public int actualizarstock(int id, int stock) {
        String sql = "update producto set Stock=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

//operaciones CRUD
    public List listar() {
        String sql = "select * from producto";
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setId(rs.getInt(1));
                pro.setNom(rs.getString(2));
                pro.setPresen(rs.getString(3));
                pro.setPre(rs.getDouble(4));
                pro.setStock(rs.getInt(5));

                lista.add(pro);
            }
        } catch (Exception e) {

        }
        return lista;
    }

    public int agregar(Producto pro) {
        String sql = "insert into producto(Nombre,Presentacion, Precio, Stock)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNom());
            ps.setString(2, pro.getPresen());
            ps.setDouble(3, pro.getPre());
            ps.setInt(4, pro.getStock());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public Producto listarId(int id) {
        Producto prod = new Producto();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prod.setId(rs.getInt(1));
                prod.setNom(rs.getString(2));
                prod.setPresen(rs.getString(3));
                prod.setPre(rs.getDouble(4));
                prod.setStock(rs.getInt(5));

            }
        } catch (Exception e) {
        }
        return prod;
    }

    public int actualizar(Producto pro) {
        String sql = "update producto set Nombre=?,Presentacion=?, Precio=?, Stock=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNom());
            ps.setString(2, pro.getPresen());
            ps.setDouble(3, pro.getPre());
            ps.setInt(4, pro.getStock());
            ps.setInt(5, pro.getId());
            ps.executeUpdate();

        } catch (Exception e) {

        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from producto where IdProducto=" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

}
