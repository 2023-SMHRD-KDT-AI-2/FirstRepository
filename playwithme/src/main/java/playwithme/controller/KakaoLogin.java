package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

public class KakaoLogin extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      String kakaoId = request.getParameter("id");
      String kakaoName = request.getParameter("name");
      
         HttpSession session = request.getSession();
           
           System.out.println("Kakao ID : "+kakaoId);
           System.out.println("Kakao Name : "+kakaoName);
           
           //이름이 "홍길동" 식으로 넘어오기 때문에 "으로 짤라줌
           String kakaoId1 = kakaoId.replace("\"", "");
           
           //회원이 있는지 검사, 없으면 회원가입부터 진행 후 로그인
           MemberDTO dto = new MemberDTO();
         MemberDAO dao = new MemberDAO();
         session.setAttribute("kakaoId", kakaoId);
         session.setAttribute("kakaoName", kakaoName);
         dto.setMember_Id(kakaoId1);
         MemberDTO m = dao.kakaoLogin(dto);
         System.out.println(kakaoId1);
         
         PrintWriter out = response.getWriter();
         System.out.println(kakaoId);
         
           if(m==null) {
               //회원가입이 필요
              out.print("http://localhost:8082/aa/goJoin");
           }else {
              session.setAttribute("memberid", kakaoId1);
              System.out.println("main");
               out.print("http://localhost:8082/aa/goMain");

           }
           
   }
   }
      