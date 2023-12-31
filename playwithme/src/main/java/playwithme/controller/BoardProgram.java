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
import playwithme.model.ChattingListDAO;
import playwithme.model.ChattingListDTO;

public class BoardProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String title = request.getParameter("title");
		String numPeople1 = request.getParameter("numPeople");
		int numPeople = Integer.parseInt(numPeople1);
		String bContent = request.getParameter("bContent");
		String place = request.getParameter("place");
		Double longitude = Double.parseDouble(request.getParameter("longitude"));
		Double latitude = Double.parseDouble(request.getParameter("latitude"));
		String meetTime = request.getParameter("meetTime");
		
		//게시판 연동 채팅방 생성//
		ChattingListDTO Chatdto = new ChattingListDTO();
	    Chatdto.setChatting_Room_title(title);
	    Chatdto.setMember_Id(memberId);
	    
	    ChattingListDAO Chatdao = new ChattingListDAO();
	    
	    String boardChatRoom = Chatdao.createRoom2(Chatdto);

	    //
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setMember_Id(memberId);
		boardDTO.setTitle(title);
		boardDTO.setB_Content(bContent);
		boardDTO.setPlace(place);
		boardDTO.setLongitude(longitude);
		boardDTO.setLatitude(latitude);
		boardDTO.setMeet_Time(meetTime);
		boardDTO.setNum_People(numPeople);
		boardDTO.setChat_room_num(boardChatRoom); //게시판 연동 채팅방 번호
		
		BoardDAO boardDAO = new BoardDAO();

	    
		
		int cnt = boardDAO.write(boardDTO);
		
		if(cnt >0) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MapMain.jsp");
			rd.forward(request, response);
						
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MapMain.jsp");
			rd.forward(request, response);
		}
	}

}
