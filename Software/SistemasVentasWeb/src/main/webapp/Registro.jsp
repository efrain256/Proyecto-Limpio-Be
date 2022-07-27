<%-- 
    Document   : Registro
    Created on : 03/07/2022, 12:23:38 PM
    Author     : Llapapasca Montes
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
            <div class="">
              
                <div class="col-lg-11 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <p><strong>Registro de ventas</strong></p>
                            <hr>
                            <table id="productos" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Nombre del Empleado</th>
                                        <th>Nombre del Producto</th>
                                        <th>Presentación</th>
                                        <th>Cantidad</th>
                                        <th>Monto</th>  
                                        <th>Número de Serie</th>
                                        <th>Fecha</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="reg" items="${registros}">
                                        <tr>
                                            <td>${reg.getNombre_empleado()}</td>
                                            <td>${reg.getNombre_producto()}</td>
                                            <td>${reg.getPresentacion()}</td>
                                            <td>${reg.getCantidad()}</td>
                                            <td>${reg.getMonto()}</td>
                                            <td>${reg.getNumero_serie()}</td>
                                            <td>${reg.getFecha()}</td>
                                        </tr>  
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Nombre del Empleado</th>
                                        <th>Nombre del Producto</th>
                                        <th>Presentación</th>
                                        <th>Cantidad</th>
                                        <th>Monto</th>  
                                        <th>Número de Serie</th>
                                        <th>Fecha</th>  
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
</html>
