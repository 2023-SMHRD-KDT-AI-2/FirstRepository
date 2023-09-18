package playwithme.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

@WebServlet("/KakaoLoginProgram")
public class KakaoLoginProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// login페이지에서 넘어온 데이터
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String profile_image = request.getParameter("profile_image");

		// session에 받아서 저장
		session.setAttribute("id", id);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		session.setAttribute("profile_image", profile_image);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/MapMain.jsp");
		rd.forward(request, response);

		//
	}

}
