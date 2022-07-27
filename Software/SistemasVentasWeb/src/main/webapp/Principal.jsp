<%-- 
    Document   : Principal
    Created on : 27 ene. 2022, 20:57:50
    Author     : 51927
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/975d1954ab.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/principal.css">
        
         <link rel="stylesheet" href="css/main.css">

        <!-- Plugin Animated Circles CSS -->
        <link rel="stylesheet" href="plugin_animated_circles/css/gspinner.css">

        <!-- Plugin introLoader CSS -->
        <link rel="stylesheet" href="plugin_IntroLoader/css/introLoader.min.css">
        
        
        <title>Limpio Be</title>
        <link rel="shortcut icon" href="img/logo.ico" type="image/x-icon">

    </head>

    <body id="body">

        <header>
            <div class="icon__menu">

                <i class="fas fa-bars" id="btn_open"></i>
            </div>
            <p><strong>Sistema de ventas</strong></p>
        </header>

        <div class="menu__side" id="menu_side">

            <div class="name__page">
                <i>LB</i>
                <h4>Limpio Be</h4>
            </div>

            <div class="options__menu">

                <a href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-cash-register" title="Nueva Venta"></i>
                        <h4>Nueva Venta</h4>
                    </div>
                </a>

                <a href="Controlador?menu=Producto&accion=Listar" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-cart-plus" title="Producto"></i>
                        <h4>Producto</h4>
                    </div>
                </a>

                <a href="Controlador?menu=Cliente&accion=Listar" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-users-gear" title="Cliente"></i>
                        <h4>Cliente</h4>
                    </div>
                </a>

                <a href="Admin.jsp" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-user-gear" title="Empleado"></i>
                        <h4>Empleado</h4>
                    </div>
                </a>

                <a href="Controlador?menu=Registro&accion=Listar" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-file-lines" title="Registro Ventas"></i>
                        <h4>Registro Ventas</h4>
                    </div>
                </a>
                <a href="Controlador?menu=VentasEmpleado&accion=Listar" target="myFrame">
                    <div class="option">
                        <i class="fa-solid fa-file-lines" title="Ventas Empleado"></i>
                        <h4>Ventas Empleado</h4>
                    </div>
                </a>
            </div>

        </div>
        <div class="boton">
            <button type="button" class="btn btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                    aria-controls="offcanvasRight"> <i class="fa-solid fa-user"></i></button>
        </div>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel"><strong>Perfil del Empleado N° ${usuario.getId()} : </strong></h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="imagen mx-auto">
                    <div class="con">
                        <img src="${usuario.getFot()}" /><br>
                    </div>

                </div>
                <br>
                <p>
                    <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
                        <i class="fa-solid fa-user-check"></i> Informacion Personal
                    </button>
                </p>
                <div style="min-height: 120px;">
                    <div class="collapse collapse-horizontal" id="collapseWidthExample">
                        <div class="card card-body" style="width: 300px;">
                            <p><strong>DNI :</strong> ${usuario.getDni()}</p>
                            <p><strong>Nombres :</strong> ${usuario.getNom()}</p>
                            <p><strong>Apellidos :</strong> ${usuario.getApel()}</p>
                            <p><strong>Correo :</strong> ${usuario.getCor()}</p>
                            <p><strong>Contraseña :</strong> ${usuario.getCon()}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="offcanvas-footer mb-5" style=" text-align: center;">
                <form action="Validar" method="POST">
                    <button name="accion" value="Salir" class="btn btn-primary"> <i
                            class="fa-solid fa-arrow-right-from-bracket"></i> Salir</button>
                </form>
            </div>
        </div>
    </div>

    <div class="m-4" style="height:100vh;">
        <iframe name="myFrame" style="height: 100%; width: 100%;" src="Controlador?menu=NuevaVenta&accion=default"></iframe>
    </div>


    <script src="js/principal.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>

    
    <!--Plugin animated_cicles_spinner-->
    <div id="contenedor-loader">
        <div id="loader"></div>
    </div>


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>


    <!-- Plugin Animated Circles JS -->
    <script src="plugin_animated_circles/js/g-spinner.js"></script>

    <!-- Plugin introLoader JS -->
    <script src="plugin_IntroLoader/js/jquery.introLoader.pack.min.js"></script>

    <script type="text/javascript">

        //Loader con plugin animated_cicles_spinner    
        var $loader = $("#loader");  //referenciamos el div #loader  
        $loader.gSpinner();   //iniciamos la carga    

        window.onload = function () {
            setTimeout(function () {
                $("#contenedor-loader").fadeOut();
                $loader.gSpinner("hide")
            }, 3000);
        };
    </script>
    <script>
        $(document).ready(function () {
            $('div.options__menu a:first').addClass('selected');
            $('div.options__menu a').click(function () {
                $('div.options__menu a').removeClass('selected');
                $(this).addClass('selected');
            });
        });
    </script>
</body>

</html>
</html>
