package order.model;

public class OrderBean {
	private int orderid; //�ֹ�(����)��ȣ
	private String memid; //ȸ����ȣ
	private String orderdate; //�ֹ� ����
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
	
}
