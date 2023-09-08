package playwithme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import playwithme.model.BoardDTO;

public class WriteTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String memberId = request.getParameter("memberId");
		String title = request.getParameter("title");
		String bContent = request.getParameter("bContent");
		String place = request.getParameter("place");
		Double longitude = Double.parseDouble(request.getParameter("longitude"));
		Double latitude = Double.parseDouble(request.getParameter("latitude"));
		String meetTime = request.getParameter("meetTime");
		int numPeople = Integer.getInteger(request.getParameter("numPeople"));
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setMemberId(memberId);
		boardDTO.setTitle(title);
		boardDTO.setBContent(bContent);
		boardDTO.setPlace(place);
		boardDTO.setLongitude(longitude);
		boardDTO.setLatitude(latitude);
		boardDTO.setMeetTime(meetTime);
		boardDTO.setNumPeople(numPeople);
	 
	}

}
