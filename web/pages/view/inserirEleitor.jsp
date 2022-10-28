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
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Eleitor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        <%
            EleitorDAO eleitorRepository = new EleitorDAO();

            EleitorDTO eleitor = new EleitorDTO();
        %>
        <main class="form-signin w-25 m-auto">
            <h1 class="h3 text-center mb-3 py-5 fw-normal">Cadastrar</h1>
            <form action="../actions/inserirEleitor.jsp" method="POST">
                <label for="nome" class="form-label">Digite seu nome</label>
                <input id="nome" class="form-control" type="text" name="nome" required>
                <br>
                <label for="dataNascimento" class="form-label">Informe seu Titulo Eleitoral</label>
                <input id="tituloEleitoralEleitor" class="form-control" type="number" name="tituloEleitoralEleitor" required>
                <br>
                <label for="usuario" class="form-label">Usuário</label>
                <input id="usuario" class="form-control" type="text" name ="usuario" required>
                <br>
                <label for="senha" class="form-label">Senha</label>
                <input id="senha" class="form-control" type="password" name ="senha" required>
                <br>

                <%if (request.getParameter("tituloEleitoralEleitor") != null) {%>
                <p class="text-danger">Erro na validação do título eleitoral</p>
                <%} else if (request.getParameter("usuario") != null) {%>
                <p class="text-danger">Erro na validação do usuário.</p>
                <%
                    }
                %>

                <button type="submit" class="btn btn-primary">CADASTRAR</button>
                <a href="../../index.jsp" class="btn btn-secondary">Voltar</a>
            </form>
        </main>

    </body>
</html>