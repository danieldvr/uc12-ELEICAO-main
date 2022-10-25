<%-- 
    Document   : candidatar
    Created on : 31/07/2022, 22:45:40
    Author     : Admin
--%>

<%@page import="br.com.DTO.CandidatoDTO"%>
<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DAO.CandidatoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            CandidatoDAO candidatoDAO = new CandidatoDAO();
            CandidatoDTO candidato = candidatoDAO.pesquisarCandidatoPorTitulo(LoggedUser.getEleitor().getTituloEleitoralEleitor());
        %>
        <main class="form-signin w-25 m-auto">
            <form action="../actions/candidatar.jsp" method="POST">
                <h1 class="h3 text-center mb-3 py-5 fw-normal">Candidatura</h1>
                <%if (candidato == null) {%>
                <label for="nome" class="form-label">Digite seu número</label>
                <input id="numeroCandidato" class="form-control" type="text" name="numeroCandidato">
                <%}%>

                <p class="mt-5 text-center">
                    <button type="submit" class="btn btn-primary">
                        <%if (candidato != null) {%>
                        Cancelar Candidatura
                        <%} else {%> 
                        Solicitar Candidatura
                        <%}%>
                    </button>
                </p>
                <p class="text-center">
                    <a href="urnaEletronica.jsp" class="btn btn-secondary">Voltar</a>
                </p>
            </form>
        </main>
    </body>
</html>
