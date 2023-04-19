package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class CheckIdAction
 */
@WebServlet("/check_id.do")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaa
		String id = request.getParameter("id");
		
		//아이디 중복 검사
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		if( vo == null) {
			//id로 가입이 가능한 상태
			res = "yes";
		}
		
		//결과 res를 콜백메서드로 전달
		String resultStr = String.format("[{'result':'%s'}]",res);
		
		//resultStr을 콜백메서드로 전송
		response.getWriter().print(resultStr);
	}

}
