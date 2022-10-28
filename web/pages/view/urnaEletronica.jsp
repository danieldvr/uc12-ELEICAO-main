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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="../css/styleUrna.css" rel="stylesheet"/>
        <%
            if (LoggedUser.getEleitor() == null || LoggedUser.getEleitor() == new EleitorDTO()) {
                response.sendRedirect("../../index.jsp");
            }
        %>
        <title>Listagem de Usuários</title>
    </head>
    <body>
        <header class="container d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <% if (LoggedUser.getEleitor().getTituloEleitoralEleitor() == 000000000) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Ações do Administrador</a>
                    <ul class="dropdown-menu">
                        <div class="row justify-content-center">


                        </div>   
                        <li><a href = "votoResult.jsp" class="dropdown-item">Verificar Resultado</a></li>
                        <li><a href = "../actions/reinciarEleicao.jsp" class="dropdown-item">Reiniciar Eleição</a></li>
                        <li><a class="dropdown-item" href="./gerenciarCandidatos.jsp">Gerenciar Candidatos</a></li>
                    </ul>
                </li>
                <%}%>
                <li><a href="candidatar.jsp" class="nav-link px-2 link-dark">Gerenciar Candidatura</a></li>
            </ul>

            <div class="col-md-4 d-flex flex-nowrap text-end">
                <span class="me-2">Bem vindo, <%=LoggedUser.getEleitor().getNome()%></span>
                <%if (LoggedUser.getEleitor().getTituloEleitoralEleitor() != 0){%>
                <a href="editarEleitor.jsp" class="btn btn-primary me-2">Editar</a>
                <%}%>
                <a href="../../index.jsp" class="btn btn-primary">Sair</a>
            </div>
        </header>

        <%
            VotoDTO votoDTO = new VotoDTO();
        %>
        <form action="../actions/votar.jsp" class="w-100 justify-content-center d-flex">
            <div class="container-lg">
                <div class="row row-cols-2 row-cols-md-2 mb-1 text-center" id="firstRow">
                    <div class="col-12 col-md-12 h-100">
                        <div class="mb-1 rounded-3 shadow-sm border border-dark h-100">
                            <div class="h-100">
                                <!--INPUT DE TEXTO AHSDGAISDFGADLKOJFKGBSDFJLGSDFHasfasdfsadfgasfgasdfgafgasdfgasdf-->
                                <input type="text" for="numeroCandidato" id="numeroCandidato" onclick="numeroCandidato.blur()" name="numeroCandidato" class="d-flex align-content-center flex-wrap h-100 justify-content-center"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-1 text-center">
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('1')">
                            <div class="-body">
                                <h1>1</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('2')">
                            <div class="-body">
                                <h1>2</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('3')">
                            <div class="-body">
                                <h1>3</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-4 row-cols-md-4 mb-1 text-center">
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('4')">
                            <div class="-body">
                                <h1>4</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('5')">
                            <div class="-body">
                                <h1>5</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('6')">
                            <div class="-body">
                                <h1>6</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm border btn-light btn border-dark" onclick="alterarNumero('7')">
                            <div class="-body">
                                <h1>7</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('8')">
                            <div class="-body">
                                <h1>8</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('9')">
                            <div class="-body">
                                <h1>9</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class=" mb-1 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark" onclick="alterarNumero('0')">
                            <div>
                                <h1>0</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
                <div class="row row-cols-3 row-cols-md-3 mb-1 text-center">
                    <div class="col-md-4">
                        <div class="d-flex justify-content-center mb-1 h-100 mx-0 rounded-3 w-100 align-items-center shadow-sm btn btn-warning border border-dark especial-button" onclick="corrigir()">
                            <div class="">
                                <h1 class=" ">Corrigir</h1>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="d-flex justify-content-center mb-1 h-100 mx-0 rounded-3 w-100 align-items-center shadow-sm btn btn-light border border-dark pointer">
                            <a href="../actions/votar.jsp?numeroCandidato=00000000">
                                <h1 class="text-dark">Branco</h1>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="border-dark btn btn-success w-100 h-100  especial-button">
                            <button type="submit" class="btn h-100  text-decoration-none text-dark fw-bold  especial-button">
                                <h1 class="text-white">Confirmar</h1>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
            VotoDAO votos = new VotoDAO();
            if (votos.procurarPorTituloEleitoral(LoggedUser.getEleitor().getTituloEleitoralEleitor())) {%>
        <p class="text-center text-success">Voto validado com sucesso!</p>
        <%} else {%>


        <%if (request.getParameter("situacaoVoto") != null && request.getParameter("situacaoVoto") != "") {%>
        <%if (Integer.parseInt(request.getParameter("situacaoVoto")) == 1) {%>
        <p class="text-center text-success">Voto validado com sucesso!</p>
        <%} else if (Integer.parseInt(request.getParameter("situacaoVoto")) == 2) {%>
        <p class="text-center text-danger">Voto inválido.</p>
        <%
                    }
                }
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <script src="../javascript/functionUrna.js"></script>
    </body>
</html>
