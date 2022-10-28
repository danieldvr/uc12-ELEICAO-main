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

                if (request.getParameter("tituloEleitoralEleitor") != null) {
                    eleitorDTO.setTituloEleitoralEleitor(Integer.parseInt(request.getParameter("tituloEleitoralEleitor")));
                }
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
                    System.out.print(repository.findByUsuario(eleitorDTO.getUsuario()));
                    response.sendRedirect("../view/inserirEleitor.jsp?usuario='1'");
                } else if (repository.pesquisarEleitorPorTituloEleitoral(eleitorDTO.getTituloEleitoralEleitor()).getNome() != null || eleitorDTO.getTituloEleitoralEleitor().toString().length() != 7) {
                    response.sendRedirect("../view/inserirEleitor.jsp?tituloEleitoralEleitor='1'");
                } else {
                    repository.cadastrarEleitor(eleitorDTO);
                    LoggedUser.setEleitor(eleitorDTO);
                    response.sendRedirect("../view/urnaEletronica.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
