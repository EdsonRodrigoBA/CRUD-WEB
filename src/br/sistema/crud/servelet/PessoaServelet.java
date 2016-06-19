package br.sistema.crud.servelet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Data;

import br.sistema.crud.jdbc.bo.PessoaBO;
import br.sistema.crud.jdbc.dao.PessoaDAO;
import br.sistema.crud.jdbc.dto.EnderecoDTO;
import br.sistema.crud.jdbc.dto.PessoaDTO;
import br.sistema.crud.jdbc.dto.UfDTO;

/**
 * Servlet implementation class PessoaServelet
 */
@WebServlet("/pessoaServelet")
public class PessoaServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acao = req.getParameter("acao");
		String proximaPage = "home.jsp";

		try {
			PessoaBO pessoaBO = new PessoaBO();

			if (acao.equals("cadastra")) {
				DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
				String nome = req.getParameter("nome");
				String cpf = req.getParameter("cpf");
				String dataNascimento = req.getParameter("nascimento");
				String sexo = req.getParameter("sexo");
				String logradouro = req.getParameter("logradouro");
				String bairro = req.getParameter("bairro");
				String cidade = req.getParameter("cidade");
				String numero = req.getParameter("numero");
				String numCep = req.getParameter("cep");
				String idUF = req.getParameter("uf");

				PessoaDTO pessoaDTO = new PessoaDTO();
				pessoaDTO.setCpf(Long.parseLong(cpf));
				pessoaDTO.setNome(nome);
			 pessoaDTO.setDtNascimento(format.parse(dataNascimento));
				pessoaDTO.setSexo(sexo.charAt(0));

				EnderecoDTO enderecoDTO = new EnderecoDTO();
				enderecoDTO.setLogradouro(logradouro);
				enderecoDTO.setBairro(bairro);
				enderecoDTO.setCidade(cidade);
				enderecoDTO.setNumero(Long.parseLong(numero));
				enderecoDTO.setCep(Integer.parseInt(numCep));

				UfDTO ufDTO = new UfDTO();
				ufDTO.setIdUF(Integer.parseInt(idUF));
				enderecoDTO.setUfDTO(ufDTO);
				pessoaDTO.setEnderecoDTO(enderecoDTO);

				pessoaBO.cadastrar(pessoaDTO);
				req.setAttribute("msg", "cadastrado com Sucesso");
				proximaPage = "pessoaServelet?acao=listar";

			}else if (acao.equals("listar")){
				List<PessoaDTO> lista = pessoaBO.listaTudo();
				req.setAttribute("listaPessoa", lista);
				proximaPage = "lista.jsp";
				
			}else if(acao.equals("edita")){
				String idPessoa = req.getParameter("idPessoa");
				PessoaDTO pessoaDTO =pessoaBO.buscaPorId(Integer.parseInt(idPessoa));
				req.setAttribute("pessoaDTO", pessoaDTO);
				proximaPage = "edita.jsp";
				
			}else if (acao.equals("atualizar")){
				
				
				DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
				String idPessoa = req.getParameter("idPessoa");
				String idEndereco = req.getParameter("idEndereco");

				String nome = req.getParameter("nome");
				String cpf = req.getParameter("cpf");
				String dataNascimento = req.getParameter("nascimento");
				String sexo = req.getParameter("sexo");
				String logradouro = req.getParameter("logradouro");
				String bairro = req.getParameter("bairro");
				String cidade = req.getParameter("cidade");
				String numero = req.getParameter("numero");
				String numCep = req.getParameter("cep");
				String idUF = req.getParameter("uf");

				PessoaDTO pessoaDTO = new PessoaDTO();
				pessoaDTO.setIdPessoa(Integer.parseInt(idPessoa));
				pessoaDTO.setCpf(Long.parseLong(cpf));
				pessoaDTO.setNome(nome);
				pessoaDTO.setDtNascimento(format.parse(dataNascimento));
				pessoaDTO.setSexo(sexo.charAt(0));

				EnderecoDTO enderecoDTO = new EnderecoDTO();
				enderecoDTO.setIdEndereco(Integer.parseInt(idEndereco));
				enderecoDTO.setLogradouro(logradouro);
				enderecoDTO.setBairro(bairro);
				enderecoDTO.setCidade(cidade);
				enderecoDTO.setNumero(Long.parseLong(numero));
				enderecoDTO.setCep(Integer.parseInt(numCep));

				UfDTO ufDTO = new UfDTO();
				ufDTO.setIdUF(Integer.parseInt(idUF));
				enderecoDTO.setUfDTO(ufDTO);
				pessoaDTO.setEnderecoDTO(enderecoDTO);
				
				PessoaDAO pessoaDAO = new PessoaDAO();
				pessoaDAO.atualizar(pessoaDTO);
				proximaPage = "pessoaServelet?acao=listar";

			}else if(acao.equals("remover")){
				String idPessoa = req.getParameter("idPessoa");
				String idEndereco = req.getParameter("idEndereco");
				pessoaBO.removePessoa(Integer.parseInt(idPessoa), Integer.parseInt(idEndereco));
				proximaPage = "pessoaServelet?acao=listar";

			}
		} catch (Exception e) {
			req.setAttribute("msg", e.getMessage());
		}
		req.getRequestDispatcher(proximaPage).forward(req, resp);;
	}

}
