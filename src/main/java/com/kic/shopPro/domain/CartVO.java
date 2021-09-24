package com.kic.shopPro.domain;

public class CartVO {
	private String memid;
	private String itemid;
	private String itemimg;
	private String itemname;
	private int price;
	private int itemcount;
	
	public CartVO() {
		
	}

	@Override
	public String toString() {
		return "CartVO [memid=" + memid + ", itemid=" + itemid + ", itemimg=" + itemimg + ", itemname=" + itemname
				+ ", price=" + price + ", itemcount=" + itemcount + "]";
	}

	public CartVO(String memid, ItemVO itemVO, int itemcount) {
		setMemid(memid);
		setItemid(itemVO.getItemid());
		setItemimg(itemVO.getItemimg());
		setItemname(itemVO.getItemname());
		setPrice(itemVO.getPrice()*itemcount);
		setItemcount(itemcount);
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

	public String getItemimg() {
		return itemimg;
	}

	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}
}
