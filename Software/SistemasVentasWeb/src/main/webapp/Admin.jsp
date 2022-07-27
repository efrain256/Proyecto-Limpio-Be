<%-- 
    Document   : AdminEmpleado
    Created on : 17/07/2022, 05:14:33 PM
    Author     : Llapapasca Montes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>Limpio Be - Login</title>
    </head>
    <style>
        body {
            background: #f5f5f5;
        }
    </style>
    <body>
        <div class="">
            <div class="row">
                <h3 class="mt-5 mx-5">Agregar / Editar Empleado</h3>
                <div class="col-lg-4 col-sm-11 mx-auto">
                    <div class="card" style="margin-top: 25%;">
                        <div class="card-body">
                            <p class="text-danger"><strong>Solo personal autorizado</strong></p>
                            <hr>
                            <form action="Validar" method="POST" class="needs-validation" novalidate>
                                <div class="login">
                                    <div class="login-inputs">
                                        <label for="email-limpiobe" class="form-label"><strong>Correo</strong></label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon3">@limpiobe.com</span>
                                            <input type="email" name="txtcorreoadmin" class="form-control" id="email-limpiobe"
                                                   aria-describedby="basic-addon3" />
                                        </div>
                                        <label for="password-limpiobe" class="form-label"><strong>Contraseña</strong></label>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon3">Caracteres 4 - 8</span>
                                            <input type="password" name="txtcontrasenaadmin" class="form-control"
                                                   id="password-limpiobe" aria-describedby="basic-addon3" />
                                        </div>
                                    </div>
                                    <div class="login-button">
                                        <input type="submit" name="accion" value="Entrar" class="btn btn-primary w-100">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
