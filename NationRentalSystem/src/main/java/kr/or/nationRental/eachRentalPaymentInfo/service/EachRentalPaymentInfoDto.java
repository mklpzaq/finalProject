package kr.or.nationRental.eachRentalPaymentInfo.service;

public class EachRentalPaymentInfoDto {
	private int eachRentalPaymentInfoCode;
	private int totalRentalPaymentInfoCode;
	private int goodsfacilityRentalCode;
	private String citezenId;
	private int adminagencyCode;
	private int goodsfacilityCode;
	private String isUsedAnnualfee;
	private int rentalPaymentAppliedAnnualfee;
	
	public int getEachRentalPaymentInfoCode() {
		return eachRentalPaymentInfoCode;
	}
	public void setEachRentalPaymentInfoCode(int eachRentalPaymentInfoCode) {
		this.eachRentalPaymentInfoCode = eachRentalPaymentInfoCode;
	}
	public int getTotalRentalPaymentInfoCode() {
		return totalRentalPaymentInfoCode;
	}
	public void setTotalRentalPaymentInfoCode(int totalRentalPaymentInfoCode) {
		this.totalRentalPaymentInfoCode = totalRentalPaymentInfoCode;
	}
	public int getGoodsfacilityRentalCode() {
		return goodsfacilityRentalCode;
	}
	public void setGoodsfacilityRentalCode(int goodsfacilityRentalCode) {
		this.goodsfacilityRentalCode = goodsfacilityRentalCode;
	}
	public String getCitezenId() {
		return citezenId;
	}
	public void setCitezenId(String citezenId) {
		this.citezenId = citezenId;
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
	public String getIsUsedAnnualfee() {
		return isUsedAnnualfee;
	}
	public void setIsUsedAnnualfee(String isUsedAnnualfee) {
		this.isUsedAnnualfee = isUsedAnnualfee;
	}
	public int getRentalPaymentAppliedAnnualfee() {
		return rentalPaymentAppliedAnnualfee;
	}
	public void setRentalPaymentAppliedAnnualfee(int rentalPaymentAppliedAnnualfee) {
		this.rentalPaymentAppliedAnnualfee = rentalPaymentAppliedAnnualfee;
	}
	
	@Override
	public String toString() {
		return "EachRentalPaymentInfoDto [eachRentalPaymentInfoCode=" + eachRentalPaymentInfoCode
				+ ", totalRentalPaymentInfoCode=" + totalRentalPaymentInfoCode + ", goodsfacilityRentalCode="
				+ goodsfacilityRentalCode + ", citezenId=" + citezenId + ", adminagencyCode=" + adminagencyCode
				+ ", goodsfacilityCode=" + goodsfacilityCode + ", isUsedAnnualfee=" + isUsedAnnualfee
				+ ", rentalPaymentAppliedAnnualfee=" + rentalPaymentAppliedAnnualfee + "]";
	}
	
	
}
