package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.BoardDto;
import static common.JDBCTemplate.*;

public class BoardDao extends SqlConfig{
	private String namespace="com.my.board.";

	public List<BoardDto> selectAll() {		
		List<BoardDto> res = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
		session=getSqlSessionFactory().openSession(false);
		
		res=session.selectList(namespace+"TselectAll");
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public List<BoardDto> selectAll2() {		
		List<BoardDto> res = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
		session=getSqlSessionFactory().openSession(false);
		
		res=session.selectList(namespace+"EselectAll");
		
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
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			session.close();
		}
		
		return res;
	}

	public int updateView(int seq) {
		SqlSession session = null;
		int res = 0;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			
			res = session.update(namespace+"updateView",seq);
			
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

	public int boardInsert(BoardDto insert) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"boardInsert",insert);
			
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

	public int boardDelete(BoardDto deleteDto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"boardDelete",deleteDto);
			
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

	public int boardUpdate(BoardDto updateDto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"boardUpdate", updateDto);
			
			if(res>0) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}	
	
	public List<BoardDto> selectBoardList(Connection conn, int cPage, int numPerPage) {
		List<BoardDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( SELECT * FROM BG_BOARD WHERE BOARD_TYPE = 'T' ORDER BY BOARD_REGDATE DESC) V ) V WHERE RNUM BETWEEN ? AND ? ";
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				BoardDto b = new BoardDto();
				//컬럼명은 대소문자 구분이 없다.
				b.setSeq(rset.getInt(2));
				b.setWriter(rset.getString(3));
				b.setTitle(rset.getString(4));
				b.setContent(rset.getString(5));
				b.setRegdate(rset.getString(6));
				b.setView(rset.getInt(7));
				b.setType(rset.getString(8));
				b.setUserno(rset.getInt(9));
				b.setFilename(rset.getString(10));
				b.setRefilename(rset.getString(11));
				list.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = " SELECT COUNT(*) AS \"cnt\" FROM BG_BOARD WHERE BOARD_TYPE = 'T' "; 
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalMember = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalMember;
	}
	
	public List<BoardDto> selectBoardListF(Connection conn, int cPage, int numPerPage) {
		List<BoardDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( SELECT * FROM BG_BOARD WHERE BOARD_TYPE = 'F' ORDER BY BOARD_REGDATE DESC) V ) V WHERE RNUM BETWEEN ? AND ? ";
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				BoardDto b = new BoardDto();
				//컬럼명은 대소문자 구분이 없다.
				b.setSeq(rset.getInt(2));
				b.setWriter(rset.getString(3));
				b.setTitle(rset.getString(4));
				b.setContent(rset.getString(5));
				b.setRegdate(rset.getString(6));
				b.setView(rset.getInt(7));
				b.setType(rset.getString(8));
				b.setUserno(rset.getInt(9));
				b.setFilename(rset.getString(10));
				b.setRefilename(rset.getString(11));
				list.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCountF(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = " SELECT COUNT(*) AS \"cnt\" FROM BG_BOARD WHERE BOARD_TYPE = 'F' "; 
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalMember = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalMember;
	}
	
	public List<BoardDto> selectBoardListE(Connection conn, int cPage, int numPerPage) {
		List<BoardDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = " SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( SELECT * FROM BG_BOARD WHERE BOARD_TYPE = 'E' ORDER BY BOARD_REGDATE DESC) V ) V WHERE RNUM BETWEEN ? AND ? ";
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//시작 rownum과 마지막 rownum 구하는 공식
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				BoardDto b = new BoardDto();
				//컬럼명은 대소문자 구분이 없다.
				b.setSeq(rset.getInt(2));
				b.setWriter(rset.getString(3));
				b.setTitle(rset.getString(4));
				b.setContent(rset.getString(5));
				b.setRegdate(rset.getString(6));
				b.setView(rset.getInt(7));
				b.setType(rset.getString(8));
				b.setUserno(rset.getInt(9));
				b.setFilename(rset.getString(10));
				b.setRefilename(rset.getString(11));
				list.add(b);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCountE(Connection conn) {
		PreparedStatement pstmt = null;
		int totalMember = 0;
		ResultSet rset = null;
		String query = " SELECT COUNT(*) AS \"cnt\" FROM BG_BOARD WHERE BOARD_TYPE = 'E' "; 
		
		try{
			//미완성쿼리문을 가지고 객체생성. 
			pstmt = conn.prepareStatement(query);
			
			//쿼리문실행
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalMember = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalMember;
	}
}
