<%-- 
    Document   : inserirCliente
    Created on : 07/06/2022, 21:16:58
    Author     : sala19a
--%>

<%@page import="br.com.DAO.VotoDAO"%>
<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DAO.EleitorDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; URL=../view/listarEleitor.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                VotoDAO repository = new VotoDAO();

                if (LoggedUser.getEleitor().getTituloEleitoralEleitor() == 0) {
                    repository.reiniciarEleicao();
                }
                response.sendRedirect("../../index.jsp");

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
