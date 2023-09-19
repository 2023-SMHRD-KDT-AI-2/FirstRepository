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
import playwithme.model.ChattingListDAO;

public class ChatParti extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int chatroom = Integer.parseInt(request.getParameter("roomtitle"));

		ChattingListDAO Chatdao = new ChattingListDAO();
		ArrayList<String>chatpart=Chatdao.chatParti(chatroom);
		
		Gson gson = new Gson();
        String json = gson.toJson(chatpart);
        //System.out.println(json);
        response.setContentType("application/json"); // JSON 형식으로 응답
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
	}

}