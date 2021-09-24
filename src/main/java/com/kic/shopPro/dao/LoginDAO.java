package com.kic.shopPro.dao;

import com.kic.shopPro.domain.MemberVO;

public interface LoginDAO {
	public MemberVO getLoginResult(MemberVO login) throws Exception;
	public void signup(MemberVO vo) throws Exception;

	/*
	 * public MemberVO idCheck(String id) throws Exception;
	 */	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
}
