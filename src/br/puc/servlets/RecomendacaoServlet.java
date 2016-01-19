package br.puc.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.puc.controller.RecomendacaoController;

/**
 * Servlet implementation class RecomendacaoServlet
 */
public class RecomendacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecomendacaoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("operacao").equalsIgnoreCase("Recomendar")) {
			
			try{
			
				//chamar a fun��o da recomenda��o e passar lista para a jsp
				//criar a jsp da recomenda��o
				
				//recupera o caminho dos arquivos
				ServletContext context = request.getServletContext();
				String caminho = context.getRealPath("/WEB-INF");
						
				HttpSession session = request.getSession();
	
				List<String> competencias = (List<String>) session.getAttribute("listaCompetencias");
				
				
						
				List<String> recomendacao = RecomendacaoController.gerarRecomendacao(competencias, caminho);
	
				for(int i = 0; i < recomendacao.size(); i++){
					System.out.println(recomendacao.get(i));
				}
				
				request.setAttribute("listaRecomendacoes", recomendacao);  
				RequestDispatcher rd = request.getRequestDispatcher("/recomendacao.jsp");
				rd.forward(request, response);
				
				//response.sendRedirect("recomendacao.jsp");
			}catch(Exception e){
				System.out.println("Erro Servlet recomenda��o: " + e);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
