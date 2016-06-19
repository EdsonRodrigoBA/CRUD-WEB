<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" />
 <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap-theme.min.css" />
  <link rel="stylesheet" type="text/css" href="./bootstrap/css/meu.css" />
 
 <script src="./bootstrap/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="loginServelet" method="post">
	<jsp:include page="barasuperio.jspf"></jsp:include>

		<fieldset style="width: 400px; margin:0 auto; padding: 20px; margin-top: 50px; border-bottom-color:red; ">
				<p id="msg">
				<% String msg = (String) request.getAttribute("msg");%>
				<%= msg != null ? msg : ""%><br>
				</p>	
				<div class="form-group">
                            <label for="nome" class="col-sm-3 control-label">Nome</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="nome" name="nome"
                                    placeholder="Digite aqui seu usuário" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="senha" class="col-sm-3 control-label">Senha</label>
                            <div class="col-sm-6">
                                <input type="password" id="senha" class="form-control" name="senha"
                                    placeholder="Digite aqui sua senha" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-10">
                                <button type="submit" class="btn btn-default">Criar
                                    conta</button>
                            </div>
                        </div>
               <fieldset style="width: 400px; margin:0 auto; padding: 20px; margin-top: 50px;">
                        
	</form>	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="./bootstrap/js/jquery.js"></script>
 <script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>