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

public class BoardDeleteOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
	
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();
		dao.deleteOne(num);
		
		
		
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MyBoard.jsp");
			rd.forward(request, response);
						
		
	}

}
