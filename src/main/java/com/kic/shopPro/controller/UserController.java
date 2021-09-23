package com.kic.shopPro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kic.shopPro.domain.TopItemVO;
import com.kic.shopPro.domain.VisitorGraphVO;
import com.kic.shopPro.domain.VisitorVO;
import com.kic.shopPro.service.VisitorService;

@Controller
public class UserController {
	
	@Autowired
	private VisitorService visitorService;

	@RequestMapping(value="/admin/adminPage", method=RequestMethod.GET)
	public String adminPageGetMethod(Model model) {
		
		//visitorService.addVisitor();//@@@@@@@@@@@@@@@@ // adminPage 입장시 방문자 수 1회 증가하는 기능 추가
		
		List<VisitorVO> visitors = visitorService.readVisitorList(); // 오늘 방문자, 어제 방문자, 누적 방문자 수 출력 기능
		List<VisitorGraphVO> visitorGraph = visitorService.readVisitorGraphList(); // 방문자 그래프 출력 기능
		
		//String text = "결제 완료";
		double reachedCost = ((double)visitorService.reachedTotalCost()/500000) * 100; // 50만원을 목표 금액으로한 퍼센트값 저장
		
		List<TopItemVO> topItemList = visitorService.readTopItemList();
		
		//오늘,어제 누적 방문자수 출력
		model.addAttribute("visitors", visitors);
		
		System.out.println("===========================" + visitorGraph.size());
		System.out.println("===========================" +visitorGraph.toString());
		System.out.println("===========================" + visitorService.reachedTotalCost());
		System.out.println("===========================" +reachedCost);
		
		// 방문자 그래프 출력
		model.addAttribute("visitorGraph", visitorGraph);
		
		// 목표 도달 수익률 추이 출력
		model.addAttribute("reachedCost", reachedCost);
		
		// 인기 품목 리스트
		model.addAttribute("topItemList", topItemList);
		
		
		return "admin/adminPage";
	}

	
	
	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET)
	public String myPageGetMethod() {
		return "MyPage";
	}
}
