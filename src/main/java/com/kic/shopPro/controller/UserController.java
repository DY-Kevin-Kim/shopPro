package com.kic.shopPro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kic.shopPro.domain.ItemVO;
import com.kic.shopPro.domain.MemberVO;
import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;
import com.kic.shopPro.service.ItemService;
import com.kic.shopPro.service.LoginService;
import com.kic.shopPro.service.VisitorService;

@Controller
public class UserController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ItemService itemService;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	@Autowired
	private VisitorService visitorService;
	
	@RequestMapping(value="/admin/adminPage", method=RequestMethod.GET)
	public String adminPageGetMethod(Model model) {
		
		visitorService.addVisitor();
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // ���� �湮��, ���� �湮��, ���� �湮�� �� ��� ���
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // �湮�� �׷��� ��� ���
		
		//String text = "���� �Ϸ�";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50������ ��ǥ �ݾ������� �ۼ�Ʈ�� ����
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//����,���� ���� �湮�ڼ� ���
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// �湮�� �׷��� ���
		model.addAttribute("visitorGraph", visitorGraph);
		
		// ��ǥ ���� ���ͷ� ���� ���
		model.addAttribute("reachedCost", reachedCost);
		
		// �α� ǰ�� ����Ʈ
		model.addAttribute("topItemList", topItemList);
		
		return "admin/adminPage";
	}
	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET)
	public String myPageGetMethod() {
		return "MyPage";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void signupGetMethod() throws Exception{
		logger.info("get signup");

	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPostMethod(MemberVO vo) throws Exception {
		loginService.signup(vo);
		return "redirect:/main";
	}
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public String loginProcessMethod(MemberVO memVO, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		List<ItemVO> iVO = itemService.readAllFoodItemsMethod();
		List<ItemVO> iVO_cloth = itemService.readAllClothItemsMethod();

		
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
		model.addAttribute("clothItemList",iVO_cloth);
		return "main/main";
	}
}
