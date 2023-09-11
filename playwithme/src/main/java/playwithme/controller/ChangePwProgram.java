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

import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

public class ChangePwProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String pw = request.getParameter("pw2");

		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto.setPw(pw);
		HttpSession session = request.getSession();
		dto.setMember_Id((String)session.getAttribute("memberid"));
		int cnt = dao.changePw(dto);
		if (cnt > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/Profile.jsp");
			rd.forward(request, response);
		} else {
			out.println("<script>alert('PW를 다시 확인하세요.');location.href='goChangePw'; </script>");
			

		}
	}

}
