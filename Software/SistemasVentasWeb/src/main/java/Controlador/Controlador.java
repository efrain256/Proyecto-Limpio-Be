/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Registro;
import Modelo.RegistroDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDAO edao = new EmpleadoDAO();
    Cliente cli = new Cliente();
    ClienteDAO cdao = new ClienteDAO();
    Producto pro = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    Registro reg = new Registro();
    int ide;
    int idc;
    int idp;
    Venta v = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item;
    int cod;
    String descripcion;
    String presentacion;
    double precio;
    int cant;
    double subtotal;
    double totalPagar;

    String numeroserie;
    VentaDAO vdao = new VentaDAO();

    RegistroDAO regdao = new RegistroDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Registro")) {
            switch (accion) {
                case "Listar":
                    List lista = regdao.listar();
                    request.setAttribute("registros", lista);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Registro.jsp").forward(request, response);
        }
        if (menu.equals("VentasEmpleado")) {
            switch (accion) {
                case "Listar":
                    request.setAttribute("reg1", reg);
                    List lista1 = regdao.VentasYear();
                    request.setAttribute("ventas", lista1);

                    request.setAttribute("reg", reg);
                    List lista = regdao.VentasEmpleado();
                    request.setAttribute("registroempleado", lista);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("VentasEmpleado.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {
            switch (accion) {
                case "Listar":
                    List lista = edao.listar();
                    request.setAttribute("empleados", lista);
                    break;
                case "Agregar":
                    int admin = (Integer.parseInt(request.getParameter("txtAdmin")));
                    String dni = request.getParameter("txtDni");
                    String nom = request.getParameter("txtNombres");
                    String apel = request.getParameter("txtApellidos");
                    String cor = request.getParameter("txtCorreo");
                    String con = request.getParameter("txtContrasena");
                    String fot = request.getParameter("txtFoto");
                    em.setAdmin(admin);
                    em.setDni(dni);
                    em.setNom(nom);
                    em.setApel(apel);
                    em.setCor(cor);
                    em.setCon(con);
                    em.setFot(fot);
                    edao.agregar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    ide = Integer.parseInt(request.getParameter("id"));
                    Empleado e = edao.listarId(ide);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

                    break;
                case "Actualizar":
                    int admin1 = (Integer.parseInt(request.getParameter("txtAdmin")));
                    String dni1 = request.getParameter("txtDni");
                    String nom1 = request.getParameter("txtNombres");
                    String apel1 = request.getParameter("txtApellidos");
                    String cor1 = request.getParameter("txtCorreo");
                    String con1 = request.getParameter("txtContrasena");
                    String fot1 = request.getParameter("txtFoto");
                    em.setAdmin(admin1);
                    em.setDni(dni1);
                    em.setNom(nom1);
                    em.setApel(apel1);
                    em.setCor(cor1);
                    em.setCon(con1);
                    em.setFot(fot1);
                    em.setId(ide);
                    edao.actualizar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    ide = Integer.parseInt(request.getParameter("id"));
                    edao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }
        if (menu.equals("Cliente")) {
            switch (accion) {
                case "Listar":
                    List lista = cdao.listar();
                    request.setAttribute("clientes", lista);
                    break;
                case "Agregar":
                    String dni = request.getParameter("txtDni");
                    String nom = request.getParameter("txtNombres");
                    String tel = request.getParameter("txtTelefono");
                    String cor = request.getParameter("txtCorreo");
                    String dir = request.getParameter("txtDireccion");
                    cli.setDniRuc(dni);
                    cli.setNom(nom);
                    cli.setTel(tel);
                    cli.setCor(cor);
                    cli.setDir(dir);
                    cdao.agregar(cli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idc = Integer.parseInt(request.getParameter("id"));
                    Cliente c = cdao.listarId(idc);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni1 = request.getParameter("txtDni");
                    String nom1 = request.getParameter("txtNombres");
                    String tel1 = request.getParameter("txtTelefono");
                    String cor1 = request.getParameter("txtCorreo");
                    String dir1 = request.getParameter("txtDireccion");
                    cli.setDniRuc(dni1);
                    cli.setNom(nom1);
                    cli.setTel(tel1);
                    cli.setCor(cor1);
                    cli.setDir(dir1);
                    cli.setId(idc);
                    cdao.actualizar(cli);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idc = Integer.parseInt(request.getParameter("id"));
                    cdao.delete(idc);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        }
        if (menu.equals("Producto")) {
            switch (accion) {
                case "Listar":
                    List lista = pdao.listar();
                    request.setAttribute("productos", lista);
                    break;
                case "Agregar":
                    String nom = request.getParameter("txtNombres");
                    double pre = (Double.parseDouble(request.getParameter("txtPrecio")));
                    int stock = (Integer.parseInt(request.getParameter("txtStock")));
                    String present = request.getParameter("txtPresentacion");
                    pro.setNom(nom);
                    pro.setPre(pre);
                    pro.setStock(stock);
                    pro.setPresen(present);
                    pdao.agregar(pro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    idp = Integer.parseInt(request.getParameter("id"));
                    Producto p = pdao.listarId(idp);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nom1 = request.getParameter("txtNombres");
                    double pre1 = (Double.parseDouble(request.getParameter("txtPrecio")));
                    int stock1 = (Integer.parseInt(request.getParameter("txtStock")));
                    String present1 = request.getParameter("txtPresentacion");
                    pro.setNom(nom1);
                    pro.setPre(pre1);
                    pro.setStock(stock1);
                    pro.setPresen(present1);
                    pro.setId(idp);
                    pdao.actualizar(pro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    idp = Integer.parseInt(request.getParameter("id"));
                    pdao.delete(idp);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
        if (menu.equals("NuevaVenta")) {
            switch (accion) {
                case "Empleado":
                    int idem = Integer.parseInt(request.getParameter("codigoempleado"));
                    em.setId(idem);
                    em = edao.buscar(idem);
                    request.setAttribute("em", em);
                    request.setAttribute("nserie", numeroserie);
                    break;
                case "Cliente":
                    String dni = request.getParameter("codigocliente");
                    cli.setDniRuc(dni);
                    cli = cdao.buscar(dni);
                    request.setAttribute("em", em);
                    request.setAttribute("cli", cli);
                    request.setAttribute("nserie", numeroserie);

                    break;
                case "Producto":
                    int id = Integer.parseInt(request.getParameter("codigoproducto"));
                    pro = pdao.listarId(id);
                    request.setAttribute("em", em);
                    request.setAttribute("cli", cli);
                    request.setAttribute("producto", pro);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalPagar);
                    request.setAttribute("nserie", numeroserie);
                    break;
                case "Agregar":
                    request.setAttribute("nserie", numeroserie);
                    request.setAttribute("cli", cli);
                    request.setAttribute("em", em);
                    totalPagar = 0.0;
                    item = item + 1;
                    cod = pro.getId();
                    descripcion = request.getParameter("nomproducto");
                    presentacion = request.getParameter("presproducto");
                    precio = Double.parseDouble(request.getParameter("precio"));
                    cant = Integer.parseInt(request.getParameter("cant"));
                    subtotal = precio * cant;
                    v = new Venta();
                    v.setItem(item);
                    v.setIdproducto(cod);
                    v.setDescripcionP(descripcion);
                    v.setPresen(presentacion);
                    v.setPrecio(precio);
                    v.setCantidad(cant);
                    v.setSubtotal(subtotal);
                    lista.add(v);
                    for (int i = 0; i < lista.size(); i++) {
                        totalPagar = totalPagar + lista.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalPagar);
                    request.setAttribute("lista", lista);
                    break;
                case "GenerarVenta":
                    //actualizacion del Stock
                    for (int i = 0; i < lista.size(); i++) {
                        Producto pr = new Producto();
                        int cantidad = lista.get(i).getCantidad();
                        int idproducto = lista.get(i).getIdproducto();
                        ProductoDAO aO = new ProductoDAO();
                        pr = aO.buscar(idproducto);
                        int sac = pr.getStock() - cantidad;
                        aO.actualizarstock(idproducto, sac);
                    }
                    //Guardar Venta
                    v.setIdcliente(cli.getId());
                    v.setIdempleado(em.getId());
                    v.setNumserie(numeroserie);
                    v.setFecha(Venta.fechaActual());
                    v.setMonto(totalPagar);

                    vdao.guardarVenta(v);
                    //Guardar Detalle ventas
                    int idv = Integer.parseInt(vdao.IdVentas());
                    for (int i = 0; i < lista.size(); i++) {
                        v = new Venta();
                        v.setId(idv);
                        v.setIdproducto(lista.get(i).getIdproducto());
                        v.setCantidad(lista.get(i).getCantidad());
                        v.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleventas(v);

                    }
                    break;
                case "Cancelar":
                    lista.remove(v);
                    break;
                default:
                    v = new Venta();
                    lista = new ArrayList<>();
                    item = 0;
                    totalPagar = 0.0;

                    numeroserie = vdao.NroSerieVentas();
                    if (numeroserie == null) {
                        numeroserie = "00000001";
                        request.setAttribute("nserie", numeroserie);
                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        incrementar = incrementar + 1;

                        //GenerarSerie gs=new GenerarSerie();
                        numeroserie = ("0000000" + incrementar);
                        request.setAttribute("nserie", numeroserie);
                    }
                    request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
            }
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
