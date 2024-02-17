<%-- 
    Document   : CalculoIMC
    Created on : 3 nov. 2023, 01:10:55
    Author     : Sergio Trinidad
--%>

<%@page import="java.sql.*"%>
<%@page import="Model.Conexion"%>
<%@page import="Controller.Login" %>
<%@page import="Controller.ActualizacionIMC" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String USERNAME = "root";
    String PASSWORD = "1234";
    String HOST = "localhost";
    String PORT = "3306";
    String DATABASE = "IMC_P";
    String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;

    Connection con;
    Class.forName(CLASSNAME);
    con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

    PreparedStatement ps;
    ResultSet rs;

    HttpSession sesion = request.getSession(false);

    // Verifica si la sesión ya existe y si el atributo "usuario" está establecido
    String usuarioa = (sesion != null) ? (String) sesion.getAttribute("usuario") : null;

    // Si la sesión existe y "usuario" está establecido, se procede
    if (usuarioa != null) {
        // Crea la consulta SQL personalizada para el historial IMC
        String consultaSQL = "SELECT * from historial where Usuario = ?";
        ps = con.prepareStatement(consultaSQL);

        // Establece el parámetro de la consulta SQL
        ps.setString(1, usuarioa);

        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Historial IMC</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            color: #292522;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #435281;
            text-align: center;
            margin-top: 20px;
        }

        h2 {
            color: #6270a1;
            text-align: center;
        }

        h5 {
            text-align: center;
            margin-top: 20px;
        }

        .button {
            background-color: #6270a1;
            color: #f7f7f7;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin: 10px 0;
        }

        .button:hover {
            background-color: #435281;
        }

        div {
            margin: 20px;
            padding: 20px;
            background-color: #f7f7f7;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f7f7f7;
            color: #292522;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #6270a1;
            color: #bfcbff;
        }

        tr:nth-child(even) {
            background-color: #bfcbff;
        }

        tr:nth-child(odd) {
            background-color: #a0ade0;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"] {
            background-color: #6270a1;
            color: #f7f7f7;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #435281;
        }

        p {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div>
        <h1>Bienvenido <%= usuarioa%></h1>
        <h2>Historial IMC</h2>
        <h5><a href="NuevoIMC.jsp" class="button">Nuevo cálculo</a></h5>
        <form action="CerrarSesion" method="post">
            <input type="submit" value="Cerrar Sesión" class="button">
        </form>

        <table border="1" cellpadding="11">
            <tr>
                <th>Fecha</th>
                <th>Altura</th>
                <th>Peso</th>
                <th>IMC</th>
            </tr>

            <% while (rs.next()) {%>
            <tr>
                <td><%= rs.getString("Fecha")%></td>
                <td><%= rs.getFloat("Altura")%></td>
                <td><%= rs.getFloat("Peso")%></td>
                <td><%= String.format("%.2f", rs.getFloat("IMC"))%></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>

<%} else {
    // Si la sesión no existe o "usuario" no está establecido, muestra un mensaje
%>
<style>
    p.alert {
        background-color: #f5e1a4;
        border: 1px solid #d9d593;
        border-radius: 5px;
        padding: 20px;
        text-align: center;
        color: #bc162a;
        font-size: 45px;
        font-family: Arial, sans-serif;
    }

    a.alert-button {
        display: block;
        background-color: #ee7f27;
        color: #f7f7f7;
        padding: 15px 30px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 25px;
        font-family: Arial, sans-serif;
        margin-top: 20px;
        text-align: center;
    }

    a.alert-button:hover {
        background-color: #bc162a;
    }
</style>
<div style="text-align: center;">
    <p class="alert">Su usuario es nuevo. Por favor, Inicie Sesión.</p>
    <a href="index.jsp" class="alert-button">Volver al Inicio</a>
</div>
<%
}
%>
