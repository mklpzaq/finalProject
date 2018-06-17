package kr.or.nationRental.returnGoodsfacilityInfo.service;

public class ReturnGoodsfacilityInfoDto {
	private int returGoodsfacilityInfoCode;
	private int goodsfacilityRentalCode;
	private int goodsfacilityCode;
	private String classifyGoodsfacility;
	private String citizenId;
	private String isRequestedToReturnAsDelivery;
	private int overdueDays;
	private int adminagencyCode;
	private String functionaryId;
	private int stateGoodsCode;
	private String stateGoods;
	private String dateReturnCheck;
	
	public int getReturGoodsfacilityInfoCode() {
		return returGoodsfacilityInfoCode;
	}
	public void setReturGoodsfacilityInfoCode(int returGoodsfacilityInfoCode) {
		this.returGoodsfacilityInfoCode = returGoodsfacilityInfoCode;
	}
	public int getGoodsfacilityRentalCode() {
		return goodsfacilityRentalCode;
	}
	public void setGoodsfacilityRentalCode(int goodsfacilityRentalCode) {
		this.goodsfacilityRentalCode = goodsfacilityRentalCode;
	}
	public int getGoodsfacilityCode() {
		return goodsfacilityCode;
	}
	public void setGoodsfacilityCode(int goodsfacilityCode) {
		this.goodsfacilityCode = goodsfacilityCode;
	}
	public String getClassifyGoodsfacility() {
		return classifyGoodsfacility;
	}
	public void setClassifyGoodsfacility(String classifyGoodsfacility) {
		this.classifyGoodsfacility = classifyGoodsfacility;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	public String getIsRequestedToReturnAsDelivery() {
		return isRequestedToReturnAsDelivery;
	}
	public void setIsRequestedToReturnAsDelivery(String isRequestedToReturnAsDelivery) {
		this.isRequestedToReturnAsDelivery = isRequestedToReturnAsDelivery;
	}
	public int getOverdueDays() {
		return overdueDays;
	}
	public void setOverdueDays(int overdueDays) {
		this.overdueDays = overdueDays;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public String getFunctionaryId() {
		return functionaryId;
	}
	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
	}
	public int getStateGoodsCode() {
		return stateGoodsCode;
	}
	public void setStateGoodsCode(int stateGoodsCode) {
		this.stateGoodsCode = stateGoodsCode;
	}
	public String getStateGoods() {
		return stateGoods;
	}
	public void setStateGoods(String stateGoods) {
		this.stateGoods = stateGoods;
	}
	public String getDateReturnCheck() {
		return dateReturnCheck;
	}
	public void setDateReturnCheck(String dateReturnCheck) {
		this.dateReturnCheck = dateReturnCheck;
	}
	@Override
	public String toString() {
		return "ReturnGoodsfacilityInfoDto [returGoodsfacilityInfoCode=" + returGoodsfacilityInfoCode
				+ ", goodsfacilityRentalCode=" + goodsfacilityRentalCode + ", goodsfacilityCode=" + goodsfacilityCode
				+ ", classifyGoodsfacility=" + classifyGoodsfacility + ", citizenId=" + citizenId
				+ ", isRequestedToReturnAsDelivery=" + isRequestedToReturnAsDelivery + ", overdueDays=" + overdueDays
				+ ", adminagencyCode=" + adminagencyCode + ", functionaryId=" + functionaryId + ", stateGoodsCode="
				+ stateGoodsCode + ", stateGoods=" + stateGoods + ", dateReturnCheck=" + dateReturnCheck + "]";
	}
}
