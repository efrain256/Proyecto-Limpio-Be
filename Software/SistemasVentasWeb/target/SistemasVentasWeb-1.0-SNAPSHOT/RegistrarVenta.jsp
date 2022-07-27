<%-- 
    Document   : RegistrarVenta
    Created on : 7 feb. 2022, 13:17:05
    Author     : 51927
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>VENTAS</title>
        <style>
            @media print{
                .parte01, .btn, .accion{
                    display: none;
                } 
            }
            body{
                background: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <div>
            <div class="row">
                <div class="col-lg-4 col-sm-11 parte01  mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <form class="row g-3" action="Controlador?menu=NuevaVenta" method="POST">
                                <div class="form-group">
                                    <label><strong>Buscar por id al </strong></label>
                                    <input type="submit" name="accion" value="Empleado" class="btn btn-outline-info"> 
                                    <hr>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="codigoempleado" value="${em.getId()}" placeholder="ID"  class="form-control">  
                                </div>
                                <div class="col-md-8">
                                    <input type="text" name="nombresempleado" value="${em.getNom()}" placeholder="Nombre Empleado" class="form-control"> 
                                </div> 
                                <div class="form-group">
                                    <label><strong>Buscar por DNI al </strong></label>
                                    <input type="submit" name="accion" value="Cliente" class="btn btn-outline-info"> 
                                    <hr>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="codigocliente" value="${cli.getDniRuc()}" class="form-control" placeholder="DNI">  
                                </div>
                                <div class="col-md-8">
                                    <input type="text" name="nombrescliente" value="${cli.getNom()}" placeholder="Nombre Cliente" class="form-control"> 
                                </div> 
                                <div class="form-group">
                                    <label><strong>Buscar por código al </strong></label>
                                    <input type="submit" name="accion" value="Producto" class="btn btn-outline-info"> 
                                    <hr>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="codigoproducto" value="${producto.getId()}" class="form-control" placeholder="Codigo">  
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="nomproducto" value="${producto.getNom()}" placeholder="Nombre" class="form-control"> 
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="presproducto" value="${producto.getPresen()}" placeholder="Presentación" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="precio" value="${producto.getPre()}" class="form-control" placeholder="S/.0.00">  
                                </div>
                                <div class="col-md-4">
                                    <input type="number" value="1" name="cant" placeholder="" class="form-control"> 
                                </div>
                                <div class="col-md-4">
                                    <input type="text" name="stock" value="${producto.getStock()}" placeholder="Stock" class="form-control"> 
                                </div>
                                <hr>
                                <div class="col-md-4">
                                    <input type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
                                </div>
                            </form>    
                        </div>  
                    </div>
                    <br>
                </div>
                <div class="col-lg-7 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <table class="table">
                                <div class="row align-items-center">
                                    <div class="col-md-4">
                                        <img src="img/limpiobe.jpg" alt="70" width="150"/>
                                    </div>
                                    <div class="col-md-1">
                                        <label> Cliente </label>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="nombrescliente" value="${cli.getNom()}" placeholder="Nombre" class="form-control"> 
                                    </div>
                                    <div class="col-md-1">
                                        <label> Número de Serie </label>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" name="NroSerie" value="${nserie}" class="form-control">
                                    </div>
                                </div>                         
                                <thead>
                                    <tr>
                                        <th>Nº</th>
                                        <th>Código</th>
                                        <th>Nombre</th>
                                        <th>Presentación</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>SubTotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="list" items="${lista}">
                                        <tr>
                                            <td>${list.getItem()}</td>
                                            <td>${list.getIdproducto()}</td>
                                            <td>${list.getDescripcionP()}</td>
                                            <td>${list.getPresen()}</td>
                                            <td>${list.getPrecio()}</td>
                                            <td>${list.getCantidad()}</td>
                                            <td>${list.getSubtotal()}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta</a>

                                        <a href="Controlador?menu=NuevaVenta&accion=Cancelar" class="btn btn-danger" style="margin-left: 10px">Cancelar</a>      

                                    </div> 
                                    <div class="col-sm-6 ml-auto d-flex">
                                        <label class="col-sm-6 text-right mt-2">Total a Pagar</label>
                                        <input type="text" name="txtTotal" value="S/. ${totalpagar}0" class="form-control text-center font-weight"> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>

</html>
