package com.kic.shopPro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.protobuf.TextFormat.ParseException;
import com.kic.shopPro.dao.LoginDAO;
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
	private SqlSession sqlSession;
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
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // 占쎈쐻占쎈윪亦낅‥�쐻占쎈윥獒뺧옙 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑, 占쎈쐻占쎈윥占쎄퐨占쎈쐻占쎈윪占쎌졆 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑, 占쎈쐻占쎈윥占쎈괌占쎈쐻占쎈윪占쎌뱾 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑 占쎈쐻占쎈윥占쎈묄 �뜝�럥�돯�뜝�럥痢듿뜝�럩議� 占쎈섀饔낅챸占썩댙�삕獒뺧옙
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑 占쎌쐺獄쏅챷援▼뜝�럩援ο옙�쐻占쎈윥占쎈뭷 �뜝�럥�돯�뜝�럥痢듿뜝�럩議� 占쎈섀饔낅챸占썩댙�삕獒뺧옙
		
		//String text = "占쎈눇�뙼�맪占쏙퐦�삕占쎌졆 占쎈쐻占쎈윪占쎄괜�뜝�럥��占쎈쐻�뜝占�";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50癲ル슢�뵯占쎈뮝�뜝�럥�맱占쎈쐻占쎈윪獄�占� 癲ル슢�뀈泳��떣彛쀥뜝占� 占쎈섀占쏙옙占쎌맆占쎈눀筌뤿슣�굲�뜝�럥�걬占쎌뒙占쎈룱獒뺣맢�눀�뜝占� 占쎈쐻占쎈윥占쎈군占쎈쐻占쎈윞占쎈뤊占쎈쐻占쎈윥獄��뮀琉놅옙猷딉옙�굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈윪占쎄텑
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//占쎈쐻占쎈윪亦낅‥�쐻占쎈윥獒뺧옙,占쎈쐻占쎈윥占쎄퐨占쎈쐻占쎈윪占쎌졆 占쎈쐻占쎈윥占쎈괌占쎈쐻占쎈윪占쎌뱾 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑占쎈쐻占쎈윥占쎈묄 �뜝�럥�돯�뜝�럥痢듿뜝�럩議�
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// 占쎈쎗占쎈젻泳�戮る즵占쎈쐻占쎈윪占쎄껑 占쎌쐺獄쏅챷援▼뜝�럩援ο옙�쐻占쎈윥占쎈뭷 �뜝�럥�돯�뜝�럥痢듿뜝�럩議�
		model.addAttribute("visitorGraph", visitorGraph);
		
		// 癲ル슢�뀈泳��떣彛쀥뜝占� 占쎈쐻占쎈윥筌앷엥�쐻占쎈윥�젆占� 占쎈쐻占쎈윥占쎈묄占쎈쐻占쎈윪�얄댙�삕筌뤿떣�쐻�뜝占� �뜝�럥�돯占쎄껀占쎌뒭�억옙 �뜝�럥�돯�뜝�럥痢듿뜝�럩議�
		model.addAttribute("reachedCost", reachedCost);
		
		// 占쎈쐻占쎈윪�앓룸섀占쎈Ŋ�굲 占쎈쐻占쎈윥�뜝�럥肄덂퐲�λ쐻�뜝占� �뜝�럥�렓�뜝�럥遊얕짆�쉩�쐻占쎈윥獄�占�
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
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String payForItemMethod(@RequestParam("itemid") String itemid, @RequestParam("itemcount") int itemcount) throws Exception{
		
		ItemVO iVO = itemService.readFoodItemByIdMethod(itemid);
		int newStored = iVO.getStored() - itemcount;
		iVO.setStored(newStored);
		itemService.updateItemStore(iVO);
		return "redirect:/main";
	}
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	   public String MyPageMethod(Model model,HttpServletRequest request,HttpServletRequest response) throws Exception {
	      HttpSession session=request.getSession();
	      MemberVO mypageinfo=(MemberVO)session.getAttribute("login");
	      List<MypageOrderVO> mpvo=new ArrayList<MypageOrderVO>();
	      List<String> itemname=new ArrayList<String>();
	      List<String> itemid=new ArrayList<String>();
	      if(mypageinfo==null) {
	         String msg="로그인이 되어있지 않습니다.";
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
	         model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
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
	         
	         model.addAttribute("msg","정보가 수정되었습니다.");
	         model.addAttribute("url","mypage");
	         session.removeAttribute("login");
	         session.setAttribute("login", newVO);
	         return "alert";
	      }else {
	         model.addAttribute("msg","수정오류!");
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
		// �뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏 繞벿살탮占쎄텢 �뇦猿볦삕�뜝�럡�뀬
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String id) throws Exception{
			
			logger.info("memberIdChk() 진입");
			logger.info(id);
			
			int result = loginService.idCheck(id);
			
			logger.info("결과값 =" + result);
			
			if(result != 0) {
				
				return "fail";	// 繞벿살탮占쎄텢 �뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏�뤆�룊�삕 �댖怨뺣샍占쎌궨
				
			} else {
				
				return "success";	// 繞벿살탮占쎄텢 �뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏 x
				
			}
		}
}
