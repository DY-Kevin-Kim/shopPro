package com.kic.shopPro.dao;

import java.util.List;

import com.kic.shopPro.domain.CartVO;

public interface CartDAO {
	public List<CartVO> readCartList(String id) throws Exception;

	public void insertCart(CartVO cVO) throws Exception;

	public CartVO readCart(String id, String itemid) throws Exception;

	public void updateCart(CartVO cVO) throws Exception;

	public void deleteCart(String memid, String itemid) throws Exception;

	public void deleteAllCart(String id) throws Exception;
	
	public void inputOrder(List<CartVO> vo) throws Exception;
}
