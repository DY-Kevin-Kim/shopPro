package com.kic.shopPro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kic.shopPro.domain.ItemDetailVO;
import com.kic.shopPro.domain.ItemReviewVO;
import com.kic.shopPro.domain.ItemVO;
import com.kic.shopPro.service.ItemReviewService;
import com.kic.shopPro.service.ItemService;

@Controller
public class ReviewController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemReviewService itemReviewService;

	
	@RequestMapping(value="/reviewWrite", method=RequestMethod.GET)
	public String reviewWriteGetMethod(@RequestParam("itemid") String itemid, Model model) throws Exception {
		
		ItemVO iVO = itemService.readFoodItemByIdMethod(itemid);
		
		model.addAttribute("ItemInfo",iVO);
		
		System.out.println(itemid);
		
		return "board/review/reviewWrite";
	}
	
	@RequestMapping(value="/reviewWritepro", method=RequestMethod.POST)
	public String addReviewcard(ItemReviewVO vo) throws Exception {
		
		System.out.println(vo);
		
		itemReviewService.addReview(vo);
	
		
		return "redirect:/productPage?itemid="+vo.getItemid();
	}
}
