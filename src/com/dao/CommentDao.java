package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CommentDto;

public class CommentDao extends SqlConfig{
	private String namespace="com.my.board.";
	
	public List<CommentDto> commAll(int seq) {
		SqlSession session = null;
		List<CommentDto> res = new ArrayList<>();
		
		try {
		session = getSqlSessionFactory().openSession(false);
		
		res = session.selectList(namespace+"commAll",seq);
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	
   }

	public int commCount(int seq) {
		SqlSession session = null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne(namespace+"commCnt",seq);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			session.close();
		}
		return res;
	}

	public int commInsert(CommentDto insert) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			res = session.insert(namespace+"commInsert",insert);
			
			System.out.println(res);
			
			if(res>0) {
				session.commit();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public int commDelete(int commno) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"commDelete",commno);
			
			if(res > 0) {
				session.commit();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			session.close();
		}
		
		return res;
	}

	public CommentDto commOne(int commno) {
		SqlSession session = null;
		CommentDto res = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			res = session.selectOne(namespace+"commOne",commno);
			
		}catch (Exception e) {
			e.printStackTrace();
			
			
		}finally {
			session.close();
		}
		return res;
	}

	public int commUpate(CommentDto commUpdate) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"commUpdate",commUpdate);
			
			if(res > 0) {
				session.commit();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			session.close();
		}
		
		return res;
	} 
	


}