<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login | PosGraduacaoRecommander</title>


 	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/login.css" />
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

	
    <!-- js -->
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src='js/bootstrap.min.js' type="text/javascript"></script>
	<script src="js/ct-navbar.js" type="text/javascript"></script>
	<script src='js/rodape.js' type="text/javascript"></script>
	
<body>

<!-- Static navbar -->
    <jsp:include page="navbar_nao_autenticado.jsp" />

		<div class="container" style="margin-top:150px">
			
			<div class="row" style="rigth: 50%">
				<div class="col-md-3 col-xs-12">
				
        			<div class="panel-title" align="center">
						<img src="img/r.jpeg" />
					</div>
					
					<hr />
						
					<form accept-charset="UTF-8" class="form-signin" action="UsuarioServlet" method="post">
						<fieldset>
							<div class="login_result"></div>
								
							<label class="panel-login"> </label> 
								
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input class="form-control" placeholder="E-mail" id="username" type="email" name="email" /> 
							</div>
								
								
							<input type="hidden" name="operacao" value="login" /> 
							<input type="submit" value="Entrar" class="btn btn-lg btn-primary btn-block" onclick="notificacao();">
								
						 </fieldset>
					</form> 
					<br>
					<a href="./cadastro_usuario.jsp">
						Criar uma nova conta
					</a>
            
        		</div>
			</div>
		</div><!-- //row -->
	   <jsp:include page="rodape.jsp" />
	   
</body>
</html>