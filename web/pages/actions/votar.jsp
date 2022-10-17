<%-- 
    Document   : votojsp
    Created on : 28/07/2022, 20:16:52
    Author     : sala19a
--%>

<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.VotoDTO"%>
<%@page import="br.com.DAO.VotoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                VotoDAO repository = new VotoDAO();
                VotoDTO voto = new VotoDTO();

                voto.setTituloEleitoralEleitor(LoggedUser.getEleitor().getTituloEleitoralEleitor());

                if (request.getParameter("numeroCandidato") != null) {
                    voto.setNumeroCandidato(Integer.parseInt(request.getParameter("numeroCandidato")));
                    if (repository.procurarPorTituloEleitoral(LoggedUser.getEleitor().getTituloEleitoralEleitor())) {
                        response.sendRedirect("../view/urnaEletronica.jsp");
                    } else {
                        repository.votarCandidato(voto);
                        response.sendRedirect("../../index.jsp");
                    }
                } else {
                    response.sendRedirect("../view/urnaEletronica.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
