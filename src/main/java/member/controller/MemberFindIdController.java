package member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindIdController {

	public final String command = "findId.mem";
	public String getPage = "/memberFindId";
	public String gotoPage = "redirect:/login.mem";
//	public String gotoPage = "/login.mem";
//	public String gotoPage = "/member/login";

	@Autowired
	MemberDao memberDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String findId() {
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String findId(
			/*
			 * @RequestParam(value="name",required=true)String name,
			 * 
			 * @RequestParam(value="email",required=true)String email,
			 */
			Model model, HttpServletResponse response, MemberBean member, HttpSession session) throws Exception {
		System.out.println("FId而⑦듃濡ㅻ윭:" + member);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = response.getWriter();

		System.out.println("1");
		System.out.println("2");

		// MemberBean login = new MemberBean();
		// login.setId(memberDao.getMemberById(member));

		String login = memberDao.getMemberById(member);  

		System.out.println(">>而⑦듃濡ㅻ윭mb::" + login);

		if (login == null) {

			writer.println("<script type='text/javascript'>");
			writer.println("alert('�씠由꾧낵 �씠硫붿씪�쓣 �떎�떆 �솗�씤�빐二쇱꽭�슂.');");
			writer.println("</script>");
			writer.flush();

			return getPage;
		} else {
			model.addAttribute("loginId", member.getId());

			writer.println("<script type='text/javascript'>");
			writer.println("alert('�쉶�썝�떂�쓽 �븘�씠�뵒�뒗 " + login + " �엯�땲�떎.');");
			writer.println("</script>");
			writer.flush();

			return gotoPage;
		}

	}
}
