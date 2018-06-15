package kr.or.nationRental.unitedAfterserviceRequest.service;

public class UnitedAfterserviceRequestDto {
	private int unitedAfterserviceRequestCode;
	private int returnGoodsfacilityInfoCode;
	private int regularCheckCode;
	private int adminagencyCode;
	private int goodsfacilityThreeCode;
	private int goodsfacilityCode;
	private String goodsfacilityName;
	private String functionaryId;
	private int stateGoodsCode;
	private String textCheckResultGoodsfacility;
	private int agencyCode;
	
	public int getUnitedAfterserviceRequestCode() {
		return unitedAfterserviceRequestCode;
	}
	public void setUnitedAfterserviceRequestCode(int unitedAfterserviceRequestCode) {
		this.unitedAfterserviceRequestCode = unitedAfterserviceRequestCode;
	}
	public int getReturnGoodsfacilityInfoCode() {
		return returnGoodsfacilityInfoCode;
	}
	public void setReturnGoodsfacilityInfoCode(int returnGoodsfacilityInfoCode) {
		this.returnGoodsfacilityInfoCode = returnGoodsfacilityInfoCode;
	}
	public int getRegularCheckCode() {
		return regularCheckCode;
	}
	public void setRegularCheckCode(int regularCheckCode) {
		this.regularCheckCode = regularCheckCode;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public int getGoodsfacilityThreeCode() {
		return goodsfacilityThreeCode;
	}
	public void setGoodsfacilityThreeCode(int goodsfacilityThreeCode) {
		this.goodsfacilityThreeCode = goodsfacilityThreeCode;
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
	public String getTextCheckResultGoodsfacility() {
		return textCheckResultGoodsfacility;
	}
	public void setTextCheckResultGoodsfacility(String textCheckResultGoodsfacility) {
		this.textCheckResultGoodsfacility = textCheckResultGoodsfacility;
	}
	public int getAgencyCode() {
		return agencyCode;
	}
	public void setAgencyCode(int agencyCode) {
		this.agencyCode = agencyCode;
	}
	@Override
	public String toString() {
		return "UnitedAfterserviceRequestDto [unitedAfterserviceRequestCode=" + unitedAfterserviceRequestCode
				+ ", returnGoodsfacilityInfoCode=" + returnGoodsfacilityInfoCode + ", regularCheckCode="
				+ regularCheckCode + ", adminagencyCode=" + adminagencyCode + ", goodsfacilityThreeCode="
				+ goodsfacilityThreeCode + ", goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityName="
				+ goodsfacilityName + ", functionaryId=" + functionaryId + ", stateGoodsCode=" + stateGoodsCode
				+ ", textCheckResultGoodsfacility=" + textCheckResultGoodsfacility + ", agencyCode=" + agencyCode + "]";
	}
}