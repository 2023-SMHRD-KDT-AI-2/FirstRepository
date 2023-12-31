package playwithme.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/goChat")
public class goChat extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");   
      String room=request.getParameter("room");
      request.setAttribute("room", room);
      String uri = "WEB-INF/chat.jsp";
      RequestDispatcher rd = request.getRequestDispatcher(uri);
      rd.forward(request, response);
   }

}
