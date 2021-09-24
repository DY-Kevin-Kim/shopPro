package com.kic.shopPro.domain;

import java.util.Date;

public class VisitorGraphVO {
	private String visitdate;
	private int visitor;
	public String getVisitdate() {
		return visitdate;
	}
	@Override
	public String toString() {
		return "VisitorGraphVO [visitdate=" + visitdate + ", visitor=" + visitor + "]";
	}
	public void setVisitdate(String visitdate) {
		this.visitdate = visitdate;
	}
	public int getVisitor() {
		return visitor;
	}
	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}


	
}
