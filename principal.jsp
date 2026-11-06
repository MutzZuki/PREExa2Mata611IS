<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Cursos - RF-001</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.html"><i class="bi bi-cpu"></i> IA Generativa</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link active" href="principal.jsp">Catálogo de Cursos</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
            <div>
                <h2 class="fw-bold mb-0">Gestión y Consulta de Cursos</h2>
                <small class="text-muted">RF-001: Especificación de requisitos</small>
            </div>
            <a href="index.html" class="btn btn-outline-secondary"><i class="bi bi-arrow-left"></i> Volver al Inicio</a>
        </div>

        <div class="table-responsive shadow-sm rounded">
            <table class="table table-striped table-hover align-middle mb-0 bg-white">
                <thead class="table-dark">
                    <tr>
                        <th scope="col" style="width: 80px;">ID</th>
                        <th scope="col">Nombre del Curso</th>
                        <th scope="col" style="width: 140px;">Fecha Inicio</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Requisitos</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Statement stmt = null;
                        ResultSet rs = null;

                        if (con != null) {
                            try {
                                stmt = con.createStatement();
                                String sql = "SELECT id_curso, nombre, fecha_inicio, descripcion, requisitos FROM cursos";
                                rs = stmt.executeQuery(sql);

                                while (rs.next()) {
                    %>
                    <tr>
                        <td class="fw-bold text-center"><%= rs.getInt("id_curso") %></td>
                        <td class="text-primary fw-semibold"><%= rs.getString("nombre") %></td>
                        <td><%= rs.getDate("fecha_inicio") %></td>
                        <td><%= rs.getString("descripcion") %></td>
                        <td><span class="badge bg-light text-dark border"><%= rs.getString("requisitos") %></span></td>
                    </tr>
                    <%
                                }
                            } catch (SQLException e) {
                    %>
                    <tr>
                        <td colspan="5" class="text-danger text-center py-3">Error en la consulta: <%= e.getMessage() %></td>
                    </tr>
                    <%
                            } finally {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (con != null) con.close();
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-warning text-center py-3">No hay conexión disponible con la base de datos.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <div class="container">
            <small>Portal Educativo de Inteligencia Artificial Generativa</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>