package kr.or.nationRental.agencyEmployee.service;

import java.sql.Date;

public class AgencyEmployeeDto {
	private String agencyEmployeeId; //낙찰된 대행업체 직원 id
	private String agencyEmployeePw; //직원 패스워드
	private int agencyEmployeeInjeungNum; //낙찰된 대행업체 인증코드	
	private String agencyName; //대행업체명
	private String agencyEmployeeName; //직원 이름
	private String agencyEmployeePhone; //직원 전화번호
	private String agencyEmployeeEmail; //직원 이메일
	private Date agencyEmployeeDateJoin; //직원 가입일자
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}
	public String getAgencyEmployeePw() {
		return agencyEmployeePw;
	}
	public void setAgencyEmployeePw(String agencyEmployeePw) {
		this.agencyEmployeePw = agencyEmployeePw;
	}
	public int getAgencyEmployeeInjeungNum() {
		return agencyEmployeeInjeungNum;
	}
	public void setAgencyEmployeeInjeungNum(int agencyEmployeeInjeungNum) {
		this.agencyEmployeeInjeungNum = agencyEmployeeInjeungNum;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getAgencyEmployeeName() {
		return agencyEmployeeName;
	}
	public void setAgencyEmployeeName(String agencyEmployeeName) {
		this.agencyEmployeeName = agencyEmployeeName;
	}
	public String getAgencyEmployeePhone() {
		return agencyEmployeePhone;
	}
	public void setAgencyEmployeePhone(String agencyEmployeePhone) {
		this.agencyEmployeePhone = agencyEmployeePhone;
	}
	public String getAgencyEmployeeEmail() {
		return agencyEmployeeEmail;
	}
	public void setAgencyEmployeeEmail(String agencyEmployeeEmail) {
		this.agencyEmployeeEmail = agencyEmployeeEmail;
	}
	public Date getAgencyEmployeeDateJoin() {
		return agencyEmployeeDateJoin;
	}
	public void setAgencyEmployeeDateJoin(Date agencyEmployeeDateJoin) {
		this.agencyEmployeeDateJoin = agencyEmployeeDateJoin;
	}
	@Override
	public String toString() {
		return "AgencyEmployeeDto [agencyEmployeeId=" + agencyEmployeeId + ", agencyEmployeePw=" + agencyEmployeePw
				+ ", agencyEmployeeInjeungNum=" + agencyEmployeeInjeungNum + ", agencyName=" + agencyName
				+ ", agencyEmployeeName=" + agencyEmployeeName + ", agencyEmployeePhone=" + agencyEmployeePhone
				+ ", agencyEmployeeEmail=" + agencyEmployeeEmail + ", agencyEmployeeDateJoin=" + agencyEmployeeDateJoin
				+ "]";
	}
	
	
}
