package com.kic.shopPro.domain;

public class ItemReviewVO {
	int reviewid;
	String itemid;
	String memid;
	String orderid;
	String subject;
	double rate;
	String reviewimg1;
	String reviewimg2;
	String reviewimg3;
	String content;
	

	@Override
	public String toString() {
		return "ItemReviewVO [reviewid=" + reviewid + ", itemid=" + itemid + ", memid=" + memid + ", orderid=" + orderid
				+ ", subject=" + subject + ", rate=" + rate + ", reviewimg1=" + reviewimg1 + ", reviewimg2="
				+ reviewimg2 + ", reviewimg3=" + reviewimg3 + ", content=" + content + "]";
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getReviewimg1() {
		return reviewimg1;
	}
	public void setReviewimg1(String reviewimg1) {
		this.reviewimg1 = reviewimg1;
	}
	public String getReviewimg2() {
		return reviewimg2;
	}
	public void setReviewimg2(String reviewimg2) {
		this.reviewimg2 = reviewimg2;
	}
	public String getReviewimg3() {
		return reviewimg3;
	}
	public void setReviewimg3(String reviewimg3) {
		this.reviewimg3 = reviewimg3;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
