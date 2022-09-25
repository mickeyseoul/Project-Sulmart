package order.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mall.cart.ShoppingInfo;
import utility.Paging;

@Component("OrderDao")
public class OrderDao {

	private String namespace="order.model.Order";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getMaxOrderid() {
		int max = sqlSessionTemplate.selectOne(namespace+".GetMaxOrderid");
		System.out.println("max:"+max);
		return max;
	}

	public void insertData(String id) {
		sqlSessionTemplate.insert(namespace+".InsertData" , id);
	}

	
	//¹ÚÀÌ¶û
	public List<ShoppingInfo> getAllOrderList(Map<String, String> map, Paging pageInfo) {
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAllOrderList",map,rowBounds);
		return lists;
	}

	public int getTotalCount(Map<String, String> map) {
		int totalcount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return totalcount;
	}
	
	//±èÇýÀÎ
	public List<OrderBean> selectOrderMid(Paging pageInfo, String memid) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<OrderBean> lists = sqlSessionTemplate.selectList(namespace+".SelectOrderMid", memid,rowBounds);
		return lists;
	}
	/*
	public List<OrderBean> selectOrderMid(String memid) {
		List<OrderBean> lists = sqlSessionTemplate.selectList(namespace+".SelectOrderMid", memid);
		return lists;
	}
*/
	
	public void orderCancle(int orderid) {
		sqlSessionTemplate.update(namespace+".OrderCancle" , orderid);		
	}

	public void getOrder(int orderid) {
		sqlSessionTemplate.selectList(namespace+".GetOrder", orderid);		
	}

	public int getOrderTotalCount() {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetOrderTotalCount");
		return totalCount;
	}
	
	
}
