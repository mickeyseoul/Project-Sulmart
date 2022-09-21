package member.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	
	private int num;
	
	@NotBlank(message="�땳�꽕�엫�쓣 �쟻�뼱二쇱꽭�슂.")
	private String name;
	
	@NotBlank(message="�븘�씠�뵒瑜� �쟻�뼱二쇱꽭�슂.")
	private String id;
	
	@NotBlank(message="鍮꾨�踰덊샇瑜� �쟻�뼱二쇱꽭�슂.")
	private String password;
	
	private String email;
	
	@NotBlank(message="�꽦�씤�씤利앹쓣 �빐二쇱꽭�슂.")
	private String rrn1;
	private String rrn2;
	
	@NotBlank(message="�빖�뱶�룿 踰덊샇瑜� �셿�꽦 �빐二쇱꽭�슂.")
	private String hp1;
	private String hp2;
	private String hp3;
	
	@NotBlank(message="二쇱냼瑜� �셿�꽦 �빐二쇱꽭�슂.")
	private String zipcode1;
	private String zipcode2;
	private String zipcode3;
//	private int mpoint;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRrn1() {
		return rrn1;
	}
	public void setRrn1(String rrn1) {
		this.rrn1 = rrn1;
	}
	public String getRrn2() {
		return rrn2;
	}
	public void setRrn2(String rrn2) {
		this.rrn2 = rrn2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getZipcode3() {
		return zipcode3;
	}
	public void setZipcode3(String zipcode3) {
		this.zipcode3 = zipcode3;
	}
//	public int getMpoint() {
//		return mpoint;
//	}
//	public void setMpoint(int mpoint) {
//		this.mpoint = mpoint;
//	}
	
	

}
