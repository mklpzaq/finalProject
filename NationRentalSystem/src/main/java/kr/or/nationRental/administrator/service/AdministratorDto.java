package kr.or.nationRental.administrator.service;
import java.sql.Date;

public class AdministratorDto {
	private String administratorId;  //관리자 ID
	private String administratorPw; //관리자 PW
	private int functionaryNum; //공무원번호
	private int administratorPhone; //관리자 전화번호
	private String administratorName; //관리자명
	private Date administratorDateJoin; //가입일자
	public String getAdministratorId() {
		return administratorId;
	}
	public void setAdministratorId(String administratorId) {
		this.administratorId = administratorId;
	}
	public String getAdministratorPw() {
		return administratorPw;
	}
	public void setAdministratorPw(String administratorPw) {
		this.administratorPw = administratorPw;
	}
	public int getFunctionaryNum() {
		return functionaryNum;
	}
	public void setFunctionaryNum(int functionaryNum) {
		this.functionaryNum = functionaryNum;
	}
	public int getAdministratorPhone() {
		return administratorPhone;
	}
	public void setAdministratorPhone(int administratorPhone) {
		this.administratorPhone = administratorPhone;
	}
	public String getAdministratorName() {
		return administratorName;
	}
	public void setAdministratorName(String administratorName) {
		this.administratorName = administratorName;
	}
	public Date getAdministratorDateJoin() {
		return administratorDateJoin;
	}
	public void setAdministratorDateJoin(Date administratorDateJoin) {
		this.administratorDateJoin = administratorDateJoin;
	}
	@Override
	public String toString() {
		return "administratorDto [administratorId=" + administratorId + ", administratorPw=" + administratorPw
				+ ", functionaryNum=" + functionaryNum + ", administratorPhone=" + administratorPhone
				+ ", administratorName=" + administratorName + ", administratorDateJoin=" + administratorDateJoin + "]";
	}
	
	
}
