package com.kic.shopPro.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.ItemReviewVO;

@Repository
public class ItemReviewDAOImpl implements ItemReviewDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kic.mapper.itemReviewMapper";
	
	public List<ItemReviewVO> readAllItemReviewByItemId(String itemid) throws Exception{
		List<ItemReviewVO> irVO = new ArrayList<ItemReviewVO>();
		irVO = sqlSession.selectList(namespace+".selectAllItemReviewById", itemid);
		return irVO;
	}
	public void addReview(ItemReviewVO vo) throws Exception{
		sqlSession.insert(namespace+".insertReview",vo);
	}
}
