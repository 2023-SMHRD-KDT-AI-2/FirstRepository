package playwithme.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.ns.SessionAtts;
import playwithme.model.FavoriteDAO;
import playwithme.model.FavoriteDTO;

public class SetFavProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String[] favorite=request.getParameterValues("favorite");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("memberid");
		FavoriteDTO dto = new FavoriteDTO();
		FavoriteDAO dao = new FavoriteDAO();
		dto.setMember_id(member_id);
		FavoriteDTO inc =dao.incheck(dto);
		 // 회원 관심 에 회원 id 추가
		ArrayList<String> favList = (ArrayList<String>)session.getAttribute("favortie");
		
		if(inc ==null) {
				dao.delfav(dto);
				dao.interestup(dto);
				for(int i =0 ; i<favorite.length; i++) {
					dto.setInterest(favorite[i]);
					dao.inup(dto);
				}
				session.setAttribute("favorite", favorite);
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/Profile.jsp");
			rd.forward(request, response);
		}else {
			dao.delfav(dto);
			for(int i =0 ; i<favorite.length; i++) {
				dto.setInterest(favorite[i]);
				dao.inup(dto);
			}
			session.setAttribute("favorite", favorite);
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/Profile.jsp");
			rd.forward(request, response);
		}
	
	}

}
