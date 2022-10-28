<%-- 
    Document   : clienteUpdate
    Created on : 07/07/2022, 19:12:05
    Author     : sala19a
--%>

<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DAO.EleitorDAO"%>
<%@page import="br.com.DTO.EleitorDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <title>JSP Page</title> 
        <%
            if (LoggedUser.getEleitor() == null || LoggedUser.getEleitor() == new EleitorDTO()) {
                response.sendRedirect("../../index.jsp");
            }
        %>
    </head>
    <body>
        <%
            EleitorDAO eleitorRepository = new EleitorDAO();

            EleitorDTO eleitor = LoggedUser.getEleitor();
        %>        
        <main class="form-signin w-25 m-auto">
            <h1 class="h3 text-center mb-3 py-5 fw-normal">Editar</h1>
            <form action="../actions/editarEleitor.jsp" method="POST">
                <label for="nome" class="form-label">Digite seu Nome</label>
                <input id="nome" class="form-control" type="text" value="<%=eleitor.getNome()%>" name="nome" required>
                <br>
                <label for="usuario" class="form-label">Usuário</label>
                <input id="usuario" class="form-control" type="text" value="<%=eleitor.getUsuario()%>" name ="usuario" required>
                <br>
                <label for="senha" class="form-label">Senha</label>
                <input id="senha" class="form-control" value="<%=eleitor.getSenha()%>" type="password" name ="senha" required>
                <br>

                <button type="submit" class="btn btn-primary">SALVAR</button>
                <a href=urnaEletronica.jsp class="btn btn-secondary">Voltar</a>


                <%if (request.getParameter("situacaoEdicao") != null && request.getParameter("situacaoEdicao") != "") {%>
                <%if (Integer.parseInt(request.getParameter("situacaoEdicao")) == 1) {%>
                <p class="text-center text-success">Salvo com sucesso!</p>
                <%} else if (Integer.parseInt(request.getParameter("situacaoEdicao")) == 2) {%>
                <p class="text-center text-danger">Erro ao salvar. Usuário já existe</p>
                <%
                        }
                    }
                %>
            </form>
        </main>

    </body>
</html>