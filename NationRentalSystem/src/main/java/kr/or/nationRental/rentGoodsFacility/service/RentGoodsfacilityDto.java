package kr.or.nationRental.rentGoodsFacility.service;

import java.sql.Date;

public class RentGoodsfacilityDto {
	private int goodsfacilityRentalCode;
	private int adminagencyCode;
	private int goodsfacilityCode;
	private String goodsfacilityName;
	private String citizenId;
	private String citizenName;
	private String citizen_phone;
	private Date goodsfacilityRentalDateStart;
	private Date goodsfacilityRentalDayEnd;
	private String goodsfacilityRentalIsOrderedDelivery;
	private Date goodsfacilityRentalDateRegistration;
	private String goodsfacilityRentalIsCanceled;
	private int goodsfacilityRentalDeposit;
	
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
	public String getCitizen_phone() {
		return citizen_phone;
	}
	public void setCitizen_phone(String citizen_phone) {
		this.citizen_phone = citizen_phone;
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
	@Override
	public String toString() {
		return "RentGoodsfacilityDto [goodsfacilityRentalCode=" + goodsfacilityRentalCode + ", adminagencyCode="
				+ adminagencyCode + ", goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityName="
				+ goodsfacilityName + ", citizenId=" + citizenId + ", citizenName=" + citizenName + ", citizen_phone="
				+ citizen_phone + ", goodsfacilityRentalDateStart=" + goodsfacilityRentalDateStart
				+ ", goodsfacilityRentalDayEnd=" + goodsfacilityRentalDayEnd + ", goodsfacilityRentalIsOrderedDelivery="
				+ goodsfacilityRentalIsOrderedDelivery + ", goodsfacilityRentalDateRegistration="
				+ goodsfacilityRentalDateRegistration + ", goodsfacilityRentalIsCanceled="
				+ goodsfacilityRentalIsCanceled + ", goodsfacilityRentalDeposit=" + goodsfacilityRentalDeposit + "]";
	}
	
}
