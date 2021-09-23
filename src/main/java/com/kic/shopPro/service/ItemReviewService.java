package com.kic.shopPro.service;

import java.util.List;

import com.kic.shopPro.domain.ItemReviewVO;

public interface ItemReviewService {
	public List<ItemReviewVO> readAllItemReviewByItemIdMethod(String itemid) throws Exception;
	public void addReview(ItemReviewVO vo) throws Exception;
}
