package playwithme.controller;

import java.io.IOException;
import java.io.PrintWriter;



















import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.net.ns.SessionAtts;
import playwithme.model.MemberDAO;
import playwithme.model.MemberDTO;

@MultipartConfig

public class ChangeImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String path = request.getServletContext().getRealPath("file");
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		// 저장하고자 하는 파일의 최대 크기 지정! -> 1mb
		int maxSize = (1024 * 1024) * 5;
		String encoding = "UTF-8";

		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding,
				new DefaultFileRenamePolicy());
		// new DefaultFileRenamePlicy() ->
		String img = multi.getFilesystemName("filename");
		String name = multi.getParameter("changeName");
		HttpSession session = request.getSession();
		dto.setM_Profile(img);
		dto.setMember_Id((String)session.getAttribute("memberid"));
		dto.setM_Name(name);
		PrintWriter out = response.getWriter();
		
		if(img != null) {
			dao.upImg(dto);
				RequestDispatcher rd = request.getRequestDispatcher("goProfile");
				rd.forward(request, response);
			
		}else {
			out.println("<script>alert('프로필 사진을 선택해주세요');location.href='goChangeImg'; </script>");
		}
		
		
		

	
	}

}
