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

public class goProfile2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String i = request.getParameter("i");

		BoardDAO dao = new BoardDAO();
		BoardDTO board = dao.oneList(i);

		request.setAttribute("board", board);
		
		
		String uri = "WEB-INF/Profile2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(uri);
		rd.forward(request, response);
	}

}
