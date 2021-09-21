package com.kic.shopPro.domain;

public class ItemVO {
	String itemid;
	String itemcategory;
	String itemname;
	String itemimg;
	int price;
	int stored;
	
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getItemcategory() {
		return itemcategory;
	}
	public void setItemcategory(String itemcategory) {
		this.itemcategory = itemcategory;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getItemimg() {
		return itemimg;
	}
	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStored() {
		return stored;
	}
	public void setStored(int stored) {
		this.stored = stored;
	}
}
