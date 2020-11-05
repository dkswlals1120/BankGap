package com.api.dto;

public class ApiDto {
//	CREATE TABLE MARKET_BOARD(
//			M_NAME VARCHAR2(4000),
//			M_CODE VARCHAR2(4000) PRIMARY KEY,
//			GUNAME VARCHAR2(4000),
//			M_ADDR VARCHAR2(4000),
//			LNG NUMBER,
//			LAT NUMBER
	
	private String m_name;
	private String m_code;
	private String guname;
	private String m_addr;
	private double lng;
	private double lat;
	
	public ApiDto() {}
	
	public ApiDto(String m_name, String m_code, String guname, String m_addr, double lng, double lat) {
		super();
		this.m_name = m_name;
		this.m_code = m_code;
		this.guname = guname;
		this.m_addr = m_addr;
		this.lng = lng;
		this.lat = lat;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getGuname() {
		return guname;
	}

	public void setGuname(String guname) {
		this.guname = guname;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}
	
	
	
}
