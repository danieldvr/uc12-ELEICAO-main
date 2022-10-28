<%-- 
    Document   : inserirCliente
    Created on : 07/06/2022, 21:16:58
    Author     : sala19a
--%>

<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.EleitorDTO"%>
<%@page import="br.com.DAO.EleitorDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; URL=../view/urnaEletronica.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                EleitorDAO repository = new EleitorDAO();
                EleitorDTO eleitorDTO = new EleitorDTO();

                eleitorDTO.setTituloEleitoralEleitor(LoggedUser.getEleitor().getTituloEleitoralEleitor());
                if (request.getParameter("nome") != null) {
                    eleitorDTO.setNome(request.getParameter("nome"));
                }
                if (request.getParameter("usuario") != null) {
                    eleitorDTO.setUsuario(request.getParameter("usuario"));
                }
                if (request.getParameter("senha") != null) {
                    eleitorDTO.setSenha(request.getParameter("senha"));
                }

                if (repository.findByUsuario(eleitorDTO.getUsuario()).getNome() != null) {
                    response.sendRedirect("../view/editarEleitor.jsp?situacaoEdicao=2");
                } else {
                    repository.alterarEleitor(eleitorDTO);
                    LoggedUser.setEleitor(eleitorDTO);
                    response.sendRedirect("../view/editarEleitor.jsp?situacaoEdicao=1");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
