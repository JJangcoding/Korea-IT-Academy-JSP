package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

/**
 * Servlet implementation class juminAction
 */
@WebServlet("/jumin.do")
public class juminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jumin.do?jumin=801111-222222	
		String jumin = request.getParameter("jumin");
		char gender = jumin.charAt(7);//'1' '2' '3' '4'
		String genResult = "남자";
		
		if(gender % 2 ==0) {
			genResult = "여자";
		}
		
		String season = jumin.substring(2,4);
		String seasonResult = "";
		switch (season) {
		case "3":
		case "4":
		case "5":
			seasonResult = "봄";
			break;
			
		case "6":
		case "7":
		case "8":
			seasonResult = "여름";
			break;
			
		case "9":
		case "10":
		case "11":
			seasonResult = "가을";
			break;
			
		case "12":
		case "1":
		case "2":
			seasonResult = "겨울";
			break;
		}
		
		
		
		response.setContentType("text/html; charset = utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
			out.print("<body>");
				out.print("<table border = '1'>");
					out.print("<tr>");
						out.print("<tr>");
							out.print("<td>주민번호</td>");
							out.printf("<td>%s</td>", jumin);
						out.print("<tr>");
		
						out.print("<tr>");
							out.print("<td>성별</td>");
							out.printf("<td>%s</td>", genResult);
						out.print("<tr>");
						
						out.print("<tr>");
							out.print("<td>계절</td>");
							out.printf("<td>%s</td>", seasonResult);
						out.print("<tr>");
			
					out.print("</table>");
			
			out.print("</body>");
		out.print("</html>");
		
	}
		
}
