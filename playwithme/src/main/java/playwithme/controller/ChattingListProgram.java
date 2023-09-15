/*
 * 박기원
 * 채팅 방 만들기 프로그램
 * 
 */

package playwithme.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import playwithme.model.ChattingListDAO;
import playwithme.model.ChattingListDTO;

@WebServlet("/ChattingListProgram")
public class ChattingListProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		// 2. 데이터수집
		String roomTitle = request.getParameter("roomTitle");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memberid");

		ChattingListDTO Chatdto = new ChattingListDTO();
		Chatdto.setChatting_Room_title(roomTitle);
		Chatdto.setMember_Id(member_id);

		ChattingListDAO Chatdao = new ChattingListDAO();

		int cnt = Chatdao.createRoom(Chatdto);

		if (cnt > 0) {
			// 채팅방 생성에 성공한 경우
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/ChattingList.jsp");
			rd.forward(request, response);
		} else {
			// 채팅방 생성에 실패한 경우 팝업 창을 띄우는 JavaScript 코드를 출력
			response.getWriter().println("<script type=\"text/javascript\">");
			response.getWriter().println("alert('채팅방 생성에 실패했습니다.');");
			response.getWriter().println("location='ChattingList.jsp';");
			response.getWriter().println("</script>");
		}
	}
}
