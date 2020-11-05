package com.api.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;

public class ApiDao extends JDBCTemplate{
	
//	public int insert(List<ApiDto> dtos) {
//		
//		Connection con = getConnection();
//		PreparedStatement pstm = null;
//		int res = 0;
//		String sql = "INSERT INTO MARKET_BOARD VALUES(?,?,?,?,?,?)";
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			
//			int cnt = 0;
//			for(int i=0;i<dtos.size();i++) {
//				ApiDto dto = dtos.get(i);
//				pstm.setString(1, dto.getM_name());
//				pstm.setString(2, dto.getM_code());
//				pstm.setString(3, dto.getGuname());
//				pstm.setString(4, dto.getM_addr());
//				pstm.setDouble(5, dto.getLng());
//				pstm.setDouble(6, dto.getLat());
//				pstm.addBatch();
//				cnt++;
//				
//			}
//			
//		
//		System.out.println("03.query 준비 : "+sql+"(총"+cnt+"개)");
//		int[] result = pstm.executeBatch();
//		System.out.println("04.query 실행 및 리턴");
//		
//		for(int i=0;i<result.length; i++) {
//			if(result[i]==-2) {
//				res++;
//			}
//		}
//		if(res == dtos.size()) {
//			commit(con);
//		}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstm);
//			close(con);
//		}
//		
//		
//		return res;
//	}
//	
//public int delete() {
//		
//		Connection con = getConnection();
//		PreparedStatement pstm = null;
//		
//		int res = 0;
//		
//		String sql = "DELETE FROM MARKET_BOARD";
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			
//			res = pstm.executeUpdate();
//			
//			if(res>0){
//				commit(con);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstm);
//			close(con);
//		}
//		
//		return res;
//	}
	
	public List<ApiDto> selectAll(String search){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<ApiDto> res = new ArrayList<>();
		
		String sql = "SELECT * FROM MARKET_BOARD WHERE M_NAME LIKE '%'||?||'%'"
				+ "OR GUNAME LIKE '%'||?||'%' OR M_ADDR LIKE '%'||?||'%'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, search);
			pstm.setString(2, search);
			pstm.setString(3, search);
			
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				ApiDto dto = new ApiDto();
				dto.setM_name(rs.getString(1));
				dto.setM_code(rs.getString(2));
				dto.setGuname(rs.getString(3));
				dto.setM_addr(rs.getString(4));
				dto.setLng(rs.getDouble(5));
				dto.setLat(rs.getDouble(6));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
