package com.kind.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kind.model.KindDto;


import common.JDBCTemplate;

public class KindDao extends JDBCTemplate {
public List<KindDto> selectAll(String search){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<KindDto> res = new ArrayList<>();
		
		String sql = "SELECT * FROM KIND_BOARD WHERE SH_ADDR LIKE '%'||?||'%'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, search);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				KindDto dto = new KindDto();
				dto.setSh_id(rs.getString(1));
				dto.setSh_name(rs.getString(2));
				dto.setSh_addr(rs.getString(3));
				dto.setSh_way(rs.getString(4));
				dto.setSh_phone(rs.getString(5));
				dto.setSh_info(rs.getString(6));
				dto.setSh_pride(rs.getString(7));
				dto.setSh_photo(rs.getString(8));
				dto.setSh_rcmn(rs.getString(9));
				dto.setInduty_code_se(rs.getString(10));
				dto.setInduty_code_se_name(rs.getString(11));
				dto.setBase_ym(rs.getString(12));
								
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


	public KindDto selectOne(String sh_id) {
	
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
		
			KindDto res = new KindDto();
			
			String sql = "SELECT * FROM KIND_BOARD WHERE SH_ID=?";
		
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, sh_id);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					res.setSh_id(rs.getString(1));
					res.setSh_name(rs.getString(2));
					res.setSh_addr(rs.getString(3));
					res.setSh_way(rs.getString(4));
					res.setSh_phone(rs.getString(5));
					res.setSh_info(rs.getString(6));
					res.setSh_pride(rs.getString(7));
					res.setSh_photo(rs.getString(8));
					res.setSh_rcmn(rs.getString(9));
					res.setInduty_code_se(rs.getString(10));
					res.setInduty_code_se_name(rs.getString(11));
					res.setBase_ym(rs.getString(12));
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
