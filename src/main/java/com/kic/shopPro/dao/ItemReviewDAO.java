package com.kic.shopPro.dao;

import java.util.List;

import com.kic.shopPro.domain.ItemReviewVO;

public interface ItemReviewDAO {
	public List<ItemReviewVO> readAllItemReviewByItemId(String itemid) throws Exception;
	public void addReview(ItemReviewVO vo) throws Exception;
}
