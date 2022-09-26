package admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alcohol.model.AlcoholBean;
import alcohol.model.AlcoholDao;
import alcohol.model.SnCateBean;
import alcohol.model.SnCateDao;
import utility.Paging;

@Controller
public class SellerListController {

	private final String command = "/sellerList.ad";
	private String getPage = "/sellerList";

	@Autowired
	private AlcoholDao alcoholDao;

	@Autowired
	private SnCateDao snCateDao;

	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request,
			@RequestParam(value="pageNumber", required = false) String pageNumber,
			@RequestParam(value="whatColumn", required = false) String whatColumn,
			@RequestParam(value="keyword", required = false) String keyword) {

		//�˻���
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		//System.out.println("whatColumn "+whatColumn);
		//System.out.println("keyword "+keyword);

		//����¡
		int totalCount = alcoholDao.getTotalCount2(map);
		String url = request.getContextPath()+"/"+command;

		Paging pageInfo = new Paging(pageNumber,"5",totalCount,url,whatColumn,keyword,null);

		//�ַ� ����Ʈ ��������
		List<AlcoholBean> lists = new ArrayList<AlcoholBean>();
		lists = alcoholDao.getAllSnack(map,pageInfo);

		//ī�װ� �۾�
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

		//0925 ������� ��2�� �� �˸� �߰�
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String date = format.format(currentTime);
		//System.out.println("date "+ date);
		String year = date.substring(0, 4);
		int month = Integer.valueOf(date.substring(5, 7));
		//System.out.println("year "+year);
		//System.out.println("month "+month);

		for(AlcoholBean x : lists) {

			String exp_date = x.getExp_date();
			System.out.println("exp_date "+exp_date);
			String expYear = exp_date.substring(0, 4);
			int expMonth = Integer.valueOf(exp_date.substring(5, 7));

			if(year.equals(expYear)) {

				if(month-expMonth == 0 || expMonth-month == 1 || expMonth-month == 2) {
					x.setFlag(true);
				}

			}
		}
		//


		model.addAttribute("lists", lists);
		model.addAttribute("lists3", lists3);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("totalCount", totalCount);

		return getPage;
	}

}
