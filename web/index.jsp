<%-- 
    Document   : index
    Created on : 3 nov. 2023, 01:04:50
    Author     : Sergio Trinidad
--%>
<%@page import = "Model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesion</title>
                <style>
            body {
                background-color: #f7f7f7;
                font-family: Arial, sans-serif;
                color: #292522;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            div {
                background-color: #bfcbff;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                padding: 20px;
                width: 300px;
                text-align: center;
            }

            h1 {
                color: #6270a1;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            input {
                margin: 5px;
                padding: 10px;
                border: 1px solid #818fc0;
                border-radius: 5px;
            }

            button {
                background-color: #6270a1;
                color: #f7f7f7;
                padding: 10px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }

            a {
                color: #435281;
                text-decoration: none;
                text-align: center;
                display: block;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
    <center>
        <H1>INICIO DE SESION</H1>
        <div>
            <form action="iniciar" method="post">
                Usuario:<br>
                <input type="text" name= "usuario" placeholder=" Ingrese Nombre de Usuario" size= '30 '> <br>
                Contraseña: <br>
                <input type="password" name= "password" placeholder="Ingrese Contraseña" size= '30 '> <br><br>

                <button type="submit" value="login">Inicio Sesión</button><br>
            </form>
        </div>

        <a href= "RegistroU.jsp"> ¿No tienes una cuenta? Registrate aquí </a> 



    </center>

</body>
</html>
