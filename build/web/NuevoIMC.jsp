<%-- 
    Document   : NuevoIMC
    Created on : 4 nov. 2023, 11:23:37
    Author     : Sergio Trinidad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%HttpSession sesion = request.getSession(false);%>
<% if (sesion.getAttribute("usuario") != null) {%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actualiza Tu IMC</title>
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

        .container {
            display: flex;
            align-items: center;
        }

        .form-container {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        h1 {
            color: #6270a1;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #818fc0;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #6270a1;
            color: #f7f7f7;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .image-container {
            margin: 20px;
            text-align: center;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>Nuevas Tallas en tu Altura y Peso</h1>
            <form action="ActualizacionIMC" method="post">
                Estatura (m): <br>
                <input type="text" name="estatura" value=""><br>
                Peso (kg): <br>
                <input type="text" name="peso" value=""><br>
                <input type="submit" value="Calcular IMC">
            </form>
        </div>
        <div class="image-container">
            <img src="https://static.tuasaude.com/media/article/me/dr/imc_15748_l.jpg" alt="IMC">
        </div>
    </div>
</body>
<%}%>
</html>
