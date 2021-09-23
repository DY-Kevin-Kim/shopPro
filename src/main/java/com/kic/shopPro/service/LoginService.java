package com.kic.shopPro.service;

import com.kic.shopPro.domain.MemberVO;

public interface LoginService {
	public MemberVO loginServiceMethod(MemberVO login) throws Exception;
	public void signup(MemberVO vo) throws Exception;
}
