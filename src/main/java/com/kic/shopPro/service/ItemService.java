package com.kic.shopPro.service;

import java.util.List;

import com.kic.shopPro.domain.ItemDetailVO;
import com.kic.shopPro.domain.ItemVO;

public interface ItemService {
	public List<ItemVO> readAllItemsMethod() throws Exception;
	public List<ItemVO> readAllFoodItemsMethod() throws Exception;
	public ItemDetailVO readFoodItemsDetailInfoByIdMethod(String itemid) throws Exception;
	public ItemVO readFoodItemByIdMethod(String itemid) throws Exception;
	public List<ItemVO> readAllClothItemsMethod() throws Exception;
}
