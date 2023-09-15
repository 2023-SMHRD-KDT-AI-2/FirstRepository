package playwithme.controller;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import playwithme.model.BoardDAO;
import playwithme.model.BoardDTO;
import playwithme.model.CctvDAO;
import playwithme.model.CctvDTO;

@WebServlet("/LocationProgram")
public class LocationProgram extends HttpServlet {	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String lng=request.getParameter("lng"); // 경도
		String lat=request.getParameter("lat"); // 위도
		System.out.println(lat+":"+lng);
		CctvDTO cctvdto = new CctvDTO();
		cctvdto.setX(lng);
		cctvdto.setY(lat);
		System.out.println(cctvdto.getX()+":"+cctvdto.getY());
		CctvDAO cdao = new CctvDAO();		
		
		 ArrayList<CctvDTO> cctvlist = cdao.test(cctvdto);
		 Gson gson=new Gson(); 
		 String clist=gson.toJson(cctvlist); 
		 System.out.println(clist);
		 response.setContentType("text/json"); 
		 PrintWriter out=response.getWriter();
		 out.println(clist);
		
	}

}
