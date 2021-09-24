package com.kic.shopPro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kic.shopPro.domain.ItemReviewVO;
import com.kic.shopPro.domain.MypageOrderVO;
import com.kic.shopPro.domain.MemberVO;
@Repository
public class MypageOrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.kic.mapper.userMapper";
	
	public List<MypageOrderVO> getAllItemsFromOrder(String memid) throws Exception{
		List<MypageOrderVO> OVO = new ArrayList<MypageOrderVO>();
		OVO = sqlSession.selectList(namespace+".getAllItemsFromOrder", memid);
		return OVO;
	}
	
	public int UpdateMemInfo(String newid,String newpassword,String newAddress,String beforeid,String beforepassword) throws Exception {
		int checksuccess=0;
		Map<String,String> map=new HashMap<>();
		map.put("newid",newid);
		map.put("newpassword", newpassword);
		map.put("newAddress", newAddress);
		map.put("beforeid", beforeid);
		map.put("beforepassword",beforepassword);
		checksuccess=sqlSession.update(namespace+".UpdateMemInfo",map);
		return checksuccess;
	}
	public List<String> getItemnames(List<String> itemid) throws Exception{
		List<String> itemlist=new ArrayList<>();
		for(int i=0;i<itemid.size();i++) {
			itemlist.add(sqlSession.selectOne(namespace+".getItemNames",itemid.get(i)));
		}
		return itemlist;
	}
	public List<String> getItemidFromOrder(String memid) throws Exception{
		List<String> itemidlist=new ArrayList<>();
		itemidlist=sqlSession.selectList(namespace+".getItemidFromOrder",memid);
		return itemidlist;
	}
}
