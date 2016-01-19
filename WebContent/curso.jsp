<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Curso | PosGraduacaoRecommander</title>

	<!-- Bibliotecas JavaScript -->
	
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src='js/bootstrap.min.js' type="text/javascript"></script>
	<script src='js/ct-navbar.js' type="text/javascript"></script>
	<script src='js/rodape.js' type="text/javascript"></script>

    <!-- Estilos CSS -->

	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/metro-bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/docs.css">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link rel="stylesheet" type="text/css" href="css/ct-navbar.css">
	<link rel="stylesheet" href="css/pe-icon-7-stroke.css" />
	<link rel="stylesheet" href="css/pe-icon-7-stroke.css" />
	

</head>

<body>
	
	<!-- Static navbar -->
    <jsp:include page="navbar.jsp" />
    
    <jsp:useBean id="servlet" class="br.puc.servlets.CursoServlet" scope="session" />
    
    <div class="container" style="margin-top:150px">
    
	    <h3 id="thumbnails-default">Funções</h3>
	
	
		<div class="grid">
		    <div class="row col-md-12">
		          <div class="tile tile-green col-md-3 col-xs-12"  >
		            <a href="#" >
		              <h1>Cadastrar Novo Curso</h1>
		            </a>
		          </div>
		          
		          <div class="tile tile-blue col-md-3 col-xs-12"  >
		          
		          	<a href="CursoServlet?operacao=gerarArqInvertido" >
		              <h1>Gerar Arquivo Invertido</h1>
		            </a>
		          
		          </div>
		          
		          <div class="tile tile-orange col-md-3 col-xs-12"  >
		          
		          	<a href="./index.jsp" >
		              <h1>Voltar</h1>
		            </a>
		          
		          </div>
		          
		      </div>
	    </div>
	    
    </div>


    <jsp:include page="rodape.jsp" />
</body>
</html>