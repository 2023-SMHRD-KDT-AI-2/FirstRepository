package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

public class JoinProgram extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 1 인코딩
      response.setCharacterEncoding("UTF-8");
      request.setCharacterEncoding("UTF-8");

      // 2 데이터 꺼내오기
      PrintWriter out = response.getWriter();
      String member_Id = request.getParameter("member_Id");
      String pw = request.getParameter("pw");
      int age = Integer.parseInt(request.getParameter("age"));
      String m_Name = request.getParameter("m_Name");
      String gender = request.getParameter("gender");
      String mbti = request.getParameter("mbti");

      // 3. DAO
      MemberDAO dao = new MemberDAO();
      MemberDTO member = new MemberDTO();
      member.setMember_Id(member_Id);
      member.setPw(pw);
      member.setAge(age);
      member.setM_Name(m_Name);
      member.setGender(gender);
      member.setMbti(mbti);

      
      int cnt = dao.Join(member);
      response.setContentType("text/html;charset=UTF-8");
      String url = "";
      System.out.println(cnt);
      // 4. 회원가입 성공 여부
      if (cnt > 0) {
         /*
          * url="WEB-INF/Login.jsp"; RequestDispatcher rd =
          * request.getRequestDispatcher(url); rd.forward(request, response);
          */
         out.println("<script>alert('회원가입 성공!'); location.href='goLogin';</script>");
         //알림창 css
      } else {         
         /*
          * url = "WEB-INF/Join.jsp"; RequestDispatcher rd =
          * request.getRequestDispatcher(url); rd.forward(request, response);
          */
         out.println("<script>alert('아이디가 중복입니다!');location.href='goJoin';</script>");
      }
   }
}
