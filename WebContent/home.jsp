<%@page import="br.sistema.crud.jdbc.dto.UfDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>


</head>
<body>

	<form action="pessoaServelet?acao=cadastra" method="post">
	
		<fieldset>
				<p id="msg">
				<% String msg = (String) request.getAttribute("msg");%>
				<%= msg != null ? msg : ""%><br>
				</p>
			<legend>Cadastrar Cliente</legend>

			<table>
				<tr>
					<td>Nome</td>
					<td><input type="text" name="nome"></td>
				</tr>
				<tr>
					<td>CPF</td>
					<td><input type="text" name="cpf"></td>
				</tr>
				<tr>
					<td>Dt.Nascimento</td>
					<td><input type="text" name="nascimento"></td>

				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Sexo</legend>

			<table>
				<tr>
					<td>Sexo
					
					<input type="radio" name="sexo" value="M" checked="checked">Masculino
					<input type="radio" name="sexo" value="F">Feminino</td>
				</tr>

			</table>
		</fieldset>
		
		<fieldset>
			<legend>ENDERECO</legend>

			<table>
				<tr>
					<td>Logradouro</td>
					<td><input type="text" name="logradouro"></td>
				</tr>
				<tr>
					<td>Bairro</td>
					<td><input type="text" name="bairro"></td>
				</tr>
				<tr>
					<td>Cidade</td>
					<td><input type="text" name="cidade"></td>
				</tr>
				<tr>
					<td>Numero</td>
					<td><input type="text" name="numero"> </tdnumero>
				</tr>
				<tr>
					<td>cep</td>
					<td><input type="text" name="cep"> </tdnumero>
				</tr>
				<tr>
					<td>UF</td>
					<td>
					<select name="uf">
					
						<% List<UfDTO> lista =(List<UfDTO>)session.getAttribute("listaUF"); 
							for(UfDTO ufDTO : lista){
								
							
						%>
							<option value="<%= ufDTO.getIdUF() %>">
								<%= ufDTO.getDescricao() %>
							</option>
						<%
							}
						%>

					</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<input type="submit" value="cadastrar"> <input type="reset"
			value="limpar">
	</form>

</body>
</html>