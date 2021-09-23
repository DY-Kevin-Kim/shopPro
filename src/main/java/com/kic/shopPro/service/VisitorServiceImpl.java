package com.kic.shopPro.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.VisitorDAO;
import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;

@Service
public class VisitorServiceImpl implements VisitorService{
	
	
	@Autowired
	private VisitorDAO visitorDAO;
	
	@Override
	public void addVisitor() {
		// TODO Auto-generated method stub
		visitorDAO.addVisitor();
	}
	
	@Override
	public List<VisitorVO> readVisitorList() {
		// TODO Auto-generated method stub
		return visitorDAO.readVisitor();
	}
	
	@Override
	public List<VisitorGraphVO> readVisitorGraphList() {
		// TODO Auto-generated method stub
		return visitorDAO.readVisitorGraph();
	}
	
	@Override
	public int reachedTotalCost() {
		// TODO Auto-generated method stub
		return visitorDAO.reachedCost();
	}
	
	@Override
	public List<TopItemVO> readTopItemList() {
		// TODO Auto-generated method stub
		return visitorDAO.readTopItem();
	}

	
}
