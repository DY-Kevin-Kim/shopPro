package com.kic.shopPro.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.kic.shopPro.dao.RegisterDAO;
import com.kic.shopPro.domain.MemberVO;

@Service
public class RegisterServiceImpl implements RegisterService {
	@Autowired
	private RegisterDAO rDAO;
	
	public void registMemberService(MemberVO mVO) throws Exception{
		rDAO.registMember(mVO);
	}
	
}
