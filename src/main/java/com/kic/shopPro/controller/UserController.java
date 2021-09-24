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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kic.shopPro.domain.ItemVO;
import com.kic.shopPro.domain.MemberVO;
import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;
import com.kic.shopPro.service.ItemService;
import com.kic.shopPro.service.LoginService;
import com.kic.shopPro.service.RegisterService;
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
	
	@Autowired
	private RegisterService rService;
	
	@RequestMapping(value="/admin/adminPage", method=RequestMethod.GET)
	public String adminPageGetMethod(Model model) {
		
		visitorService.addVisitor();
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // �삤�뒛 諛⑸Ц�옄, �뼱�젣 諛⑸Ц�옄, �늻�쟻 諛⑸Ц�옄 �닔 異쒕젰 湲곕뒫
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // 諛⑸Ц�옄 洹몃옒�봽 異쒕젰 湲곕뒫
		
		//String text = "寃곗젣 �셿猷�";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50留뚯썝�쓣 紐⑺몴 湲덉븸�쑝濡쒗븳 �띁�꽱�듃媛� ���옣
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//�삤�뒛,�뼱�젣 �늻�쟻 諛⑸Ц�옄�닔 異쒕젰
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// 諛⑸Ц�옄 洹몃옒�봽 異쒕젰
		model.addAttribute("visitorGraph", visitorGraph);
		
		// 紐⑺몴 �룄�떖 �닔�씡瑜� 異붿씠 異쒕젰
		model.addAttribute("reachedCost", reachedCost);
		
		// �씤湲� �뭹紐� 由ъ뒪�듃
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
		return "redirect: /shopPro/main";
	}
	
}
