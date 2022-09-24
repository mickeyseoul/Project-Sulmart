package mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mall.model.CompleteReviewBean;
import mall.model.HeartListBean;
import mall.model.MypageDao;
import mall.model.PossibleReviewBean;
import mall.model.ReviewStatusBean;
import member.model.MemberBean;

@Controller
public class MypageReviewController {

	private final String command = "/myPageReview.mall";
	private String getPage = "/myPageReview";

	@Autowired
	MypageDao myPageDao;

	@RequestMapping(command)
	public String mypage(HttpSession session, Model model) {
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		if (member == null) {

			return "redirect:/login.mem";
		}

		List<HeartListBean> list = myPageDao.selectHeartList(member.getNum());
		List<ReviewStatusBean> slist = myPageDao.selectReviewStatus(member.getId());
		List<PossibleReviewBean> plist = myPageDao.selectPossibleReview(member.getId()); // �옉�꽦 媛��뒫�븳 �썑湲�
		List<CompleteReviewBean> clist = myPageDao.selectCompleteReview(member.getId()); // �옉�꽦 �셿猷뚰븳 �썑湲�
		
		System.out.println(clist);
		
		model.addAttribute("heartList", list);
		model.addAttribute("rstatus", slist);
		model.addAttribute("pbreview", plist);
		model.addAttribute("cmreview", clist);

		return getPage;
	}

}
