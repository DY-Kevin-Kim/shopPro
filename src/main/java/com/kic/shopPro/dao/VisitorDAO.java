package com.kic.shopPro.dao;

import java.util.List;

import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;

public interface VisitorDAO {
	public void addVisitor();
	public List<VisitorVO> readVisitor();
	public List<VisitorGraphVO> readVisitorGraph();
	public int reachedCost();
	public List<TopItemVO> readTopItem();
}
