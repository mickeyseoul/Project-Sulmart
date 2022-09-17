package mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	private final String command = "/myPage.mall";
	private String getPage = "/myPage";
	
	@RequestMapping(command)
	public String mypage() {
		return getPage;
	}

}
