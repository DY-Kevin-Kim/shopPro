package com.kic.shopPro.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemReviewService itemReviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/productPage", method=RequestMethod.GET)
	public String productPageViewMethod(@RequestParam("itemid") String itemid, Model model) throws Exception {
		ItemDetailVO idVO = itemService.readFoodItemsDetailInfoByIdMethod(itemid); // 식품 상세정보
		ItemVO iVO = itemService.readFoodItemByIdMethod(itemid); // 식품 기본 정보 
		List<ItemReviewVO> irVO = itemReviewService.readAllItemReviewByItemIdMethod(itemid); // 아이템 아이디에 해당하는 리뷰를 추출 
		
		model.addAttribute("ItemDetail", idVO);
		model.addAttribute("ItemInfo", iVO);
		model.addAttribute("ItemReviewList", irVO);
		
		return "productPage/detailPage";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainPageMethod(Model model) throws Exception {
		List<ItemVO> iVO_food = itemService.readAllFoodItemsMethod();
		model.addAttribute("foodItemList", iVO_food);
		
		List<ItemVO> iVO_cloth = itemService.readAllClothItemsMethod();
		model.addAttribute("clothItemList", iVO_cloth);
		
		return "main/main";
	}
	
	
	
}
