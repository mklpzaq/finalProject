package kr.or.nationRental.annualfeePakage.service;

import java.sql.Date;
import java.util.List;

public class AnnualfeePakageDto {
	private int annualfeePakageCode; //연회비패키지코드
	private String functionaryId;	//등록자ID
	private String annualfeePakageName; //연회비/패키지명
	private int annualfeePakagePrice; //연회비/패키지가격
	private String annualfeePakageTextSangse; //연회비/패키지상세
	private int annualfeePakageDiscountRate; //연회비/패키지할인률
	private Date annualfeePakageDateRegistration; //연회비/패키지등록날짜
	private List<Integer> adminagencyCode; //행정기관코드
	private List<AnnualfeePakageAuthorityDto> annualfeePakageAuthority; //연회비패키지권한범위클래스
	private String citizenId; //구입자 id
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
	public List<Integer> getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(List<Integer> adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public List<AnnualfeePakageAuthorityDto> getAnnualfeePakageAuthority() {
		return annualfeePakageAuthority;
	}
	public void setAnnualfeePakageAuthority(List<AnnualfeePakageAuthorityDto> annualfeePakageAuthority) {
		this.annualfeePakageAuthority = annualfeePakageAuthority;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	@Override
	public String toString() {
		return "AnnualfeePakageDto [annualfeePakageCode=" + annualfeePakageCode + ", functionaryId=" + functionaryId
				+ ", annualfeePakageName=" + annualfeePakageName + ", annualfeePakagePrice=" + annualfeePakagePrice
				+ ", annualfeePakageTextSangse=" + annualfeePakageTextSangse + ", annualfeePakageDiscountRate="
				+ annualfeePakageDiscountRate + ", annualfeePakageDateRegistration=" + annualfeePakageDateRegistration
				+ ", adminagencyCode=" + adminagencyCode + ", annualfeePakageAuthority=" + annualfeePakageAuthority
				+ ", citizenId=" + citizenId + "]";
	}
	
	
}
