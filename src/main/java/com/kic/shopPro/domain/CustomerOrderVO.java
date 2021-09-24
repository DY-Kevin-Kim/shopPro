package com.kic.shopPro.domain;
import java.util.Date;
public class CustomerOrderVO {
	
	private String orderid;
	private String memid;
	private String itemid;
	private String pay;
	private String curstate;
	private Date timestamp;
	private int price;
	private int count;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getCurstate() {
		return curstate;
	}
	public void setCurstate(String curstate) {
		this.curstate = curstate;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CustomerOrderVO [orderid=" + orderid + ", memid=" + memid + ", itemid=" + itemid + ", pay=" + pay
				+ ", curstate=" + curstate + ", timestamp=" + timestamp + ", price=" + price + ", count=" + count + "]";
	}
	

}
