package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import playwithme.model.BoardDAO;
import playwithme.model.BoardDTO;
import playwithme.model.ChattingListDAO;

public class ChatRoomTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int chatroom = Integer.parseInt(request.getParameter("roomtitle"));

		ChattingListDAO Chatdao = new ChattingListDAO();
		String title=Chatdao.chatRoomTitle(chatroom);
		response.setContentType("text/html;charset=utf-8"); // {"": , "":    } : JSON
		PrintWriter out=response.getWriter();
		out.println(title);
	}

}
