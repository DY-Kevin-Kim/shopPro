package com.kic.shopPro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kic.shopPro.domain.ItemVO;
import com.kic.shopPro.domain.MemberVO;
import com.kic.shopPro.service.ItemService;
import com.kic.shopPro.service.LoginService;

@Controller
public class UserController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value="/admin/adminPage", method=RequestMethod.GET)
	public String adminPageGetMethod() {
		return "admin/adminPage";
	}
	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET)
	public String myPageGetMethod() {
		return "MyPage";
	}
	
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public String loginProcessMethod(MemberVO memVO, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		List<ItemVO> iVO = itemService.readAllFoodItemsMethod();
		
		try {
			MemberVO login = loginService.loginServiceMethod(memVO);
			
			if(login == null) {
				session.setAttribute("login", null);
			}
			else {
				System.out.println(login.getId());
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(1800);
				model.addAttribute("login", login);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("foodItemList", iVO);
		return "redirect: /shopPro/main";
	}
}
