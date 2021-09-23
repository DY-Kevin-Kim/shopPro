package com.kic.shopPro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.ItemReviewDAO;
import com.kic.shopPro.domain.ItemReviewVO;

@Service
public class ItemReviewServiceImpl implements ItemReviewService {
	@Autowired
	private ItemReviewDAO itemReviewDAO;
	
	public List<ItemReviewVO> readAllItemReviewByItemIdMethod(String itemid) throws Exception{
		return itemReviewDAO.readAllItemReviewByItemId(itemid);
	}
	
	public void addReview(ItemReviewVO vo) throws Exception{
		itemReviewDAO.addReview(vo);
	}
}
