package playwithme.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.ns.SessionAtts;
import playwithme.model.FavoriteDTO;
@WebServlet("/SetFavProgram")
public class SetFavProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String[] favorite=request.getParameterValues("favorite");
	HttpSession session = request.getSession();
	String member_id = (String) session.getAttribute("memberid");
	
	
	}

}
