package com.forum.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.SqlConfig;
import com.dto.BoardDto;

public class forumDao extends SqlConfig {
		private String namespace="com.my.board.";

		public List<BoardDto> selectAll() {		
			List<BoardDto> res = new ArrayList<BoardDto>();
			
			SqlSession session = null;
			
			try {
			session=getSqlSessionFactory().openSession(false);
			
			res=session.selectList(namespace+"FselectAll");
			
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return res;
		}
		
		public BoardDto selectOne(int seq) {
			SqlSession session = null;
			BoardDto res = null;
			
			try {
				session = getSqlSessionFactory().openSession(true);				
				res = session.selectOne(namespace+"selectOne",seq);
				
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return res;
		}
		
		public int insert(BoardDto dto) {
			SqlSession session = null;
			int res = 0;
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.insert(namespace+"insert", dto);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return res;
		}
		
		public BoardDto delete(int seq) {
			SqlSession session = null;
			BoardDto res = null;
			
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.selectOne(namespace+"delete",seq);
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return res;
		}

		public int update(BoardDto dto) {
			SqlSession session = null;
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.update(namespace+"update",dto);
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return res;
		}
	
}
