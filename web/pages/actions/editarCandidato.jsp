<%-- 
    Document   : inserirCliente
    Created on : 07/06/2022, 21:16:58
    Author     : sala19a
--%>

<%@page import="br.com.DTO.CandidatoDTO"%>
<%@page import="br.com.DAO.CandidatoDAO"%>
<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.EleitorDTO"%>
<%@page import="br.com.DAO.EleitorDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; URL=../view/gerenciarCandidatos.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                CandidatoDAO repository = new CandidatoDAO();
                CandidatoDTO candidatoDTO = new CandidatoDTO();

                candidatoDTO.setTituloEleitoral(Integer.parseInt(request.getParameter("tituloEleitoral")));
                if (request.getParameter("situacao") != null) {
                    candidatoDTO.setSituacao(request.getParameter("situacao").charAt(0));
                }

                repository.alterarCandidato(candidatoDTO);
                response.sendRedirect("../view/gerenciarCandidatos.jsp");

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
