package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ProMyPageDto;

public class ProMyPageDao extends SqlMapConfig{
	private String namespace="com.promypage.";
	
	public List<ProMyPageDto> selectAll(int user_no){
		List<ProMyPageDto> res = new ArrayList<>();
		SqlSession session = getSqlSessionFactory().openSession(false);
		res = session.selectList(namespace+"proSelectAll",user_no);
		session.close();
		return res;
		
	}
	
	
	
}
