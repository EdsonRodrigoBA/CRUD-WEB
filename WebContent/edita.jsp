<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.sistema.crud.jdbc.dto.PessoaDTO"%>
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

	<form action="pessoaServelet?acao=atualizar" method="post">
	
		<fieldset>
				<p id="msg">
				<% String msg = (String) request.getAttribute("msg");
				PessoaDTO pessoaDTO = (PessoaDTO) request.getAttribute("pessoaDTO");
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

				%>
				<%= msg != null ? msg : ""%><br>
				</p>
			<legend>Cadastrar Cliente</legend>
			
			<input type="hidden" name="idPessoa" value="<%= pessoaDTO.getIdPessoa()%>">
			<input type="hidden" name="idEndereco" value="<%= pessoaDTO.getEnderecoDTO().getIdEndereco()%>">
			<input type="hidden" name="idUF" value="<%= pessoaDTO.getEnderecoDTO().getUfDTO().getIdUF()%>">

			
			<table>
				<tr>
					<td>Nome</td>
					<td><input type="text" name="nome" value="<%= pessoaDTO.getNome()%>"></td>
				</tr>
				<tr>
					<td>CPF</td>
					<td><input type="text" name="cpf" value="<%= pessoaDTO.getCpf()%>"></td>
				</tr>
				<tr>
					<td>Dt.Nascimento</td>
					<td><input type="text" name="nascimento" value="<%= dateFormat.format(pessoaDTO.getDtNascimento())%>"></td>

				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>Sexo</legend>

			<table>
				<tr>
					<td>Sexo
					<%if(pessoaDTO.getSexo() == 'M'){ %>
					<input type="radio" name="sexo" value="M" checked="checked" >Masculino
					<input type="radio" name="sexo" value="F" >Feminino</td>
					<% }else{ %>
						<input type="radio" name="sexo" value="M"  >Masculino
						<input type="radio" name="sexo" value="F" checked="checked" >Feminino</td>
				<%	} %>
					
				</tr>

			</table>
		</fieldset>
		
		<fieldset>
			<legend>ENDERECO</legend>

			<table>
				<tr>
					<td>Logradouro</td>
					<td><input type="text" name="logradouro" value="<%=pessoaDTO.getEnderecoDTO().getLogadouro()%>"></td>
				</tr>
				<tr>
					<td>Bairro</td>
					<td><input type="text" name="bairro" value="<%=pessoaDTO.getEnderecoDTO().getBairro()%>"></td>
				</tr>
				<tr>
					<td>Cidade</td>
					<td><input type="text" name="cidade" value="<%=pessoaDTO.getEnderecoDTO().getCidade()%>"></td>
				</tr>
				<tr>
					<td>Numero</td>
					<td><input type="text" name="numero" value="<%=pessoaDTO.getEnderecoDTO().getNumero()%>"> </tdnumero>
				</tr>
				<tr>
					<td>cep</td>
					<td><input type="text" name="cep" value="<%=pessoaDTO.getEnderecoDTO().getCep()%>"> </tdnumero>
				</tr>
				<tr>
					<td>UF</td>
					<td>
					<select name="uf">
					
						<% List<UfDTO> lista =(List<UfDTO>)session.getAttribute("listaUF"); 
							for(UfDTO ufDTO : lista){
								if(ufDTO.getIdUF().equals(pessoaDTO.getEnderecoDTO().getUfDTO().getIdUF())){	
						%>
							<option value="<%= ufDTO.getIdUF() %>" selected="selected">
								<%= ufDTO.getDescricao() %>
							</option>
								<%
								}else{
								%>
									<option value="<%= ufDTO.getIdUF() %>">
									<%= ufDTO.getDescricao() %>
								</option>		
						<%
								}
							}
						%>

					</select>
					</td>
				</tr>
			</table>
		</fieldset>
		<input type="submit" value="Atualizar"> <input type="reset"
			value="limpar">
	</form>

</body>
</html>