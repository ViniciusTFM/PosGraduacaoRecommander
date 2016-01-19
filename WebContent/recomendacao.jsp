<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page language="java" import="java.util.*,java.lang.*" %> 
<%@ page language="java" import="br.puc.entidades.Competencia" %> 
<%@ page language="java" import="br.puc.controller.UsuarioController" %> 

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Recomenda��o | PosGraduacaoRecommander</title>

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

    <div class="container" style="margin-top:150px">
    
		<form class="form-horizontal" name="cadastro_usuarios" action="UsuarioServlet" method="post">
		
			<fieldset>
				<legend>Recomenda��o</legend>
				
					<% int teste = 0; %>
					
					<c:forEach var="value" items="${listaRecomendacoes}" varStatus="key"> 

						<c:if test="${key.index == 0}">
						
							<h3>O curso mais recomendado para o seu perfil �: </h3>
						
							<hr>
						
							<li class="list-group-item">
								<h5>
							   		<c:out value="${value}"></c:out>
							   	</h5>
							</li> 
							  
							<br>
						</c:if>
						<% if (teste == 0 ){ 
							teste = 1; 
							out.print("<h3>Outros cursos recomendados para voc�: </h3>");
							out.print("<hr><ul class='list-group'>");
						}%>
						
						<c:if test="${key.index > 0}">
						
							
							   <li class="list-group-item">
							   		<h5>
							   			<c:out value="${value}"></c:out>
							   		</h5>
							   </li> 
							  
							<br>
						</c:if>
						
					</c:forEach>
					
					</ul>

			</fieldset>
		</form>
	</div>

    <jsp:include page="rodape.jsp" />
</body>
</html>