package com.kic.shopPro.service;

import java.util.List;

import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;

public interface VisitorService {
	public void addVisitor();
	public List<VisitorVO> readVisitorList();
	public List<VisitorGraphVO> readVisitorGraphList();
	public int reachedTotalCost();
	public List<TopItemVO> readTopItemList();

}
