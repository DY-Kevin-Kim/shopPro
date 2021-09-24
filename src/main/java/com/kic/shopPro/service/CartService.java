package com.kic.shopPro.service;

import java.util.List;

import com.kic.shopPro.domain.CartVO;

public interface CartService {
	public List<CartVO> readCartListMethod(String id) throws Exception;
	public void insertCartMethod(CartVO cVO) throws Exception;
	public CartVO readCartMethod(String id, String itemid) throws Exception;
	public void updateCartMethod(CartVO cVO) throws Exception;
	public void deleteCartMethod(String memid,String itemid) throws Exception;
	public void inputOrderMethod(List<CartVO> vo) throws Exception;
	public void deleteAllCartMethod(String id) throws Exception;
}
