package kr.or.nationRental.rentGoodsFacility.service;

import java.sql.Date;

public class RentGoodsfacilityDto {
	private int goodsfacilityRentalCode;
	private int adminagencyCode;
	private int goodsfacilityCode;
	private String goodsfacilityName;
	private String citizenId;
	private String citizenName;
	private String citizenPhone;
	private Date goodsfacilityRentalDateStart;
	private Date goodsfacilityRentalDayEnd;
	private String goodsfacilityRentalIsOrderedDelivery;
	private Date goodsfacilityRentalDateRegistration;
	private String goodsfacilityRentalIsCanceled;
	private int goodsfacilityRentalDeposit;
	
	//입력시 필요한 내용
	private int goodsfacilityPriceRental;
	private String goodsfacilityAddressSangse;
	private String adminagencyName;
	public int getGoodsfacilityRentalCode() {
		return goodsfacilityRentalCode;
	}
	public void setGoodsfacilityRentalCode(int goodsfacilityRentalCode) {
		this.goodsfacilityRentalCode = goodsfacilityRentalCode;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public int getGoodsfacilityCode() {
		return goodsfacilityCode;
	}
	public void setGoodsfacilityCode(int goodsfacilityCode) {
		this.goodsfacilityCode = goodsfacilityCode;
	}
	public String getGoodsfacilityName() {
		return goodsfacilityName;
	}
	public void setGoodsfacilityName(String goodsfacilityName) {
		this.goodsfacilityName = goodsfacilityName;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	public String getCitizenName() {
		return citizenName;
	}
	public void setCitizenName(String citizenName) {
		this.citizenName = citizenName;
	}
	public String getCitizenPhone() {
		return citizenPhone;
	}
	public void setCitizenPhone(String citizenPhone) {
		this.citizenPhone = citizenPhone;
	}
	public Date getGoodsfacilityRentalDateStart() {
		return goodsfacilityRentalDateStart;
	}
	public void setGoodsfacilityRentalDateStart(Date goodsfacilityRentalDateStart) {
		this.goodsfacilityRentalDateStart = goodsfacilityRentalDateStart;
	}
	public Date getGoodsfacilityRentalDayEnd() {
		return goodsfacilityRentalDayEnd;
	}
	public void setGoodsfacilityRentalDayEnd(Date goodsfacilityRentalDayEnd) {
		this.goodsfacilityRentalDayEnd = goodsfacilityRentalDayEnd;
	}
	public String getGoodsfacilityRentalIsOrderedDelivery() {
		return goodsfacilityRentalIsOrderedDelivery;
	}
	public void setGoodsfacilityRentalIsOrderedDelivery(String goodsfacilityRentalIsOrderedDelivery) {
		this.goodsfacilityRentalIsOrderedDelivery = goodsfacilityRentalIsOrderedDelivery;
	}
	public Date getGoodsfacilityRentalDateRegistration() {
		return goodsfacilityRentalDateRegistration;
	}
	public void setGoodsfacilityRentalDateRegistration(Date goodsfacilityRentalDateRegistration) {
		this.goodsfacilityRentalDateRegistration = goodsfacilityRentalDateRegistration;
	}
	public String getGoodsfacilityRentalIsCanceled() {
		return goodsfacilityRentalIsCanceled;
	}
	public void setGoodsfacilityRentalIsCanceled(String goodsfacilityRentalIsCanceled) {
		this.goodsfacilityRentalIsCanceled = goodsfacilityRentalIsCanceled;
	}
	public int getGoodsfacilityRentalDeposit() {
		return goodsfacilityRentalDeposit;
	}
	public void setGoodsfacilityRentalDeposit(int goodsfacilityRentalDeposit) {
		this.goodsfacilityRentalDeposit = goodsfacilityRentalDeposit;
	}
	public int getGoodsfacilityPriceRental() {
		return goodsfacilityPriceRental;
	}
	public void setGoodsfacilityPriceRental(int goodsfacilityPriceRental) {
		this.goodsfacilityPriceRental = goodsfacilityPriceRental;
	}
	public String getGoodsfacilityAddressSangse() {
		return goodsfacilityAddressSangse;
	}
	public void setGoodsfacilityAddressSangse(String goodsfacilityAddressSangse) {
		this.goodsfacilityAddressSangse = goodsfacilityAddressSangse;
	}
	public String getAdminagencyName() {
		return adminagencyName;
	}
	public void setAdminagencyName(String adminagencyName) {
		this.adminagencyName = adminagencyName;
	}
	@Override
	public String toString() {
		return "RentGoodsfacilityDto [goodsfacilityRentalCode=" + goodsfacilityRentalCode + ", adminagencyCode="
				+ adminagencyCode + ", goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityName="
				+ goodsfacilityName + ", citizenId=" + citizenId + ", citizenName=" + citizenName + ", citizenPhone="
				+ citizenPhone + ", goodsfacilityRentalDateStart=" + goodsfacilityRentalDateStart
				+ ", goodsfacilityRentalDayEnd=" + goodsfacilityRentalDayEnd + ", goodsfacilityRentalIsOrderedDelivery="
				+ goodsfacilityRentalIsOrderedDelivery + ", goodsfacilityRentalDateRegistration="
				+ goodsfacilityRentalDateRegistration + ", goodsfacilityRentalIsCanceled="
				+ goodsfacilityRentalIsCanceled + ", goodsfacilityRentalDeposit=" + goodsfacilityRentalDeposit
				+ ", goodsfacilityPriceRental=" + goodsfacilityPriceRental + ", goodsfacilityAddressSangse="
				+ goodsfacilityAddressSangse + ", adminagencyName=" + adminagencyName + "]";
	} 
	
	
	
}
