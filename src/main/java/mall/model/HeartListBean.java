package mall.model;

public class HeartListBean {
	private String name;
	private Integer price;
	private String contentimage;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getContentimage() {
		return contentimage;
	}

	public void setContentimage(String contentimage) {
		this.contentimage = contentimage;
	}

	@Override
	public String toString() {
		return "HeartListBean [name=" + name + ", price=" + price + ", contentimage=" + contentimage + "]";
	}

}
