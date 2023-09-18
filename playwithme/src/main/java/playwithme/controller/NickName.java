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

public class NickName extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		String nName = (request.getParameter("MemberId"));

		ChattingListDAO Chatdao = new ChattingListDAO();
		String nickName=Chatdao.nName(nName);
		response.setContentType("text/html;charset=utf-8"); // {"": , "":    } : JSON
		PrintWriter out=response.getWriter();
		out.println(nickName);
	}

}
