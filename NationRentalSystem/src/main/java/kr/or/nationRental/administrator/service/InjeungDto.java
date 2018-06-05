package kr.or.nationRental.administrator.service;

public class InjeungDto {
	private int adminInjeungNum; //관리자 가입 인증번호
	
	public int getAdminInjeungNum() {
		return adminInjeungNum;
	}
	public void setAdminInjeungNum(int adminInjeungNum) {
		this.adminInjeungNum = adminInjeungNum;
	}
	
	@Override
	public String toString() {
		return "InjeungDto [adminInjeungNum=" + adminInjeungNum + "]";
	}
	
	
}
