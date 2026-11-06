<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/preexa2mata611is.?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String pass = ""; // Si tienes contraseña en MySQL, ponla aquí

    Connection con = null;

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error de conexión: " + e.getMessage() + "</div>");
    }
%>