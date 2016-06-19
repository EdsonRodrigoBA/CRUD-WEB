package br.sistema.crud.servelet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.sistema.crud.jdbc.bo.LoginBO;
import br.sistema.crud.jdbc.bo.UfBO;
import br.sistema.crud.jdbc.dto.LoginDTO;
import br.sistema.crud.jdbc.dto.UfDTO;
import br.sistema.crud.jdbc.exception.NegocioException;

@WebServlet("/loginServelet")
public class LoginServelet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4635850876385981672L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		LoginBO loginBO = new LoginBO();
			LoginDTO loginDTO = new LoginDTO();
			String nome = req.getParameter("nome");
			String senha = req.getParameter("senha");
			HttpSession sessao = req.getSession();

			
			loginDTO.setNome(nome);
			loginDTO.setSenha(senha);
			String proximaPage = "home.jsp";

			try {	

			boolean resposta = loginBO.logar(loginDTO);
			if(!resposta){
				req.setAttribute("msg", "Usuario/Senha Invalido");
				proximaPage = "Login.jsp";
			}else{
				UfBO ufBO = new UfBO();
				List<UfDTO> listaUf = ufBO.listaUfs();
				sessao.setAttribute("listaUF", listaUf);
			}
		} catch (NegocioException e) {
			proximaPage = "Login.jsp";
			req.setAttribute("msg", "Usuario / Senha Invalido");
			e.printStackTrace();
		}
			RequestDispatcher dispatcher = req.getRequestDispatcher(proximaPage);
			dispatcher.forward(req, resp);
	}

}
