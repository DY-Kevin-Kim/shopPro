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
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // �뜝�럩沅롥뜝�럥裕� �뛾�렮維뽪룇�뜝�럩�겱, �뜝�럥�꽑�뜝�럩�젷 �뛾�렮維뽪룇�뜝�럩�겱, �뜝�럥�뱡�뜝�럩�쓤 �뛾�렮維뽪룇�뜝�럩�겱 �뜝�럥�빢 占쎈퉲占쎈츊占쎌졑 �뼨轅명�∽옙裕�
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // �뛾�렮維뽪룇�뜝�럩�겱 �윜諛몄굡占쎌굥�뜝�럥�뒆 占쎈퉲占쎈츊占쎌졑 �뼨轅명�∽옙裕�
		
		//String text = "�뇦猿됲�ｏ옙�젷 �뜝�럩�걦占쎈쇀�뜝占�";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50嶺뚮씭�뒩占쎈쐸�뜝�럩諭� 嶺뚮ㅄ維싷쭗占� �뼨���쐠�뇡紐뚯삕占쎈さ�슖�돦裕됮뇡占� �뜝�럥�뱺�뜝�럡�돺�뜝�럥諭쒏뤆�룊�삕 �뜝�룞�삕�뜝�럩�궋
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//�뜝�럩沅롥뜝�럥裕�,�뜝�럥�꽑�뜝�럩�젷 �뜝�럥�뱡�뜝�럩�쓤 �뛾�렮維뽪룇�뜝�럩�겱�뜝�럥�빢 占쎈퉲占쎈츊占쎌졑
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// �뛾�렮維뽪룇�뜝�럩�겱 �윜諛몄굡占쎌굥�뜝�럥�뒆 占쎈퉲占쎈츊占쎌졑
		model.addAttribute("visitorGraph", visitorGraph);
		
		// 嶺뚮ㅄ維싷쭗占� �뜝�럥利꿨뜝�럥堉� �뜝�럥�빢�뜝�럩逾∽옙紐닷뜝占� 占쎈퉲�겫�슦逾� 占쎈퉲占쎈츊占쎌졑
		model.addAttribute("reachedCost", reachedCost);
		
		// �뜝�럩逾η뼨�먯삕 �뜝�럥占쎈콈彛쀥뜝占� 占쎈뎨占쎈봾裕욃뜝�럥諭�
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
		// 占쎈툡占쎌뵠占쎈탵 餓λ쵎�궗 野껓옙占쎄텢
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String id) throws Exception{
			
			logger.info("memberIdChk() 진입");
			logger.info(id);
			
			int result = loginService.idCheck(id);
			
			logger.info("결과값 =" + result);
			
			if(result != 0) {
				
				return "fail";	// 餓λ쵎�궗 占쎈툡占쎌뵠占쎈탵揶쏉옙 鈺곕똻�삺
				
			} else {
				
				return "success";	// 餓λ쵎�궗 占쎈툡占쎌뵠占쎈탵 x
				
			}
		}
}
