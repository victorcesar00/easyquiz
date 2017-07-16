<%-- 
    Document   : gerenciamentoquestoes
    Created on : 16/07/2017, 14:14:42
    Author     : Luiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>EasyQuiz</title>

  <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
	<link rel="stylesheet" href="css/gq.css">
    </head>
    <body>
        <!--- Javascrip -->

<!-- nav cor #EE6363 -->
<jsp:include page ="Menu.jsp"/>

    <div class="container" style=" z-index: 1">
   		<div class="container">
				<h4>Questões cadastradas:</h4>
			</div>
			<div class="row">
				<div class="col s8 m9 l9" id="divQuestoes">
				<div class="container questao" id="questao1">	
					<div class="deep-orange darken-1 white-text cabecalho">
					<strong>Física</strong> > Termodinâmica
					</div>
					<div class="content-questao">
						<div class="container" id="container-img1">
							<img id="imagem1" class="responsive-img center" src="Geladeira.png">
						</div>
						<form action="#" id="form1">
							<div>
								<div id="enunciado1">
									<p class="enun">A invenção da geladeira proporcionou uma revolução no aproveitamento dos alimentos, ao permitir que fossem armazenados e transportados por longos períodos. A figura apresentada ilustra o processo cíclico de funcionamento de uma geladeira, em que um gás no interior de uma tubulação é forçado a circular entre o congelador e a parte externa da geladeira. É por meio dos processos de compressão, que ocorre na parte externa, e de expansão, que ocorre na parte interna, que o gás proporciona a troca de calor entre o interior e o exterior da geladeira. Nos processos de transformação de energia envolvidos no funcionamento da geladeira, </p>
								</div>
								<div id="alternativas1">
									<p>
										<input class="with-gap" name="grupo1" type="radio" id="alternativa1"  />
										<label for="alternativa1"><b>a)</b> a expansão do gás é um processo que cede a energia necessária ao resfriamento da parte interna da geladeira. </label>
									</p>
									<p>
										<input class="with-gap" name="grupo1" type="radio" id="alternativa2"  />
										<label for="alternativa2"><b>b)</b> o calor flui de forma não espontânea da parte mais fria, no interior, para a mais quente, no exterior da geladeira. </label>
									</p>
									<p>
										<input class="with-gap" name="grupo1" type="radio" id="alternativa3"  />
										<label for="alternativa3"><b>c)</b> a quantidade de calor cedida ao meio externo é igual ao calor retirado da geladeira.</label>
								</p>
								<p>
									<input class="with-gap" name="grupo1" type="radio" id="alternativa4"  />
									<label for="alternativa4"><b>d)</b> a eficiência é tanto maior quanto menos isolado termicamente do ambiente externo for o seu compartimento interno.</label>
								</p>
								<p>
									<input class="with-gap" name="grupo1" type="radio" id="alternativa5"  />
									<label for="alternativa5"><b>e)</b> a energia retirada do interior pode ser devolvida à geladeira abrindo-se a sua porta, o que reduz seu consumo de energia.</label>
								</p>
							</div>
							<br>
							<div class="row">
								<div class="col s6" name="divEditar">
									<a class="waves-effect waves-light btn deep-orange darken-1" onclick="editarquestao('questao1', this)"><i class="material-icons left">edit</i>Editar questão</a>
								</div>
								<div class="col s6" name="divExcluir">
									<a class="waves-effect waves-light btn deep-orange darken-1"><i class="material-icons left">delete</i>Excluir questão</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="container questao" id="questao2">	
					<div class="deep-orange darken-1 white-text cabecalho">
					<strong>Português</strong> > Modernismo
					</div>
					<div class="content-questao">
						<form action="#" id="form2">
							<div>
								<div id="enunciado2">
									<p class="enun">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
								</div>
								<div id="resposta-aberta2">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
							</div>
							<br>
							<div class="row">
								<div class="col s6" name="divEditar">
									<a class="waves-effect waves-light btn deep-orange darken-1" onclick="editarquestao('questao2', this)"><i class="material-icons left">edit</i>Editar questão</a>
								</div>
								<div class="col s6" name="divExcluir">
									<a class="waves-effect waves-light btn deep-orange darken-1"><i class="material-icons left">delete</i>Excluir questão</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col s4 m3 l3">
				<a class="waves-effect waves-light btn deep-orange darken-1" href="adicionarQuestao.jsp"><i class="material-icons left">add</i>Adicionar questão</a><!-- mudar cor -->
		</div>	
		</div>
    </div>
    
    <br><br>
  <jsp:include page ="Footer.jsp"/>
  <!--  Scripts-->
  <script src="js/gq.js"></script>
    </body>
</html>