<%-- 
    Document   : Producto
    Created on : 7 feb. 2022, 13:15:33
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
        <%-- REFERENCIA A TABLA --%>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background: #f5f5f5;
        }
    </style>
    <body>
        <div class="">
            <div class="row">
                <div class="col-lg-5 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <p><strong>Agregar Producto</strong></p>
                            <hr>

                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                + Producto
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Nuevo Producto</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="Controlador?menu=Producto" method="POST" class="row needs-validation" novalidate>
                                                <div class="col-md-6">
                                                    <label for="validationCustom01" class="form-label">Nombre</label>
                                                    <input type="text" value="${producto.getNom()}" name="txtNombres"  class="form-control" id="validationCustom01"  required>    
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationCustom01" class="form-label">Presentación</label>
                                                    <input type="text" value="${producto.getPresen()}" name="txtPresentacion"  class="form-control" id="validationCustom01"  required>    
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationCustom01" class="form-label">Precio</label>
                                                    <input type="text" value="${producto.getPre()}" name="txtPrecio"  class="form-control" id="validationCustom01"  required>    
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="validationCustom01" class="form-label">Stock</label>
                                                    <input type="text" value="${producto.getStock()}" name="txtStock" class="form-control" id="validationCustom01"  required>    
                                                </div>
                                                <div class="col-12 mt-3">
                                                    <input type="submit" name="accion" value="Agregar" class="btn btn-primary">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"> Cancelar </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>                      
                        </div>
                    </div> 
                    <br>    
                </div>
                <div class="col-lg-5 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">               

                            <p><strong>Editar Producto</strong></p>
                            <hr>

                            <form action="Controlador?menu=Producto" method="POST" class="row needs-validation" novalidate>
                                <div class="col-md-6">
                                    <label for="validationCustom01" class="form-label">Nombre</label>
                                    <input type="text" value="${producto.getNom()}" name="txtNombres"  class="form-control" id="validationCustom01"  required>    
                                </div>
                                <div class="col-md-6">
                                    <label for="validationCustom01" class="form-label">Presentación</label>
                                    <input type="text" value="${producto.getPresen()}" name="txtPresentacion"  class="form-control" id="validationCustom01"  required>    
                                </div>
                                <div class="col-md-6">
                                    <label for="validationCustom01" class="form-label">Precio</label>
                                    <input type="text" value="${producto.getPre()}" name="txtPrecio"  class="form-control" id="validationCustom01"  required>    
                                </div>
                                <div class="col-md-6">
                                    <label for="validationCustom01" class="form-label">Stock</label>
                                    <input type="text" value="${producto.getStock()}" name="txtStock" class="form-control" id="validationCustom01"  required>    
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                    </div>  
                    <br>   
                </div>
                <div class="col-lg-11 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">

                            <p><strong>Tabla de Productos</strong></p>
                            <hr>

                            <table id="productos" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMBRE</th>
                                        <th>PRESENTACÓN</th>
                                        <th>PRECIO</th>
                                        <th>STOCK</th>  
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="pro" items="${productos}">
                                        <tr>
                                            <td>${pro.getId()}</td>
                                            <td>${pro.getNom()}</td>
                                            <td>${pro.getPresen()}</td>
                                            <td>${pro.getPre()}</td>
                                            <td>${pro.getStock()}</td>
                                            <td>
                                                <a class="btn btn-success" href="Controlador?menu=Producto&accion=Editar&id=${pro.getId()}">Editar</a>
                                                <a class="btn btn-danger" href="Controlador?menu=Producto&accion=Delete&id=${pro.getId()}">Eliminar</a>      
                                            </td>
                                        </tr>  
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMBRE</th>
                                        <th>PRESENTACÓN</th>
                                        <th>PRECIO</th>
                                        <th>STOCK</th>  
                                        <th>ACCIONES</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
    <%-- REFERENCIA A TABLA --%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#productos').DataTable();
        });
    </script>
    <script src="js/validacion.js"></script>
</html>
