
/*
 * 최종 수정일 : 2023.09.15
 * 작성자 박기원
 * 목적 : 방 나가기(삭제)
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
import playwithme.model.Chat_PartiDTO;
import playwithme.model.ChattingListDAO;




@WebServlet("/LeaveChatRoom")
public class LeaveChatRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 방번호 가져오기
        int chatroom = Integer.parseInt(request.getParameter("chatting_Room_num"));

        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("memberid");

        // 방 번호와 멤버 아이디를 Chat_PartiDTO에 저장
        Chat_PartiDTO Chatdto = new Chat_PartiDTO();
        Chatdto.setChatting_Room_num(chatroom);
        Chatdto.setMember_Id(member_id);


        
        ChattingListDAO Chatdao = new ChattingListDAO();

        // MyBatis를 사용하여 채팅 파티원 삭제
        int cnt = Chatdao.deleteParti(Chatdto);
        System.out.println("chatting_Room_num: " + chatroom);
        System.out.println("member_id: " + member_id);
        System.out.println("Delete count: " + cnt); // Print the delete count
        if (cnt > 0) {
            // 삭제 성공한 경우
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/ChattingList.jsp");
            rd.forward(request, response);
        } else {
            // 삭제 실패한 경우
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('삭제 실패');");
            response.getWriter().println("location='ChattingList.jsp';");
            response.getWriter().println("</script>");
        }
    }
}