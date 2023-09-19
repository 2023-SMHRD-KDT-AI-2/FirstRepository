package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import playwithme.model.FavoriteDAO;
import playwithme.model.FavoriteDTO;
import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

public class LoginProgram extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      // 2. 데이터수집
      String id = request.getParameter("memberid");
      String pw = request.getParameter("pw");
      MemberDTO dto = new MemberDTO();
      MemberDAO dao = new MemberDAO();
      dto.setMember_Id(id);
      dto.setPw(pw);
      MemberDTO cnt = dao.login(dto);
      HttpSession session = request.getSession();
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();

      if (cnt != null) {
         FavoriteDAO fdao = new FavoriteDAO();
         FavoriteDTO fdto = new FavoriteDTO();
         fdto.setMember_id(id);
         FavoriteDTO inc =fdao.incheck(fdto);
         session.setAttribute("memberid", id);
         if(inc==null) {
            out.println("<script>alert('관심사를 설정해주세요.');location.href='goFavorite'; </script>");
            
         }else {
            
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/MapMain.jsp");
            rd.forward(request, response);
         }
      } else {
         out.println("<script>alert('ID,PW를 다시 확인하세요.');location.href='goLogin'; </script>");
         

      }
   }

}
  