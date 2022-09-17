package mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alcohol.model.AlcoholDao;
import mall.cart.ShoppingInfo;
import member.model.MemberBean;
import order.model.OrderBean;
import order.model.OrderDao;

@Controller
public class OrderMallController {

	//주문내역클릭하면 order.mall ->여기컨트롤러 ->shopList.jsp로 이동
	private final String command="/order.mall";
	private final String getPage="/shopList";
	private final String gotoPage="redirect:/loginForm.mem";
	
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private AlcoholDao alcoholDao;
	
	@RequestMapping(command)
	public String ordermall(@RequestParam(value="orderid",required = false) String orderid,
							HttpSession session, Model model) {
		
		//로그인안하면 하도록
		if(session.getAttribute("loginInfo") == null) {
			session.setAttribute("destination", "redirect:/order.mall");
			return gotoPage;
		}
		else {	
			
			MemberBean mb =  (MemberBean) session.getAttribute("loginInfo");
			String memid = mb.getId();
			
			List<OrderBean> lists = orderDao.selectOrderMid(memid);
			//System.out.println("ordermallcontroller orderid:"+orderid);
			
			//List<ShoppingInfo> slists = alcoholDao.getOrderDetail(orderid);
			 
			//model.addAttribute("slists", slists);
			model.addAttribute("lists", lists);
			
			return getPage;
		}
		
		
		
		
	}
	
}
