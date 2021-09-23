package com.kic.shopPro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.LoginDAO;
import com.kic.shopPro.domain.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;
	
	public MemberVO loginServiceMethod(MemberVO login) throws Exception{
		return loginDAO.getLoginResult(login);
	}
	
	public void signup(MemberVO vo) throws Exception{
		loginDAO.signup(vo);
	}
}
