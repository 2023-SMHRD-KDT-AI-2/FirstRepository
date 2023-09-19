/*
 * 최종 수정 2023.09.18
 * 박기원
 * 친구 추가 프로그램
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
import playwithme.model.FriendListDAO;
import playwithme.model.FriendListDTO;

@WebServlet("/FriendAddProgram")
public class FriendAddProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		// 2. 데이터수집
		String friend_name = request.getParameter("friend_name_test");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memberid");

		FriendListDAO friendDao = new FriendListDAO();
		boolean isDuplicate = friendDao.isFriendDuplicate(member_id, friend_name);

		if (isDuplicate) {
			// 이미 추가된 친구인 경우
			response.getWriter().println("<script type=\"text/javascript\">");
			response.getWriter().println("alert('이미 추가된 친구입니다.');");
			response.getWriter().println("location='ChattingList.jsp';");
			response.getWriter().println("</script>");
		} else {
			ChattingListDAO Chatdao = new ChattingListDAO();

			String friend_name_id = Chatdao.nName(friend_name);

			// 채팅방 연동 채팅방 생성//
			ChattingListDTO Chatdto = new ChattingListDTO();
			Chatdto.setChatting_Room_title(friend_name_id);
			Chatdto.setMember_Id(member_id);

			// ChatRoom 가져오기
			String friendChatRoom = Chatdao.createRoom3(Chatdto);
			FriendListDTO Frienddto = new FriendListDTO();
			Frienddto.setF_Member_Id(friend_name);
			Frienddto.setMember_Id(member_id);
			Frienddto.setFriendchat_room_num(friendChatRoom);
			FriendListDAO Frienddao = new FriendListDAO();

			
			System.out.println(friendChatRoom+"FriendADDProgram");
			int cnt = Frienddao.friendAdd(Frienddto);

			Chatdao.inviteFriendToChatRoom(Frienddto);

			if (cnt > 0) {
				// 채팅방 생성에 성공한 경우
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/FrindList.jsp");
				rd.forward(request, response);
			} else {
				// 채팅방 생성에 실패한 경우 팝업 창을 띄우는 JavaScript 코드를 출력
				response.getWriter().println("<script type=\"text/javascript\">");
				response.getWriter().println("alert('친구 추가 실패했습니다.');");
				response.getWriter().println("location='ChattingList.jsp';");
				response.getWriter().println("</script>");
			}
		}
	}

}
