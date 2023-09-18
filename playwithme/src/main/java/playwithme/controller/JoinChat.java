package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import playwithme.model.BoardDAO;
import playwithme.model.BoardDTO;
import playwithme.model.ChatPartiDTO;
import playwithme.model.ChattingListDAO;

public class JoinChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		request.setCharacterEncoding("UTF-8");
		
		String boardchatnum=request.getParameter("roomtitle");
		String id=request.getParameter("id");
		
		
		ChattingListDAO Chatdao = new ChattingListDAO();
		
		

		ChatPartiDTO chatpar=new ChatPartiDTO();
		chatpar.setChatting_room_num(boardchatnum);
		chatpar.setMember_id(id);
		System.out.println(boardchatnum+"   --check--  "+id);
		

		if(Chatdao.checkparti(chatpar)==null) {
			Chatdao.joinChat(chatpar);						
		}
		
		
	      PrintWriter out = response.getWriter();
	        out.println("Success");
	        out.close();

	}

}
