package com.kind.model;

public class KindDto {
	private String sh_id;
	private String sh_name;
	private String sh_addr;
	private String sh_way;
	private String sh_phone;
	private String sh_info;
	private String sh_pride;
	private String sh_photo;
	private String sh_rcmn;
	private String induty_code_se;
	private String induty_code_se_name;
	private String base_ym;
	
	public KindDto() {}

	public KindDto(String sh_id, String sh_name, String sh_addr, String sh_way, String sh_phone, String sh_info,
			String sh_pride, String sh_photo, String sh_rcmn, String induty_code_se, String induty_code_se_name,
			String base_ym) {
		super();
		this.sh_id = sh_id;
		this.sh_name = sh_name;
		this.sh_addr = sh_addr;
		this.sh_way = sh_way;
		this.sh_phone = sh_phone;
		this.sh_info = sh_info;
		this.sh_pride = sh_pride;
		this.sh_photo = sh_photo;
		this.sh_rcmn = sh_rcmn;
		this.induty_code_se = induty_code_se;
		this.induty_code_se_name = induty_code_se_name;
		this.base_ym = base_ym;
	}

	public String getSh_id() {
		return sh_id;
	}

	public void setSh_id(String sh_id) {
		this.sh_id = sh_id;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}

	public String getSh_addr() {
		return sh_addr;
	}

	public void setSh_addr(String sh_addr) {
		this.sh_addr = sh_addr;
	}

	public String getSh_way() {
		return sh_way;
	}

	public void setSh_way(String sh_way) {
		this.sh_way = sh_way;
	}

	public String getSh_phone() {
		return sh_phone;
	}

	public void setSh_phone(String sh_phone) {
		this.sh_phone = sh_phone;
	}

	public String getSh_info() {
		return sh_info;
	}

	public void setSh_info(String sh_info) {
		this.sh_info = sh_info;
	}

	public String getSh_pride() {
		return sh_pride;
	}

	public void setSh_pride(String sh_pride) {
		this.sh_pride = sh_pride;
	}

	public String getSh_photo() {
		return sh_photo;
	}

	public void setSh_photo(String sh_photo) {
		this.sh_photo = sh_photo;
	}

	public String getSh_rcmn() {
		return sh_rcmn;
	}

	public void setSh_rcmn(String sh_rcmn) {
		this.sh_rcmn = sh_rcmn;
	}

	public String getInduty_code_se() {
		return induty_code_se;
	}

	public void setInduty_code_se(String induty_code_se) {
		this.induty_code_se = induty_code_se;
	}

	public String getInduty_code_se_name() {
		return induty_code_se_name;
	}

	public void setInduty_code_se_name(String induty_code_se_name) {
		this.induty_code_se_name = induty_code_se_name;
	}

	public String getBase_ym() {
		return base_ym;
	}

	public void setBase_ym(String base_ym) {
		this.base_ym = base_ym;
	}
	
	
}
