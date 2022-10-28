<%-- 
    Document   : voto
    Created on : 28/07/2022, 19:43:23
    Author     : sala19a
--%>

<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.EleitorDTO"%>
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
        <%
            if (LoggedUser.getEleitor() == null || LoggedUser.getEleitor() == new EleitorDTO() || LoggedUser.getEleitor().getTituloEleitoralEleitor() != 0) {
                response.sendRedirect("../../index.jsp");
            }
        %>
    </head>
    <body>
        <%
            VotoDAO repository = new VotoDAO();
            List<VotoResultDTO> lista = repository.retornarResultado();
        %>
        <h1 class="text-center">Total de votos</h1>
        <div class="text-center">
            <%
                for (VotoResultDTO obj : lista) {
            %>
            
                <table class="table container bg-primary p-2 text-dark bg-opacity-10 text-center">
                    <tbody>
                        <tr>
                            <td>
                                <p>
                                    <span for ="candidato"><%=obj.getNomeCandidato()%>: </span>
                                    <span><%=obj.getQntVotos()%></span>
                                </p>
                            </td>
                        </tr>
                </table>
            
            <%}%>
            <a href="urnaEletronica.jsp" class="btn btn-secondary">Voltar</a>
        </div>
    </body>
</html>
