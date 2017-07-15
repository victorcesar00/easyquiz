<%@page import="model.domain.QuestaoFechadaResposta"%>
<%@page import="model.domain.Perfil"%>
<%@page import="model.domain.Usuario"%>
<%@page import="model.service.ManterPerfil"%>
<%@page import="model.serviceimpl.ManterPerfilImpl"%>
<%@page import="model.daoimpl.PerfilDAOImpl"%>
<%@page import="model.serviceimpl.ManterUsuarioImpl"%>
<%@page import="model.service.ManterUsuario"%>
<%@page import="model.service.ManterUsuario"%>
<%@page import="model.daoimpl.UsuarioDAOImpl"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.Instant"%>
<%@page import="controller.Login"%>
<%@page import="model.domain.QuestaoFechada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="model.domain.Questao"%>
<%@page import="java.util.List"%>
<%@page import="controller.ListarQuestao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int logado = Login.validarSessao(request, response);
    Usuario user = null;
    if(logado==1) {
        Long cod_Usuario = (Long) request.getSession().getAttribute("cod_Usuario");
        ManterUsuario manterUsuario = new ManterUsuarioImpl(UsuarioDAOImpl.getInstance());
        user = manterUsuario.getUsuarioById(cod_Usuario);
    }
    
    
%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>EasyQuiz</title>
        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/materialize.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/styleTelaQuestoes.css"/>
    </head>
    
<nav class="nav-extended" style="background-color:#FFFFFF;">
            <div class="container" style="display: inline; margin-left: 50px;">
                <a id="logo-container" href="#" style="color:#47525E; font-size: 32px;">EasyQuiz</a>
                <ul id="side-nav" class="right hide-on-med-and-down">
                    <% if(logado ==0) {          %>
                    <form name="frmLogin" method='post'>
                    <li> 
                        <input id="email" placeholder="email" name="email" type="email" class="form-control" style="color: #696969;border-color:#D3D3D3;">
                    </li>
                    <li>&ensp;</li>
                    <li>
                        <input id="password" placeholder="senha" name="senha" type="password" class="validate" style="color: #696969;border-color:#D3D3D3;">
                    </li>
                    <a class="btn-small waves-effect waves-light grey darken-2 btn" onclick="validarCamposLogin()">Login</a>
                    <a class="btn-small waves-effect waves-light grey darken-2 btn" href="./Cadastro.jsp">Cadastrar</a>
                     </form>
                    <% }else{ %>
                     <li> 
        <h5 style="color:#47525E; font-size: 32px;"> Bem vindo </h5>

      </li>
      <li>
        <h5 style="color:#EE6363; font-size: 32px;">&ensp; <% user.getNome(); %> </h5> 
      </li>

      <li><a class="waves-effect waves-light grey darken-2 btn" href="#">&ensp;Perfil&ensp;</a></li>
        <% if(user.getPerfil().getId() == 2) { %>
      <li><a class="waves-effect waves-light grey darken-2 btn" href="#">Questões</a></li>
       <% } %>
      <li><a class="waves-effect waves-light grey darken-2 btn" href="#">Sair</a></li>
                    <% } %>
                </ul>
            </div>
            <div class="row" style="background-color: #EE6363; margin-top: 15px;" >
                <div class="col s8" >Matérias comuns:
                    <a id="botao-matematica" class="waves-effect waves-light" style="margin-left: 5px; margin-right: 5px; padding-left: 5px; padding-right: 5px; padding-top: 2px; background-color: #E5E9F2; color: #47525E">Matemática</a>
                    <a id="botao-portugues" class="waves-effect waves-light" style="margin-left: 5px; margin-right: 5px; padding-left: 5px; padding-right: 5px; padding-top: 2px; background-color: #E5E9F2; color: #47525E">Português</a>
                    <a id="botao-fisica" class="waves-effect waves-light" style="margin-left: 5px; margin-right: 5px; padding-left: 5px; padding-right: 5px; padding-top:    2px; background-color: #E5E9F2; color: #47525E">Física</a>
                </div>
                <div class="col s4">
                    <a class="btn-small waves-effect waves-light grey darken-2 btn" onclick="mostrarform()">Filtrar</a></li>  			
                </div>
            </div>
            <div class="row " id="pesquisa" style="display: none; position: absolute;   width: 47%; background: rgba(255, 255, 255, 0.7);">
                <div class="col s12 offset-s12" id="pesquisa" style="border: 4px solid; border-color:#D3D3D3; background: rgba(255, 255, 255, 1.0); ; text-align:center;border-radius: 10px; z-index: 2;" >
                    <form>
                        <input id="search" type="search" placeholder="Busque por palavras chave" style="color: #696969;">
                        <div class="row">
                            <div class="input-field col s6">
                                <select id="nivel">
                                    <option value="" disabled selected>Escolha uma Dificuldade</option>
                                    <option value="1">Fácil</option>
                                    <option value="2">Médio</option>
                                    <option value="3">Difícil</option>
                                    <option value="4">Desafio</option>
                                    <option value="0">Nenhum</option>
                                </select>
                            </div>
                            <div class="input-field col s6">
                                <select id="materia">
                                    <option value="" disabled selected>Escolha uma Matéria</option>
                                    <option value="1">Matemática</option>
                                    <option value="2">Português</option>
                                    <option value="3">Física</option>
                                    <option value="4">Geografia</option>
                                    <option value="5">História</option>
                                    <option value="6">Química</option>
                                    <option value="7">Inglês</option>
                                    <option value="0">Nenhum</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <select id="tipo">
                                    <option value="" disabled selected>Escolha um tipo</option>
                                    <option value="1">Aberta</option>
                                    <option value="2">Fechada</option>
                                    <option value="3">Nenhum</option>
                                </select>
                            </div>
                            <div class="input-field col s6">
                                <select id="materia">
                                    <option value="" disabled selected>Escolha um módulo</option>
                                    <option value="0">Nenhum</option>
                                </select>
                            </div>
                        </div>
                    </form>
                    <button class="btn-large waves-effect waves-light grey darken-2" type="submit" name="action">avançar 
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>
        </nav>
    <div class="container" ></div>
        
       