package com.kic.shopPro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.CartDAO;
import com.kic.shopPro.domain.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDao;

	@Override
	public List<CartVO> readCartListMethod(String id) throws Exception {
		// TODO Auto-generated method stub
		return cartDao.readCartList(id);
	}

	@Override
	public void insertCartMethod(CartVO cVO) throws Exception {
		// TODO Auto-generated method stub
		cartDao.insertCart(cVO);
	}

	@Override
	public CartVO readCartMethod(String id, String itemid) throws Exception {
		// TODO Auto-generated method stub
		return cartDao.readCart(id, itemid);
	}

	@Override
	public void updateCartMethod(CartVO cVO) throws Exception {
		// TODO Auto-generated method stub
		cartDao.updateCart(cVO);
	}

	@Override
	public void deleteCartMethod(String memid, String itemid) throws Exception {
		// TODO Auto-generated method stub
		cartDao.deleteCart(memid,itemid);
	}

	@Override
	public void inputOrderMethod(List<CartVO> vo) throws Exception {
		// TODO Auto-generated method stub
		cartDao.inputOrder(vo);
	}

	@Override
	public void deleteAllCartMethod(String id) throws Exception {
		// TODO Auto-generated method stub
		cartDao.deleteAllCart(id);
	}

}
