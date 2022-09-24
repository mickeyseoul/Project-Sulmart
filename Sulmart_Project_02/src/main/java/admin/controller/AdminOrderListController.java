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

import mall.cart.ShoppingInfo;
import order.model.OrderDao;
import utility.Paging;

@Controller
public class AdminOrderListController {
	
	private final String command = "/orderList.ad";
	private String getPage = "/orderList";
	
	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(command)
	public String list(@RequestParam(value="pageNumber", required = false) String pageNumber,
					@RequestParam(value="whatColumn", required = false) String whatColumn,
					@RequestParam(value="keyword", required = false) String keyword,
					HttpServletRequest request, Model model) {
		/*
		OrderBean
		private int orderid; //주문(송장)번호
		private String memid; //회원번호
		private String orderdate; //주문 일자
		
		OrderDetailBean
		private int odid; // 숫자
		private int orderid; // 주문번호
		private int num;  // 상품번호
		private int qty; //주문 수량
		
		ShoppingInfo
		private int num;
		private String name;
	    private int price;
	    private int point;
	    private int qty;
	    private String image;
	    private int delivery;
	    private int pointAmount;
	    private int priceAmount; 
		*/
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalcount = orderDao.getTotalCount(map);
		System.out.println("totalcount "+totalcount);
		
		String url = request.getContextPath()+"/"+command;
		
		Paging pageInfo = new Paging(pageNumber,"5",totalcount,url,whatColumn,keyword,null);
		
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		lists = orderDao.getAllOrderList(map,pageInfo);

		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return getPage;
	}

}
