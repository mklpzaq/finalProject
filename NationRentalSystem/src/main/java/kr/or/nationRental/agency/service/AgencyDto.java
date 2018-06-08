package kr.or.nationRental.agency.service;

import java.sql.Date;

public class AgencyDto {

	private int agencyCod; //대행업체 낙찰번호
	private int adminagencyCode; //행정기관코드
	private String functionaryName; //등록 공무원명
	private String agencyName; //대행업체명
	private int agencyBusinesstypeCode; //대행업체 업종분류 코드
	private Date agencyDateRegistration; //대행업체 낙찰등록시기
	private Date agencyDateContractClosed; //대행업체 계약해지일
	public int getAgencyCod() {
		return agencyCod;
	}
	public void setAgencyCod(int agencyCod) {
		this.agencyCod = agencyCod;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public int getAgencyBusinesstypeCode() {
		return agencyBusinesstypeCode;
	}
	public void setAgencyBusinesstypeCode(int agencyBusinesstypeCode) {
		this.agencyBusinesstypeCode = agencyBusinesstypeCode;
	}
	public Date getAgencyDateRegistration() {
		return agencyDateRegistration;
	}
	public void setAgencyDateRegistration(Date agencyDateRegistration) {
		this.agencyDateRegistration = agencyDateRegistration;
	}
	public Date getAgencyDateContractClosed() {
		return agencyDateContractClosed;
	}
	public void setAgencyDateContractClosed(Date agencyDateContractClosed) {
		this.agencyDateContractClosed = agencyDateContractClosed;
	}
	@Override
	public String toString() {
		return "AgencyDto [agencyCod=" + agencyCod + ", adminagencyCode=" + adminagencyCode + ", functionaryName="
				+ functionaryName + ", agencyName=" + agencyName + ", agencyBusinesstypeCode=" + agencyBusinesstypeCode
				+ ", agencyDateRegistration=" + agencyDateRegistration + ", agencyDateContractClosed="
				+ agencyDateContractClosed + "]";
	}
	
	
}
