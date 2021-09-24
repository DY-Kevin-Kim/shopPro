package com.kic.shopPro.dao;

import java.util.List;

import com.kic.shopPro.domain.ItemDetailVO;
import com.kic.shopPro.domain.ItemVO;

public interface ItemDAO {
	public List<ItemVO> readAllItems() throws Exception;
	public List<ItemVO> readAllFoodItems() throws Exception;
	public ItemDetailVO readFoodItemsDetailInfoById(String itemid) throws Exception;
	public ItemVO readFoodItemById(String itemid) throws Exception;
	public List<ItemVO> readAllClothItems() throws Exception;
	public void updateItem(ItemVO iVO) throws Exception;

}
