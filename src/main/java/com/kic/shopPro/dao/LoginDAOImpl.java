package com.kic.shopPro.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.kic.mapper.userMapper";
	
	public MemberVO getLoginResult(MemberVO login) throws Exception{
		return sqlSession.selectOne(namespace+".login", login);
	}
	//회원가입
	public void signup(MemberVO vo) throws Exception{
		sqlSession.insert(namespace+".signup",vo);
	}
	public int idCheck(String id) throws Exception{
		return sqlSession.selectOne(namespace+".idCheck",id);
	}
	/*
	 * public MemberVO idCheck(String id) throws Exception{ return
	 * sqlSession.selectOne(namespace+".idCheck",id); }
	 */



}
