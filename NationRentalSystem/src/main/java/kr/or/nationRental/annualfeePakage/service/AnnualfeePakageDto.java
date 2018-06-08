package kr.or.nationRental.annualfeePakage.service;

import java.sql.Date;

public class AnnualfeePakageDto {
	private int annualfeePakageCode; //연회비패키지코드
	private String functionaryId;	//등록자ID
	private String annualfeePakageName; //연회비/패키지명
	private int annualfeePakagePrice; //연회비/패키지가격
	private String annualfeePakageTextSangse; //연회비/패키지상세
	private int annualfeePakageDiscountRate; //연회비/패키지할인률
	private Date annualfeePakageDateRegistration; //연회비/패키지등록날짜
	private int annualfeePakageAuthorityCode; //연회비/패키지권한범위코드
	private int adminagencyCode; //행정기관코드
	public int getAnnualfeePakageCode() {
		return annualfeePakageCode;
	}
	public void setAnnualfeePakageCode(int annualfeePakageCode) {
		this.annualfeePakageCode = annualfeePakageCode;
	}
	public String getFunctionaryId() {
		return functionaryId;
	}
	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
	}
	public String getAnnualfeePakageName() {
		return annualfeePakageName;
	}
	public void setAnnualfeePakageName(String annualfeePakageName) {
		this.annualfeePakageName = annualfeePakageName;
	}
	public int getAnnualfeePakagePrice() {
		return annualfeePakagePrice;
	}
	public void setAnnualfeePakagePrice(int annualfeePakagePrice) {
		this.annualfeePakagePrice = annualfeePakagePrice;
	}
	public String getAnnualfeePakageTextSangse() {
		return annualfeePakageTextSangse;
	}
	public void setAnnualfeePakageTextSangse(String annualfeePakageTextSangse) {
		this.annualfeePakageTextSangse = annualfeePakageTextSangse;
	}
	public int getAnnualfeePakageDiscountRate() {
		return annualfeePakageDiscountRate;
	}
	public void setAnnualfeePakageDiscountRate(int annualfeePakageDiscountRate) {
		this.annualfeePakageDiscountRate = annualfeePakageDiscountRate;
	}
	public Date getAnnualfeePakageDateRegistration() {
		return annualfeePakageDateRegistration;
	}
	public void setAnnualfeePakageDateRegistration(Date annualfeePakageDateRegistration) {
		this.annualfeePakageDateRegistration = annualfeePakageDateRegistration;
	}
	public int getAnnualfeePakageAuthorityCode() {
		return annualfeePakageAuthorityCode;
	}
	public void setAnnualfeePakageAuthorityCode(int annualfeePakageAuthorityCode) {
		this.annualfeePakageAuthorityCode = annualfeePakageAuthorityCode;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	@Override
	public String toString() {
		return "annualfeePakageDto [annualfeePakageCode=" + annualfeePakageCode + ", functionaryId=" + functionaryId
				+ ", annualfeePakageName=" + annualfeePakageName + ", annualfeePakagePrice=" + annualfeePakagePrice
				+ ", annualfeePakageTextSangse=" + annualfeePakageTextSangse + ", annualfeePakageDiscountRate="
				+ annualfeePakageDiscountRate + ", annualfeePakageDateRegistration=" + annualfeePakageDateRegistration
				+ ", annualfeePakageAuthorityCode=" + annualfeePakageAuthorityCode + ", adminagencyCode="
				+ adminagencyCode + "]";
	}
	
	
}
