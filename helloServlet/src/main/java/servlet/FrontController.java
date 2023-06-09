package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

// URL 매핑이잖아요
// .one으로 끝나는 모든요청에 대해서 호출이 되는겁니다.!
// 요청마다 서블릿을 하나씩 만들지 않아도 되서 편합니다. 여러가지의 요청을 하나의 서블릿이 처리할수있다
@WebServlet("*.one")
public class FrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();
		//uri.lastIndexOf("/");
		//uri.substring(uri.lastIndexOf("/"));
		// 요청경로
		String commandStr = uri.substring(uri.lastIndexOf("/"));
		
		if(commandStr.equals("/regist.one")) {
			registFunc(req);
		} else if(commandStr.equals("/login.one")) {
			loginFunc(req);
		} else if(commandStr.equals("/freeboard.one")) {
			freeboardFunc(req);
		}
		
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		
		// 페이지를 이동시켜주는겁니다.
		req.getRequestDispatcher("/13서블릿/FrontController.jsp").forward(req, resp);
		
		// resp.getWriter().print(commandStr); // 테스트용 주석처리
	
	
	}

	// 요청별 처리 메서드
	private void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입<h4>");
	}
	
	private void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인<h4>");		
	}
	
	private void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판<h4>");		
	}

	public FrontController() {
		// TODO Auto-generated constructor stub
	}

}
