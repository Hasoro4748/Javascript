package sub3;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = -1959569833935281155L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		HttpSession session = req.getSession();
		//사용자가 a101이고 비밀번호가 1234라고 가정
		if(uid.equals("a101") && pass.equals("1234")) {
			//회원일 경우
			session.setAttribute("sessUser",uid);
			
			//메인 이동
			resp.sendRedirect("/ch09/3.ListenerTest.jsp");
		}else {
			//회원이 아닐경우
			resp.sendRedirect("/ch09/3.ListenerTest.jsp");
			
		}
	}
}
