
<%
	//se não existir usuario na sessão eu redireciono para a tela de login
	if (session.getAttribute("id") == null) {
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%
	}
%>

<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand navbar-brand-logo" href="./index.jsp">
                <div class="logo">
					<img src="img/r.jpeg" style="width: 50px; heigth: 50px;" />                </div>
                <div class="brand" style="width: 300px;"><% out.print(session.getAttribute("nome")); %></div>
              </a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">

							<!-- Menu Relatorios -->
							<li>
								<a href="index.jsp"> 
									<i class="pe-7s-home"> </i>
										<p>Inicio</p>
								</a>
							</li>
							
							<!-- Menu Usuarios -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="pe-7s-user"></i>
									<p>Usuario</p>
							</a>
								<ul class="dropdown-menu">
									
									<!-- <li class="divider"></li> -->
									<li><a href="UsuarioServlet?operacao=logout"><span class="glyphicon glyphicon-off"></span>   Sair</a></li>
								</ul>
							</li>
							
						</ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
<!--  end navbar --> 