package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RealPerson {
	private final String command="real.qna";
	private String getPage="redirect:/write.qna";
	
	@RequestMapping(command)
	protected void real(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "";
		//사용자 입력값을 Hash한 값과 realperson 라이브러리가 생성한 Hash값이 서로 동일한지 비교한다.
		if (rpHash(request.getParameter("defaultReal")).equals(request.getParameter("defaultRealHash"))){
			// Accepted
			result = "SUCCESS";
			/*test*/System.out.println( result );
		}else {
			// Rejected
			result = "FAILED";
			/*test*/System.out.println( result );
		}

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<BODY>");
		out.println("Result : " + result);
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	}


	private String rpHash(String value) {
		int hash = 5381;
		value = value.toUpperCase();
		for(int i = 0; i < value.length(); i++) {
			hash = ((hash << 5) + hash) + value.charAt(i);
		}
		return String.valueOf(hash);
	}
} 
