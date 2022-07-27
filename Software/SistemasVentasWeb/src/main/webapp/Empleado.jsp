<%-- 
    Document   : Empleado
    Created on : 7 feb. 2022, 13:18:38
    Author     : 51927
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 
        <title>Empleado</title>

    </head>
    <style>
        body {
            background: #f5f5f5;
        }
    </style>

    <body>
        <div class="">
            <div class="row">
                <div class="col-lg-5 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <p><strong>Requisitos para el registro de un nuevo empleado o empleada:</strong></p>
                            <hr>

                            <ul>
                                <li>Completar sus datos en el excel de LIMPIO BE
                                    <ul>
                                        <li>Nombres o apellidos sin tilde</li>
                                        <li>Te brindara el correo y contraseña</li>
                                    </ul>
                                </li>
                                <li>Brindar una foto
                                    <ul>
                                        <li>La foto estará en <a href="https://postimages.org/es/" target="_blank">postimages</a></li>
                                    </ul>
                                </li>
                            </ul>       
                        </div>
                    </div>
                    <br>
                </div>

                <div class="col-lg-5 col-sm-11 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <p><strong>Agregar / Editar Empleado</strong></p>

                            <form action="Controlador?menu=Empleado" method="POST" class="row needs-validation" novalidate>

                                <div class="col-md-12">
                                    <label for="validationCustom01" class="form-label">ID Administrador</label>
                                    <input type="text" value="${empleado.getAdmin()}" name="txtAdmin" class="form-control" id="validationCustom01"  required>
                                </div>
                                <div class="col-md-6">
                                    <label for="validationCustom01" class="form-label">Nombres</label>
                                    <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control" id="validationCustom01"  required>
                                </div>
                                <div class="col-md-6">
                                    <label for="validationCustom02" class="form-label">Apellidos</label>
                                    <input type="text" value="${empleado.getApel()}" name="txtApellidos"  class="form-control" id="validationCustom02"  required>

                                </div>
                                <div class="col-12">
                                    <label for="validationCustom02" class="form-label">DNI</label>
                                    <input type="text" value="${empleado.getDni()}" name="txtDni" class="form-control" id="validationCustom02"  required>

                                </div>
                                <div class="col-12">
                                    <label for="validationCustomUsername" class="form-label">Correo</label>
                                    <div class="input-group has-validation">
                                        <input type="email" value="${empleado.getCor()}" name="txtCorreo"  class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>

                                    </div>
                                </div>
                                <div class="col-12">
                                    <label for="validationCustom02" class="form-label">Contraseña</label>
                                    <input type="password" value="${empleado.getCon()}" name="txtContrasena" class="form-control" id="validationCustom02"  required>

                                </div>
                                <div class="col-12">
                                    <label for="validationCustom02" class="form-label">Foto</label>
                                    <input type="text" value="${empleado.getFot()}" name="txtFoto" class="form-control" id="validationCustom02"  required>

                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value=""
                                               id="invalidCheck" required>
                                        <label class="form-check-label" for="invalidCheck">
                                            Acepto los términos y condiciones
                                        </label>
                                        <div class="invalid-feedback">
                                            Debe estar de acuerdo antes de enviar.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="submit" name="accion" value="Agregar"
                                           class="btn btn-primary">
                                    <input type="submit" name="accion" value="Actualizar" class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-lg-11 col-sm-11 mx-auto">
                    <div class="card-body pt-4 p-3">
                         <p><strong>Empleados</strong></p>
                        <ul class="list-group">
                            <c:forEach var="em" items="${empleados}">
                                <li class="list-group-item mb-3 border-0 d-flex gap-4 p-4 mb-2 bg-gray-100 border-radius-lg">
                                    <img src="${em.getFot()}"">
                                    <div class="d-flex flex-column">

                                        <span class="mb-2 text-xs">Id: <span class="text-dark font-weight-bold ms-sm-2">
                                                ${em.getId()}
                                            </span></span>
                                        <span class="mb-2 text-xs">Dni: <span class="text-dark font-weight-bold ms-sm-2">
                                                ${em.getDni()}
                                            </span></span>
                                        <span class="mb-2 text-xs">Nombres: <span class="text-dark font-weight-bold ms-sm-2">
                                                ${em.getNom()}
                                            </span></span>
                                        <span class="mb-2 text-xs">Apellidos: <span class="text-dark ms-sm-2 font-weight-bold">
                                                ${em.getApel()}
                                            </span></span>
                                        <span class="text-xs">Correo: <span class="text-dark ms-sm-2 font-weight-bold">
                                                ${em.getCor()}
                                            </span></span>
                                        <span class="text-xs">Contraseña: <span class="text-dark ms-sm-2 font-weight-bold">
                                                ${em.getCon()}
                                            </span></span>
                                    </div>
                                    <div class="ms-auto text-end">
                                        <a class="btn btn-success"
                                           href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Editar</a>
                                        <a class="btn btn-danger"
                                           href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}">Eliminar</a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    </body>
    <script src="js/validacion.js"></script>

</html>

