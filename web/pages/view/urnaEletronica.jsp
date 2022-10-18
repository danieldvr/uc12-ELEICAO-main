<%--
    Document   : listarCliente
    Created on : 29/06/2022, 21:05:09
    Author     : sala19a
--%>

<%@page import="br.com.DTO.VotoDTO"%>
<%@page import="br.com.DAO.VotoDAO"%>
<%@page import="br.com.Config.LoggedUser"%>
<%@page import="br.com.DTO.EleitorDTO"%>
<%@page import="br.com.DAO.EleitorDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href="../css/styleUrna.css" rel="stylesheet"/>
        <%
            if (LoggedUser.getEleitor().getTituloEleitoralEleitor() == null) {
                response.sendRedirect("../../index.jsp");
            }
        %>
        <title>Listagem de Usuários</title>
    </head>
    <body>
        <div class="bg-white">
            <div class="container">
                <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                    <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                    </a>

                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="candidatar.jsp" class="nav-link px-2 link-dark">Candidatar-se</a></li>
                    </ul>

                    <div class="col-md-3 text-end">
                        <span class="me-2">Bem vindo, <%=LoggedUser.getEleitor().getNome()%></span>
                        <a href="editarEleitor.jsp" class="btn btn-primary">Editar</a>
                        <a href="../../index.jsp" class="btn btn-primary">Sair</a>
                    </div>
                </header>
            </div>
        </div>

        <%
            VotoDTO votoDTO = new VotoDTO();
        %>
        <form action="../actions/votar.jsp" class="w-100 justify-content-center d-flex">
            <div class="w-50 d-block">
                <div class="row row-cols-2 row-cols-md-2 mb-1 text-center" id="row1">
                    <div class="col-8 col-md-8 h-100">
                        <div class="card mb-1 rounded-3 shadow-sm border border-dark h-100">
                            <div class="card-body h-100">
                                <!--INPUT DE TEXTO AHSDGAISDFGADLKOJFKGBSDFJLGSDFHasfasdfsadfgasfgasdfgafgasdfgasdf-->
                                <input type="text" id="numeroCandidato" name="numeroCandidato" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 col-md-4">
                        <div class="card mb-1 rounded-3 d-flex align-content-center w-100 align-items-center shadow-sm border border-dark h-100">
                            <div class="d-flex align-content-center flex-wrap h-100">
                                <h1>Imagem</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('7')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title">7</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('8')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">8</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('9')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">9</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('4')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">4</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('5')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">5</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('6')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">6</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm border btn-outline-dark btn border-dark" onclick="alterarNumero('1')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">1</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('2')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">2</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('3')">
                            <div class="card-body" style="cursor: pointer">
                                <h1 class="card-title pricing-card-title">3</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col">
                    </div>
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark" onclick="alterarNumero('0')">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">0</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-warning border border-dark" onclick="corrigir()">
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">Corrigir</h1>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-outline-dark border border-dark">
                            <a href="../actions/votar.jsp?numeroCandidato=00000000" class="card-body">
                                <h1 class="card-title pricing-card-title" style="cursor: pointer">Branco</h1>
                            </a>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card border-dark btn btn-success">
                            <input type="submit" class="btn card-title w-100 h-100 pricing-card-title text-decoration-none text-dark fs-2 fw-bold" value="Confirmar"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
            VotoDAO votos = new VotoDAO();
            if (votos.procurarPorTituloEleitoral(LoggedUser.getEleitor().getTituloEleitoralEleitor())) {%>
        <p class="text-center text-danger">Você não pode votar mais de uma vez</p>
        <%}%>
        <% if (LoggedUser.getEleitor().getTituloEleitoralEleitor() == 000000000) {%>
        <div class="row justify-content-center">
            <a href = "votoResult.jsp" class="btn btn-success text-center w-25 mx-1">Verificar Resultado</a>
            <a href = "../actions/reinciarEleicao.jsp" class="btn btn-success text-center w-25 mx-1">Reiniciar Eleição</a>        
        </div>    
        <%}%>

        <script src="../javascript/functionUrna.js"></script>
    </body>
</html>
