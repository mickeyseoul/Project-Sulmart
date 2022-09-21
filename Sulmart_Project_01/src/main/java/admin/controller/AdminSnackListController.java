package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alcohol.model.AlCateBean;
import alcohol.model.AlCateDao;
import alcohol.model.AlcoholBean;
import alcohol.model.AlcoholDao;
import alcohol.model.SnCateBean;
import alcohol.model.SnCateDao;
import utility.Paging;

@Controller
public class AdminSnackListController {
	
	private final String command = "/snackList.ad";
	private String getPage = "/snackList";
	
	@Autowired
	private AlcoholDao alcoholDao;
	
	@Autowired
	private SnCateDao snCateDao;
	
	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request,
					@RequestParam(value="pageNumber", required = false) String pageNumber,
					@RequestParam(value="whatColumn", required = false) String whatColumn,
					@RequestParam(value="keyword", required = false) String keyword) {
		
		//검색어
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		//System.out.println("whatColumn "+whatColumn);
		//System.out.println("keyword "+keyword);
		
		//페이징
		int totalCount = alcoholDao.getTotalCount2(map);
		String url = request.getContextPath()+"/"+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);
		
		//주류 리스트 가져오기
		List<AlcoholBean> lists = new ArrayList<AlcoholBean>();
		lists = alcoholDao.getAllSnack(map,pageInfo);
		
		//카테고리 작업
		List<SnCateBean> lists2 = new ArrayList<SnCateBean>();
		lists2 = snCateDao.getAllSnCate();
				
		List<AlcoholBean> lists3 = new ArrayList<AlcoholBean>();
		for(SnCateBean x : lists2) {
			AlcoholBean snCate = new AlcoholBean();
			String category = "";
			category += x.getCate1()+"-"+x.getCate2();
			snCate.setCategory(category);
			lists3.add(snCate);
		}
		
		model.addAttribute("lists", lists);
		model.addAttribute("lists3", lists3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("totalCount", totalCount);
		
		return getPage;
	}

}
