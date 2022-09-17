package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	public List<OrderBean> selectOrderMid(String memid) {
		List<OrderBean> lists = sqlSessionTemplate.selectList(namespace+".SelectOrderMid", memid);
		return lists;
	}
	
	
}
