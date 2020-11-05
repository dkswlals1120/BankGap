package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.MyPageDto;
import com.dto.sum_dto;

public class MyPageDao extends SqlMapConfig {
	private String namespace = "com.mypage.";
	private String namespace2 = "com.sum_amount.";
	
	public List<MyPageDto> selectAll(int user_no){
		List<MyPageDto> res = new ArrayList<>();
		
		SqlSession session = getSqlSessionFactory().openSession(false);
		
		res = session.selectList(namespace + "selectAll", user_no);
		
		session.close();
		
		return res;
	}
	
	public int insert(MyPageDto dto){
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
		
			if(res>0) {
				session.commit();
				System.out.println("insert commit 성공");
				
			}
		}catch(Exception e) {
			System.out.println("insert 실패");
			e.printStackTrace();
		} finally {
			session.close();
			System.out.println("insert 정상 종료");
		}
		
		return res;
	}
	
	public MyPageDao delete(int user_no ,int payno) {
		SqlSession session = null;
		MyPageDao res =null;
		HashMap<String,Integer> del = new HashMap<>();
		del.put("user_no", user_no);
		del.put("payno",payno);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "delete",del);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int update(int user_no, int payno) {
		SqlSession session = null;
		int res=0;
		HashMap<String,Integer> upd = new HashMap<>();
		upd.put("user_no", user_no);
		upd.put("payno",payno);
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"update",upd);
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	
	// graph ----------------------------------------------------------------------------------
//	public List<MyPageDto> traffic(int user_no){
//		List<MyPageDto> res = new ArrayList<>();
//		
//		SqlSession session = getSqlSessionFactory().openSession(true);
//		
//		res = session.selectList(namespace + "traffic", user_no);
//		
//		session.close();
//		
//		return res;
//	}
//	
//	public List<MyPageDto> food(int user_no){
//		List<MyPageDto> res = new ArrayList<>();
//		
//		SqlSession session = getSqlSessionFactory().openSession(true);
//		
//		res = session.selectList(namespace + "food", user_no);
//		
//		session.close();
//		
//		return res;
//	}
//	
//	public List<MyPageDto> cultural(int user_no){
//		List<MyPageDto> res = new ArrayList<>();
//		
//		SqlSession session = getSqlSessionFactory().openSession(true);
//		
//		res = session.selectList(namespace + "cultural", user_no);
//		
//		session.close();
//		
//		return res;
//	}
//	
//	public List<MyPageDto> utility(int user_no){
//		List<MyPageDto> res = new ArrayList<>();
//		
//		SqlSession session = getSqlSessionFactory().openSession(true);
//		
//		res = session.selectList(namespace + "utility", user_no);
//		
//		session.close();
//		
//		return res;
//	}
//	
//	public List<MyPageDto> leisure(int user_no){
//		List<MyPageDto> res = new ArrayList<>();
//		
//		SqlSession session = getSqlSessionFactory().openSession(true);
//		
//		res = session.selectList(namespace + "leisure", user_no);
//		
//		session.close();
//		
//		return res;
//	}
	
	
	public sum_dto traffic(int user_no){
		sum_dto res = null;
		
		SqlSession session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace2 + "traffic", user_no);
		
		session.close();
		
		return res;
	}
	
	public sum_dto food(int user_no){
		sum_dto res = null;
		
		SqlSession session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace2 + "food", user_no);
		
		session.close();
		
		return res;
	}
	
	public sum_dto cultural(int user_no){
		sum_dto res = null;
		
		SqlSession session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace2 + "cultural", user_no);
		
		session.close();
		
		return res;
	}
	
	public sum_dto utility(int user_no){
		sum_dto res = null;
		
		SqlSession session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace2 + "utility", user_no);
		
		session.close();
		
		return res;
	}
	
	public sum_dto pleasure(int user_no){
		sum_dto res = null;
		
		SqlSession session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace2 + "pleasure", user_no);
		
		session.close();
		
		return res;
	}




}
