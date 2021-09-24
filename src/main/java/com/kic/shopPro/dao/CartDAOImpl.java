package com.kic.shopPro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;

	private String namespace = "com.kic.mappers.cartMapper";

	@Override
	public List<CartVO> readCartList(String id) throws Exception {
		// TODO Auto-generated method stub
		List<CartVO> list = sqlSession.selectList(namespace + ".selectCart", id);
		return list;
	}

	@Override
	public void insertCart(CartVO cVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertCart", cVO);
	}

	@Override
	public CartVO readCart(String id, String itemid) throws Exception {
		// TODO Auto-generated method stub
		CartVO cvo=new CartVO();
		cvo.setMemid(id);
		cvo.setItemid(itemid);
		CartVO vo = sqlSession.selectOne(namespace + ".selectCartOne",cvo);
		return vo;
	}

	@Override
	public void updateCart(CartVO cVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateCart", cVO);
	}

	@Override
	public void deleteCart(String memid, String itemid) throws Exception {
		// TODO Auto-generated method stub
		CartVO cvo=new CartVO();
		cvo.setMemid(memid);
		cvo.setItemid(itemid);
		sqlSession.delete(namespace+".deleteCart",cvo);
	}

	@Override
	public void deleteAllCart(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deleteAllCart",id);
	}

	@Override
	public void inputOrder(List<CartVO> vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".inputOrder",vo);
	}
}
