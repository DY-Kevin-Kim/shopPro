package com.kic.shopPro.domain;

import java.util.Date;

public class MypageOrderVO {
	private int orderid;
	private String itemnames;
	private String memid;
	private String itemid;
	private String pay;
	private String curstate;
	private Date date;
	private int price;
	private int count;
	
	public String getItemnames() {
		return itemnames;
	}
	public void setItemnames(String itemnames) {
		this.itemnames = itemnames;
	}
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
		return "MypageOrderVO [orderid=" + orderid + ", memid=" + memid + ", itemid=" + itemid + ", pay=" + pay
				+ ", curstate=" + curstate + ", date=" + date + ", price=" + price + ", count=" + count + "]";
	}
	
	
	
}
