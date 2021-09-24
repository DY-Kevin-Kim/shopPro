package com.kic.shopPro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.LoginDAO;
import com.kic.shopPro.dao.MypageOrderDAO;
import com.kic.shopPro.domain.MemberVO;
import com.kic.shopPro.domain.MypageOrderVO;

@Service
public class mypageService {

	@Autowired
	private MypageOrderDAO mpod; 
	public List<MypageOrderVO> getItemsFromOrderMethod(String memid) throws Exception{
		return mpod.getAllItemsFromOrder(memid);
	}
	public int UpdateMemInfo(String newid,String newpassword,String newAddress,String beforeid,String beforepassword) throws Exception{
		int checksuccess=0;
		checksuccess=mpod.UpdateMemInfo(newid,newpassword,newAddress,beforeid,beforepassword);
		return checksuccess;
	}
	public List<String> getItemnames(List<String> itemid) throws Exception{
		return mpod.getItemnames(itemid);
	}
	
	public List<String> getItemidFromOrder(String memid) throws Exception{
		return mpod.getItemidFromOrder(memid);
	}
}
