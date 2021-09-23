package com.kic.shopPro.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.ItemReviewVO;
import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;

@Repository
public class VisitorDAOImpl implements VisitorDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kic.mapper.userMapper";
	
	
	public void addVisitor(){
		
		sqlSession.insert(namespace+".addVisit");
	}
	
	public List<VisitorVO> readVisitor(){
		List<VisitorVO> visitors = new ArrayList<VisitorVO>();
		visitors = sqlSession.selectList(namespace+".readVisit");
		return visitors;
	}
	
	public List<VisitorGraphVO> readVisitorGraph(){
		List<VisitorGraphVO> visitorGraph = new ArrayList<VisitorGraphVO>();
		visitorGraph = sqlSession.selectList(namespace+".readVisitGraph");
		return visitorGraph;
	}
	
	public int reachedCost(){
		int reachCost = sqlSession.selectOne(namespace+".reachedCost"); 
		return reachCost;
	}
	
	public List<TopItemVO> readTopItem(){
		List<TopItemVO> topItem = new ArrayList<TopItemVO>();
		topItem = sqlSession.selectList(namespace+".readTopItem");
		return topItem;
	}


}
