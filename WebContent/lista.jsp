<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.sistema.crud.jdbc.dto.PessoaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
				<p id="msg">
				<% String msg = (String) request.getAttribute("msg");%>
				<%= msg != null ? msg : ""%><br>
				</p>

	<%	
	List<PessoaDTO> listaPessoa = (List<PessoaDTO>)request.getAttribute("listaPessoa");
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
 	%>
	<table border="1" cellpadding="2" cellspacing="4" width="600px;">
		<tr style="color: white" bgcolor="black" >
		
			<td>Nome:</td>
			<td>Dt.Nasciment</td>
			<td>Cidade</td>
			<td>Bairro</td>
			<td>UF</td>	
			<td colspan="2">Acoes</td>				
		</tr>
		
		<%
			for(PessoaDTO pessoaDTO : listaPessoa){
		%>
			<tr>		
				<td><%=pessoaDTO.getNome() %></td>
				<td><%= dateFormat.format(pessoaDTO.getDtNascimento()) %></td>
				<td><%=pessoaDTO.getEnderecoDTO().getCidade() %></td>
				<td><%=pessoaDTO.getEnderecoDTO().getBairro() %></td>
				<td><%=pessoaDTO.getEnderecoDTO().getUfDTO().getSiglaUF() %></td>
				<td><a href="pessoaServelet?acao=edita&idPessoa=<%= pessoaDTO.getIdPessoa()%>"> Editar</a></td>
				<td><a href="pessoaServelet?acao=remover&idPessoa=<%= pessoaDTO.getIdPessoa()%>&idEndereco=
				<%=pessoaDTO.getEnderecoDTO().getIdEndereco()%>">Excluir</a></td>
			</tr>
			<% } %>
		
	</table>

</body>
</html>