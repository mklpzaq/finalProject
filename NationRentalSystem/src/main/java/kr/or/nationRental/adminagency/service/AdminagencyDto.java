package kr.or.nationRental.adminagency.service;

import java.sql.Date;

public class AdminagencyDto {
	private int adminagencyCode; //adminagency_code
	private String adminagencyName; //adminagency_name
	private String sidoName; //sido_name
	private String sigunguName; //sigungu_name
	private String eupmyeonName; //eupmyeon_name
	private String adminagencyAddressSangse; //adminagency_address_sangse
	private String adminagencyIsRentalBan; //adminagency_is_rental_ban
	private Date adminagencyDateRegistration; //adminagency_date_registration
	
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public String getAdminagencyName() {
		return adminagencyName;
	}
	public void setAdminagencyName(String adminagencyName) {
		this.adminagencyName = adminagencyName;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public String getEupmyeonName() {
		return eupmyeonName;
	}
	public void setEupmyeonName(String eupmyeonName) {
		this.eupmyeonName = eupmyeonName;
	}
	public String getAdminagencyAddressSangse() {
		return adminagencyAddressSangse;
	}
	public void setAdminagencyAddressSangse(String adminagencyAddressSangse) {
		this.adminagencyAddressSangse = adminagencyAddressSangse;
	}
	public String getAdminagencyIsRentalBan() {
		return adminagencyIsRentalBan;
	}
	public void setAdminagencyIsRentalBan(String adminagencyIsRentalBan) {
		this.adminagencyIsRentalBan = adminagencyIsRentalBan;
	}
	public Date getAdminagencyDateRegistration() {
		return adminagencyDateRegistration;
	}
	public void setAdminagencyDateRegistration(Date adminagencyDateRegistration) {
		this.adminagencyDateRegistration = adminagencyDateRegistration;
	}
	
	@Override
	public String toString() {
		return "AdminagencyDto [adminagencyCode=" + adminagencyCode + ", adminagencyName=" + adminagencyName
				+ ", sidoName=" + sidoName + ", sigunguName=" + sigunguName + ", eupmyeonName=" + eupmyeonName
				+ ", adminagencyAddressSangse=" + adminagencyAddressSangse + ", adminagencyIsRentalBan="
				+ adminagencyIsRentalBan + ", adminagencyDateRegistration=" + adminagencyDateRegistration + "]";
	}
	
	
}
