package com.kic.shopPro.dao;

import com.kic.shopPro.domain.MemberVO;

public interface LoginDAO {
	public MemberVO getLoginResult(MemberVO login) throws Exception;
	public void signup(MemberVO vo) throws Exception;
}
