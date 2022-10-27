<%-- 
    Document   : voto
    Created on : 28/07/2022, 19:43:23
    Author     : sala19a
--%>

<%@page import="br.com.DTO.CandidatoDTO"%>
<%@page import="br.com.DAO.CandidatoDAO"%>
<%@page import="java.util.List"%>
<%@page import="br.com.DTO.VotoResultDTO"%>
<%@page import="br.com.DAO.VotoDAO"%>
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
            CandidatoDAO repository = new CandidatoDAO();
            List<CandidatoDTO> lista = repository.listarCandidatos();
        %>
        <h1 class="text-center my-5">Gerenciar Candidatos</h1>
        <div class="text-center container">

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Número do Candidato</th>
                        <th>Título Eleitoral</th>
                        <th>Situaçao</th>
                        <th style="width: 8rem;"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (CandidatoDTO obj : lista) {
                    %>
                    <tr>
                        <td><%=obj.getNumeroCandidato()%></td>
                        <td><%=obj.getTituloEleitoral()%></td>
                        <td><%=obj.getSituacaoDetalhada()%></td>
                        <td style="display: flex">
                            <%if (obj.getSituacao() == 'P') {%>
                            <a class="btn btn-success mx-1" href="../actions/editarCandidato.jsp?situacao=A&tituloEleitoral=<%=obj.getTituloEleitoral()%>">Aprovar</a>
                            <a class="btn btn-danger mx-1" href="../actions/editarCandidato.jsp?situacao=N&tituloEleitoral=<%=obj.getTituloEleitoral()%>">Negar<a/>
                                <%} else if (obj.getSituacao() == 'A') {%>
                                <a class="btn btn-warning mx-1" href="../actions/candidatar.jsp">Cancelar</a>
                                <%} else {%>
                                <a class="mx-1">
                                    <div style="height: 24px;"></div>
                                </a>
                                <%}%>
                        </td>
                    </tr>

                    <%}%>
            </table>
            <a href="urnaEletronica.jsp" class="btn btn-secondary">Voltar</a>
        </div>
    </body>
</html>
