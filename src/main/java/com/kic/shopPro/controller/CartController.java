package com.kic.shopPro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kic.shopPro.domain.CartVO;
import com.kic.shopPro.domain.ItemVO;
import com.kic.shopPro.domain.MemberVO;
import com.kic.shopPro.service.CartService;
import com.kic.shopPro.service.ItemService;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private ItemService itemService;

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartPagePOST(Model model, HttpSession session) throws Exception {
		MemberVO get = (MemberVO) session.getAttribute("login");
		List<CartVO> list = null;
		list = cartService.readCartListMethod(get.getId());
		model.addAttribute("cartList", list);

		return "cart/cart";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cartPageGET(Model model, @RequestParam("itemcount") int itemcount,
			@RequestParam("itemid") String itemid, HttpSession session) throws Exception {
		MemberVO get = (MemberVO) session.getAttribute("login");
		CartVO cVO = cartService.readCartMethod("Lee0515", itemid);
		System.out.println(cVO);
		ItemVO iVO = itemService.readFoodItemByIdMethod(itemid);
		if (cVO == null) {
			cVO = new CartVO(get.getId(), iVO, itemcount);
			cartService.insertCartMethod(cVO);
		} else {
			itemcount = cVO.getItemcount() + itemcount;
			cVO.setItemcount(itemcount);
			cVO.setPrice(itemcount * iVO.getPrice());
			cartService.updateCartMethod(cVO);
		}
		List<CartVO> cartList = cartService.readCartListMethod("Lee0515");
		logger.info(cartList.toString());
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}

	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteGET(Model model, HttpSession session, @RequestParam("itemid") String itemid) throws Exception{
		MemberVO get = (MemberVO) session.getAttribute("login");
		cartService.deleteCartMethod(get.getId(), itemid);
		return "redirect: /shopPro/cart";
	} 
	
	@RequestMapping(value="/inputOrder",method=RequestMethod.GET)
	public String inputOrderGET(Model model, HttpSession session) throws Exception{
		MemberVO get = (MemberVO) session.getAttribute("login");
		List<CartVO> list = null;
		list = cartService.readCartListMethod(get.getId());
		cartService.inputOrderMethod(list);
		cartService.deleteAllCartMethod(get.getId());
		return "redirect: /shopPro/cart";
	}
}
