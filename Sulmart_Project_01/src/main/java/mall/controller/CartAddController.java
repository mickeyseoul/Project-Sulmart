package mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import alcohol.model.AlcoholBean;
import mall.cart.MyCartList;

@Controller
public class CartAddController {

	private final String command ="add.mall";
	private String gotoPage ="redirect:/list.mall";
	
	//�󼼺���.jsp���� add.mall��û , ��ǰ��ȣ, ��������ȣ, �ֹ�����-��� bean�� ����.
	@RequestMapping(command)
	public String add(AlcoholBean alcohol,
						@RequestParam(value="pageNumber",required = false) String pageNumber,
						HttpSession session) { //setNum, setOderqty
		System.out.println("alcohol.getNum : "+alcohol.getNum());
		System.out.println("alcohol.getOrderqty : "+alcohol.getOrderqty()); //�����Ͽ��� ��������
		System.out.println("cartAddCon/image:"+alcohol.getImage()); //���ϸ� �ʷ�.jpg
		
		int num = Integer.valueOf(alcohol.getNum());
		int oqty = alcohol.getOrderqty();
		
	
		//�α��ξ��ص� �󼼺��� ���������� �ֹ��� �α����� �ؾ� �����ְ� ����� �ʹ�. 
		//if(session.getAttribute("loginInfo") == null) { //�α��� �������� 
		//	session.setAttribute("destination", "redirect:/detail.al?anum="+alcohol.getNum()+"&pageNumber="+pageNumber); 
			//�Ѿ���� ���� �־�� �ؼ� �󼼺���� ����! ��ȣ�� �������ѹ��� �Ѱ���� ������ �󼼺���� ����.
		//	return "redirect:/loginForm.mem";
		//}
		//else { //�α��� ������
			//*����ǰ *�� ���� ��ٱ��ϰ� �ʿ�, + �ϳ��� ��ٱ��Ͽ� ������ǰ ��ƾ��Ѵ�.�ϳ������ ��� ������ �ٴҰŴ�.
			MyCartList mycart = (MyCartList) session.getAttribute("mycart");
			System.out.println("mycart:"+mycart);
			
			if(mycart == null) {
				mycart = new MyCartList();
			}
	
			mycart.addOrder(num, oqty);			
			
			session.setAttribute("mycart", mycart);
			return gotoPage;
		//}
		
		
	}
	
	
	
}
