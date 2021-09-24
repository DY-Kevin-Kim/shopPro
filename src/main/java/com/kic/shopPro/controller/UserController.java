package com.kic.shopPro.controller;

import java.util.ArrayList;
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
import com.kic.shopPro.domain.MypageOrderVO;
import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;
import com.kic.shopPro.service.ItemService;
import com.kic.shopPro.service.LoginService;
import com.kic.shopPro.service.RegisterService;
import com.kic.shopPro.service.VisitorService;
import com.kic.shopPro.service.mypageService;
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
	
	@Autowired
	private mypageService mpageService;
	
	@RequestMapping(value="/admin/adminPage", method=RequestMethod.GET)
	public String adminPageGetMethod(Model model) {
		
		visitorService.addVisitor();
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // 占쎌궎占쎈뮎 獄쎻뫖揆占쎌쁽, 占쎈선占쎌젫 獄쎻뫖揆占쎌쁽, 占쎈듇占쎌읅 獄쎻뫖揆占쎌쁽 占쎈땾 �빊�뮆�젾 疫꿸퀡�뮟
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // 獄쎻뫖揆占쎌쁽 域밸챶�삋占쎈늄 �빊�뮆�젾 疫꿸퀡�뮟
		
		//String text = "野껉퀣�젫 占쎌끏�뙴占�";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50筌띾슣�뜚占쎌뱽 筌뤴뫚紐� 疫뀀뜆釉몌옙�몵嚥≪뮉釉� 占쎈쓠占쎄쉽占쎈뱜揶쏉옙 占쏙옙占쎌삢
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//占쎌궎占쎈뮎,占쎈선占쎌젫 占쎈듇占쎌읅 獄쎻뫖揆占쎌쁽占쎈땾 �빊�뮆�젾
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// 獄쎻뫖揆占쎌쁽 域밸챶�삋占쎈늄 �빊�뮆�젾
		model.addAttribute("visitorGraph", visitorGraph);
		
		// 筌뤴뫚紐� 占쎈즲占쎈뼎 占쎈땾占쎌뵡�몴占� �빊遺우뵠 �빊�뮆�젾
		model.addAttribute("reachedCost", reachedCost);
		
		// 占쎌뵥疫뀐옙 占쎈�뱄쭗占� �뵳�딅뮞占쎈뱜
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
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	   public String MyPageMethod(Model model,HttpServletRequest request,HttpServletRequest response) throws Exception {
	      HttpSession session=request.getSession();
	      MemberVO mypageinfo=(MemberVO)session.getAttribute("login");
	      List<MypageOrderVO> mpvo=new ArrayList<MypageOrderVO>();
	      List<String> itemname=new ArrayList<String>();
	      List<String> itemid=new ArrayList<String>();
	      if(mypageinfo==null) {
	         String msg="濡쒓렇�씤�씠 �릺�뼱�엳吏� �븡�뒿�땲�떎.";
	         String url="main";
	         model.addAttribute("msg",msg);
	         model.addAttribute("url",url);
	         return "alert";
	      }
	      else {
	         itemid=mpageService.getItemidFromOrder(mypageinfo.getId());
	         itemname=mpageService.getItemnames(itemid);
	         mpvo=mpageService.getItemsFromOrderMethod(mypageinfo.getId());
	         model.addAttribute("itemnamelist",itemname);
	         model.addAttribute("mypageinfo",mypageinfo);
	         model.addAttribute("mpvo",mpvo);
	      }
	      return "Mypage/mypage";
	   }
	   
	   @RequestMapping(value="/Changefinish",method=RequestMethod.GET)
	   public String Changefinish(Model model,HttpServletRequest request) throws Exception{
	      String password=request.getParameter("updatePS");
	      HttpSession session=request.getSession();
	      MemberVO mypageinfo=(MemberVO)session.getAttribute("login");
	      System.out.println("mypageinfo : "+mypageinfo.getPass());
	      System.out.println("password : "+password);
	      if(password.equals(mypageinfo.getPass())) {
	         return "Mypage/ChangeInfo";
	      }
	      else {
	         model.addAttribute("msg","鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
	         model.addAttribute("url","UpdateMeminfo");
	         return "alert";
	      }
	   }   
	   
	   @RequestMapping(value="/Updatefinish",method=RequestMethod.GET)
	   public String Updatefinish(Model model,HttpServletRequest request) throws Exception{
	      MemberVO newVO=new MemberVO();
	      HttpSession session=request.getSession();
	      MemberVO mypageinfo=(MemberVO)session.getAttribute("login");
	      System.out.println("beforeid : "+mypageinfo.getId());
	      System.out.println("beforepassword : "+mypageinfo.getPass());
	      System.out.println("changeid:"+request.getParameter("changeid"));
	      System.out.println("changePS:"+request.getParameter("changePS"));
	      System.out.println("changeADDress:"+request.getParameter("changeAddress"));
	      newVO.setId(request.getParameter("changeid"));
	      newVO.setPass(request.getParameter("changePS"));
	      newVO.setAddress(request.getParameter("changeAddress"));
	      
	      int num=mpageService.UpdateMemInfo(request.getParameter("changeid"),request.getParameter("changePS"),request.getParameter("changeAddress"),mypageinfo.getId(),mypageinfo.getPass());
	      if(num>0) {
	         
	         model.addAttribute("msg","�젙蹂닿� �닔�젙�릺�뿀�뒿�땲�떎.");
	         model.addAttribute("url","mypage");
	         session.removeAttribute("login");
	         session.setAttribute("login", newVO);
	         return "alert";
	      }else {
	         model.addAttribute("msg","�닔�젙�삤瑜�!");
	         model.addAttribute("url","ChangeInfo");
	         return "alert";
	      }
	   }
	   
	   @RequestMapping(value="/UpdateMeminfo",method=RequestMethod.GET)
	   public String UpdateMeminfo() throws Exception{
	      return "Mypage/UpdateMeminfo";
	   }
	   
	   @RequestMapping(value = "/signout", method = RequestMethod.GET)
		public String signout(HttpSession session) throws Exception {
		 logger.info("get logout");
		 
		 loginService.signout(session);
		   
		 return "redirect:/main";
		}
		// �븘�씠�뵒 以묐났 寃��궗
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String id) throws Exception{
			
			logger.info("memberIdChk() 吏꾩엯");
			logger.info(id);
			
			int result = loginService.idCheck(id);
			
			logger.info("寃곌낵媛� = " + result);
			
			if(result != 0) {
				
				return "fail";	// 以묐났 �븘�씠�뵒媛� 議댁옱
				
			} else {
				
				return "success";	// 以묐났 �븘�씠�뵒 x
				
			}
		}

}
