package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dto.UserDto;

import static common.JDBCTemplate.*;

public class UserDao extends SqlMapConfig{
	
	private String namespace = "com.controller.";
	
	public UserDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		UserDto res = new UserDto();
		
		String sql = "SELECT * FROM BG_USER WHERE USER_ID=? AND USER_PW=? AND USER_ENABLED=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03. query 준비");
			rs = pstm.executeQuery();
			System.out.println("04. query 실행");
			while(rs.next()) {
				res.setUser_no(rs.getInt(1));
				res.setUser_id(rs.getString(2));
				res.setUser_pw(rs.getString(3));
				res.setUser_name(rs.getString(4));
				res.setUser_gender(rs.getString(5));
				res.setUser_birth(rs.getString(6));
				res.setUser_phone(rs.getString(7));
				res.setUser_email(rs.getString(8));
				res.setUser_grade(rs.getString(9));
				res.setUser_enabled(rs.getString(10));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		
		return res;
	}
	
	public int signup(UserDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"signup", dto);
			
			if(res>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return res;
	}
	
	public boolean idChk(String user_id) {
		SqlSession session = null;
		UserDto udto = null;
		boolean res = true;
		
		try {
			session = getSqlSessionFactory().openSession();
			udto = session.selectOne(namespace+"idChk", user_id);
			
			if( udto != null) {
				res = false;
			}else {
				System.out.println(user_id +"로 아이디 생성가능");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public List<UserDto> selectAll(){
		SqlSession session = null;
		List<UserDto> res = new ArrayList<>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectList(namespace+"selectall");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public UserDto selectOne(int user_no) {
		SqlSession session = null;
		UserDto udto = new UserDto();
		
		try {
			session = getSqlSessionFactory().openSession();
			udto = session.selectOne(namespace+"selectone", user_no);			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		
		return udto;
	}
	
	public int updateRole(int userno,String usergrade) {		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE BG_USER SET USER_GRADE=? WHERE USER_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, usergrade);
			pstm.setInt(2, userno);			
			
			res = pstm.executeUpdate();
			
			if(res>0){
				commit(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	public int myinfoupdate(UserDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = "UPDATE BG_USER SET USER_PW=?,USER_PHONE=?,USER_EMAIL=? WHERE USER_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUser_pw());
			pstm.setString(2, dto.getUser_phone());
			pstm.setString(3, dto.getUser_email());
			pstm.setInt(4, dto.getUser_no());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}

	public int secession(UserDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		
		String sql = " UPDATE BG_USER SET USER_ENABLED=? WHERE USER_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUser_enabled());
			pstm.setInt(2, dto.getUser_no());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return res;
	}
}
