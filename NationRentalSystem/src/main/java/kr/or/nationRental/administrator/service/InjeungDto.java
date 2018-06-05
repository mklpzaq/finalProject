package kr.or.nationRental.administrator.service;

public class InjeungDto {
	private int adminInjeungNum; //관리자 가입 인증번호
	private int dateCreateInjeungNum; //생성일자
	
	public int getAdminInjeungNum() {
		return adminInjeungNum;
	}
	public void setAdminInjeungNum(int adminInjeungNum) {
		this.adminInjeungNum = adminInjeungNum;
	}
	public int getDateCreateInjeungNum() {
		return dateCreateInjeungNum;
	}
	public void setDateCreateInjeungNum(int dateCreateInjeungNum) {
		this.dateCreateInjeungNum = dateCreateInjeungNum;
	}
	
	@Override
	public String toString() {
		return "AdministratorInjeungDto [adminInjeungNum=" + adminInjeungNum + ", dateCreateInjeungNum="
				+ dateCreateInjeungNum + "]";
	}
	
	
}
