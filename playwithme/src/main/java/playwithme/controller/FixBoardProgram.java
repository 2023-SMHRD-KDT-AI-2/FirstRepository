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

public class FixBoardProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String numPeople1 = request.getParameter("numPeople");
		int numPeople = Integer.parseInt(numPeople1);
		String bContent = request.getParameter("b_Content");
		String meetTime = request.getParameter("meetTime");
		int board_Num=Integer.parseInt(request.getParameter("board_Num"));
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_Num(board_Num);
		boardDTO.setTitle(title);
		boardDTO.setB_Content(bContent);
		boardDTO.setMeet_Time(meetTime);
		boardDTO.setNum_People(numPeople);
		
		BoardDAO boardDAO = new BoardDAO();
		
		int cnt = boardDAO.boardup(boardDTO);
		
		if(cnt >0) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MyBoard.jsp");
			rd.forward(request, response);
						
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MapMain.jsp");
			rd.forward(request, response);
		}
	}

}
