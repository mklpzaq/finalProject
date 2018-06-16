package kr.or.nationRental.annualfeePakage.service;

public class AnnualfeePakageAuthorityDto {

	private int annualfeePakageAuthorityCode; //연회비/패키지권한범위코드
	private int annualfeePakageCode; // 연회비패키지 코드
	private int adminagencyCode; //연회비패키지 적용되는 행정기관코드
	public int getAnnualfeePakageAuthorityCode() {
		return annualfeePakageAuthorityCode;
	}
	public void setAnnualfeePakageAuthorityCode(int annualfeePakageAuthorityCode) {
		this.annualfeePakageAuthorityCode = annualfeePakageAuthorityCode;
	}
	public int getAnnualfeePakageCode() {
		return annualfeePakageCode;
	}
	public void setAnnualfeePakageCode(int annualfeePakageCode) {
		this.annualfeePakageCode = annualfeePakageCode;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	@Override
	public String toString() {
		return "AnnualfeePakageAuthorityDto [annualfeePakageAuthorityCode=" + annualfeePakageAuthorityCode
				+ ", annualfeePakageCode=" + annualfeePakageCode + ", adminagencyCode=" + adminagencyCode + "]";
	}
	
	
	
}
