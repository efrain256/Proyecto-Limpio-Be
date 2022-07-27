

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/975d1954ab.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/index.css">
        <link rel="shortcut icon" href="img/logo.ico" type="image/x-icon">
        <title>Limpio Be - Login</title>
    </head>
    <body>
        <div class="container_page">
            <div class="video">
                <video src="video/login.mp4" autoplay loop></video>
            </div>
            <div class="overlay"></div>
            <div class="main">
                <div class="container-login">
                    <form action="Validar" method="POST" class="needs-validation" novalidate>
                        <div class="login">
                            <h3 class="login-title">Acceso al sistema</h3>
                            <div class="login-img">
                                <img src="./img/logo.png" alt="logo limpiobe">
                            </div>
                            <div class="login-inputs">
                                <label for="email-limpiobe" class="form-label"><strong>Correo</strong></label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon3">@limpiobe.com</span>
                                    <input type="email" name="txtcorreo" class="form-control" id="email-limpiobe"
                                           aria-describedby="basic-addon3" />
                                </div>
                                <label for="password-limpiobe" class="form-label"><strong>Contraseña</strong></label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon3">Caracteres 4 - 8</span>
                                    <input type="password" name="txtcontrasena" class="form-control" id="password-limpiobe"
                                           aria-describedby="basic-addon3" />
                                </div>
                            </div>
                            <div class="login-button">
                                <input type="submit" name="accion" value="Ingresar" class="btn btn-primary w-100">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="container-fras">
                    <p class="frase">¡Emprendimiento Juvenil, que sigue Creciendo!</p>
                    <div class="redes-sociales">
                        <div class="icon">
                            <a href="https://www.facebook.com/LimpioBe" target="_blank" class="facebook">
                                <i class="fa-brands fa-facebook"></i>
                            </a>
                        </div>
                        <div class="icon">
                            <a href="https://wa.me/message/7VK45CAXX3FNE1" target="_blank" class="whatsapp">
                                <i class="fa-brands fa-whatsapp"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
    <script src="js/validacion.js"></script>
</html>
