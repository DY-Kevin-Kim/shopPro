package com.kic.shopPro.service;

import javax.servlet.http.HttpSession;

import com.kic.shopPro.domain.MemberVO;

public interface LoginService {
	public MemberVO loginServiceMethod(MemberVO login) throws Exception;
	public void signup(MemberVO vo) throws Exception;
	public void signout(HttpSession session) throws Exception;
	/*
	 * public MemberVO idCheck(String id) throws Exception;
	 */
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
}

