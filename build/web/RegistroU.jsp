<%-- 
    Document   : RegistroU
    Created on : 3 nov. 2023, 01:06:22
    Author     : Sergio Trinidad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Nuevo Usuario</title>
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
                background-color: #fff;
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

            button:hover {
                background-color: #435281;
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
        <div>
            <h1>Registro Usuario Nuevo</h1>
            <form action="Registro" method="post">
                Nombre:<br>
                <input type="text" name="usuario" placeholder="Luis" size="30" required><br>
                Apellido:<br>
                <input type="text" name="apellido" placeholder="Martinez" size="30" required><br>
                Edad: <br>
                <input type="number" name="edad" placeholder="25" size="30" min="15" max="99" required><br>
                Sexo:<br>
                <input type="text" name="genero" placeholder="Masculino/Femenino" size="30"><br>
                Estatura (m):<br>
                <input type="number" step="0.01" name="estatura" placeholder="1.65" size="30" min="1" max="2.5" required><br>
                Peso (Kg):<br>
                <input type="number" name="peso" placeholder="60" size="30" required><br>
                Fecha:<br>
                <input type="date" name="fecha" size="30" required><br>
                Contraseña:<br>
                <input type="password" name="password" placeholder="Ingrese contraseña" size="30" required><br>
                <button type="submit" value="registro">Registrar</button>
            </form>
            <a href="index.jsp">Regresar</a>
        </div>
    </body>
</html>
