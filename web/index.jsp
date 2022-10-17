<%-- 
    Document   : index
    Created on : 25/07/2022, 21:18:14
    Author     : sala19a
--%>

<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.EleitorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%LoggedUser.setEleitor(new EleitorDTO());%>
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        <main class="form-signin w-25 m-auto">
            <%EleitorDTO eleitor = new EleitorDTO();%>
            <form action="/uc12-ELEICAO-main/pages/actions/logarEleitor.jsp?usuario=<%=eleitor.getUsuario()%>&senha=<%=eleitor.getSenha()%>" method="GET">
                <h1 class="h3 text-center mb-3 py-5 fw-normal">Login</h1>

                <div class="form-floating">
                    <input id="usuario" class="form-control" type="text" name ="usuario" required>
                    <label for="usuario">Usuário</label>
                </div><br>
                <div class="form-floating">
                    <input id="senha" class="form-control" type="password" name ="senha" required>
                    <label for="senha">Senha</label>
                </div><br>

                <button class="w-100 btn btn-lg btn-primary" type="submit">Entrar</button>
                <div class="w-100 text-center py-3">
                    <a class="w-10" href="pages/view/inserirEleitor.html">Cadastrar</a>
                </div>
                <p class="mt-5 text-center mb-3 py-5 text-muted">© Eleições 2022</p>
            </form>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
