package alcohol.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import alcohol.model.AlcoholBean;
import alcohol.model.AlcoholDao;
import review.model.ReviewBean;

@Controller
public class AlcoholDetailController {

	private final String command = "/detail.al";
	private String getPage = "/alcoholDetail";

	@Autowired
	AlcoholDao alcoholDao;


	@RequestMapping(value = command)
	public ModelAndView detail(@RequestParam("num") String num, @RequestParam(value="pageNumber", required = false) String pageNumber) {
		
		System.out.println("------ Enter -------");
		AlcoholBean ab = alcoholDao.getAlcohol(num);

		List<ReviewBean> list = new ArrayList<ReviewBean>();
		list = alcoholDao.getReview(num);
		
		System.out.println("------------ Ac Controller ----------");
		for(ReviewBean review : list) {
			System.out.println(review);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ab", ab);
		mav.addObject("rb", list);

		mav.addObject("pageNumber", pageNumber);

		mav.setViewName(getPage);

		return mav;
	}
	
	@RequestMapping(value = "/reWrite.al", method = RequestMethod.POST)
	public String reviewWrite(ReviewBean review, RedirectAttributes rttr) {		
		Date sqlDate = new Date(new java.util.Date().getTime());
		review.setReg_date(sqlDate);
		
		System.out.println("--------re--------");
		System.out.println(review);
		
		alcoholDao.replyInsert(review);
		
		rttr.addAttribute("num", review.getNum());
		rttr.addAttribute("pageNumber", 1);
		
		return "redirect:/detail.al";
	}
	
	@RequestMapping(value = "/recomm.al", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, String> recommUpdate(@RequestParam("id") String rid) {
		System.out.println("----------------");
		HashMap<String, String> msg = new HashMap<String, String>();
		int n = alcoholDao.updateRecomm(Integer.parseInt(rid));
		int newRecomm = alcoholDao.selectRecomm(Integer.parseInt(rid));
		msg.put("message", n+"");
		
		return msg;
	}

}
