package com.kic.shopPro.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.ItemDetailVO;
import com.kic.shopPro.domain.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kic.mapper.itemMapper";
	
	// 카테고리 상관없이 모든 아이템을 출력
	public List<ItemVO> readAllItems() throws Exception{
		List<ItemVO> iVO = new ArrayList<ItemVO>();
		iVO = sqlSession.selectList(namespace+".selectAllItem");
		return iVO;
	}
	
	// 식품에 대한 모든 아이템 출력
	public List<ItemVO> readAllFoodItems() throws Exception{
		List<ItemVO> iVO = new ArrayList<ItemVO>();
		iVO = sqlSession.selectList(namespace+".selectAllFoodItem");
		return iVO;
	}
	
	// 모든 아이템 중 식품의 아이디를 통해 해당되는 식품의 모든 정보를 출력 
	public ItemVO readFoodItemById(String itemid) throws Exception{
		ItemVO iVO = new ItemVO();
		iVO = sqlSession.selectOne(namespace+".selectFoodItemByID", itemid);
		return iVO;
	}
		
	// 식품 아이템에서 아이디에 해당되는 식품의 모든 상세 정보를 출력 
	public ItemDetailVO readFoodItemsDetailInfoById(String itemid) throws Exception{
		ItemDetailVO idVO = new ItemDetailVO();
		idVO = sqlSession.selectOne(namespace+".selectFoodItemsDetailInfoById", itemid);
		return idVO;
	}
	
	// 패션의류/잡화에 대한 모든 아이템 출력
	public List<ItemVO> readAllClothItems() throws Exception{
		List<ItemVO> iVO = new ArrayList<ItemVO>();
		iVO = sqlSession.selectList(namespace+".selectAllClothItem");
		return iVO;
	}
	
	
}
