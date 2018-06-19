package kr.or.nationRental.returnGoodsfacilityInfo.service;

import java.util.Date;

public class ReturnGoodsfacilityInfoDto {
	private int returGoodsfacilityInfoCode; //시설/물품 반납 정보 코드
	private int goodsfacilityRentalCode; //시설/물품 대여/예약 신청코드
	private int goodsfacilityCode; //시설/물품 개별관리코드
	private String classifyGoodsfacility; //물품/시설 구분
	private String citizenId; //시민ID
	private String isRequestedToReturnAsDelivery; //배달반납신청 유무
	private Date goodsfacilityRentalDayEnd; //반납예정일
	private int overdueDays; //연체일수
	private int adminagencyCode; //행정기관코드
	private String functionaryId; //공무원ID
	private int stateGoodsCode; //물품상태코드(
	private String stateGoods; //물품상태명
	private String dateReturnCheck; //반납확인일
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
	public Date getGoodsfacilityRentalDayEnd() {
		return goodsfacilityRentalDayEnd;
	}
	public void setGoodsfacilityRentalDayEnd(Date goodsfacilityRentalDayEnd) {
		this.goodsfacilityRentalDayEnd = goodsfacilityRentalDayEnd;
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
				+ ", isRequestedToReturnAsDelivery=" + isRequestedToReturnAsDelivery + ", goodsfacilityRentalDayEnd="
				+ goodsfacilityRentalDayEnd + ", overdueDays=" + overdueDays + ", adminagencyCode=" + adminagencyCode
				+ ", functionaryId=" + functionaryId + ", stateGoodsCode=" + stateGoodsCode + ", stateGoods="
				+ stateGoods + ", dateReturnCheck=" + dateReturnCheck + "]";
	}
	
	
	
	
	
}
