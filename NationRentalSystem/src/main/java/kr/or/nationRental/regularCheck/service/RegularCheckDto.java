package kr.or.nationRental.regularCheck.service;

public class RegularCheckDto {
	private int regularCheckCode;
	private int adminagencyCode;
	private int goodsfacilityCode;
	private String goodsfacilityName;
	private String textRegularCheck;
	private String functionaryId;
	private int stateGoodsCode;
	private String dateRegularCheckGoodsfacility;
	
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
	public String getTextRegularCheck() {
		return textRegularCheck;
	}
	public void setTextRegularCheck(String textRegularCheck) {
		this.textRegularCheck = textRegularCheck;
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
	public String getDateRegularCheckGoodsfacility() {
		return dateRegularCheckGoodsfacility;
	}
	public void setDateRegularCheckGoodsfacility(String dateRegularCheckGoodsfacility) {
		this.dateRegularCheckGoodsfacility = dateRegularCheckGoodsfacility;
	}
	@Override
	public String toString() {
		return "RegularCheckDto [regularCheckCode=" + regularCheckCode + ", adminagencyCode=" + adminagencyCode
				+ ", goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityName=" + goodsfacilityName
				+ ", textRegularCheck=" + textRegularCheck + ", functionaryId=" + functionaryId + ", stateGoodsCode="
				+ stateGoodsCode + ", dateRegularCheckGoodsfacility=" + dateRegularCheckGoodsfacility + "]";
	}
}
