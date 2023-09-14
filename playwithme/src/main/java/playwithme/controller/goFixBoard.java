package playwithme.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import playwithme.model.BoardDAO;
import playwithme.model.BoardDTO;

public class goFixBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
	
		String num = request.getParameter("num");

		BoardDAO dao = new BoardDAO();
		BoardDTO board = dao.fixList(num);

		request.setAttribute("board", board);
		
		
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/FixBoard.jsp");
			rd.forward(request, response);
						
		
	}

}
