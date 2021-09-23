package com.kic.shopPro.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.ItemDAO;
import com.kic.shopPro.domain.ItemDetailVO;
import com.kic.shopPro.domain.ItemVO;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDAO iDAO;
	
	// 모든 아이템을 출력하는 메서드
	public List<ItemVO> readAllItemsMethod() throws Exception{
		return iDAO.readAllItems();
	}
	
	// 모든 아이템 중 식품 카테고리만 출력하는 메서드
	public List<ItemVO> readAllFoodItemsMethod() throws Exception{
		return iDAO.readAllFoodItems();
	}
	
	// 식품 아이템 중 해당 식품의 상세정보를 출력하는 메서드, 식품 아이템 아이디를 통해 추출
	public ItemDetailVO readFoodItemsDetailInfoByIdMethod(String itemid) throws Exception{
		return iDAO.readFoodItemsDetailInfoById(itemid);
	}
	
	// 식품 카테고리 중 해당 아이디로 식품을 출력 
	public ItemVO readFoodItemByIdMethod(String itemid) throws Exception{
		return iDAO.readFoodItemById(itemid);
	}
	
	// 모든 아이템 중 패션의류/잡화 카테고리만 출력하는 메서드
	public List<ItemVO> readAllClothItemsMethod() throws Exception{
		return iDAO.readAllClothItems();
	}
	
}
