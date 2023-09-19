/*
 * 최종 수정일 : 2023.09.17
 * 작성자 :  박기원
 * 친구 삭제
 * 
 */


package playwithme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import playwithme.model.Chat_PartiDTO;
import playwithme.model.FriendListDAO;
import playwithme.model.FriendListDTO;

public class FriendDeleteProgram extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 삭제할 친구의 아이디 가져오기
        String friendId = request.getParameter("friendId");
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberid");

        FriendListDTO frienddto = new FriendListDTO();
        frienddto.setF_Member_Id(friendId);
        frienddto.setMember_Id(memberId);
        
        System.out.println(friendId+"FriendDeleteProgram");
        // 친구 삭제
        FriendListDAO friendDao = new FriendListDAO();
        int cnt = friendDao.deleteFriend(frienddto);

        if (cnt > 0) {
            // 삭제 성공한 경우
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('친구 삭제 성공');");
            response.getWriter().println("location.reload();"); // 페이지 새로 고침
            response.getWriter().println("</script>");
        } else {
            // 삭제 실패한 경우
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('친구 삭제 실패');");
            response.getWriter().println("location.reload();"); // 페이지 새로 고침
            response.getWriter().println("</script>");
        }
    }
}
