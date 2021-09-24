package com.kic.shopPro.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.MemberVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.kic.mapper.registMember";
	
	public void registMember(MemberVO mVO) throws Exception{
		sqlSession.insert(namespace+".insertMember", mVO);
	}

}
