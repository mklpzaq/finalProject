package kr.or.nationRental.returnGoodsfacilityInfo.service;

import java.sql.Date;

public class ReturnGoodsfacilityInfoDto {
	private int returnGoodsfacilityInfoCode; //시설/물품 반납 정보 코드
	private int goodsfacilityRentalCode; //시설/물품 대여/예약 신청코드
	private int goodsfacilityCode; //시설/물품 개별관리코드
	private String goodsfacilityName; //시설/물품명
	private String classifyGoodsfacility; //물품/시설 구분
	private String memberLevel; //로그인 Id의 권한
	private String citizenId; //시민ID
	private String citizenName; //시민이름
	private String isRequestedToReturnAsDelivery; //배달반납신청 유무
	private Date goodsfacilityRentalDayEnd; //반납예정일
	private int overdueDays; //연체일수
	private int adminagencyCode; //행정기관코드
	private String adminagencyName; //행정기관명
	private String functionaryId; //공무원ID
	private String functionaryName; //공무원이름
	private int stateGoodsCode; //물품상태코드(
	private String stateGoods; //물품상태명
	private String dateReturnCheck; //반납확인일
	private String goodsfacilityStateAfterservice; //물품/시설 AS상태
	private String goodsfacilityThreeName; //물품/시설 3차 카테고리
	
	/* getter, setter, toString */
	public int getReturnGoodsfacilityInfoCode() {
		return returnGoodsfacilityInfoCode;
	}
	public void setReturnGoodsfacilityInfoCode(int returnGoodsfacilityInfoCode) {
		this.returnGoodsfacilityInfoCode = returnGoodsfacilityInfoCode;
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
	public String getGoodsfacilityName() {
		return goodsfacilityName;
	}
	public void setGoodsfacilityName(String goodsfacilityName) {
		this.goodsfacilityName = goodsfacilityName;
	}
	public String getClassifyGoodsfacility() {
		return classifyGoodsfacility;
	}
	public void setClassifyGoodsfacility(String classifyGoodsfacility) {
		this.classifyGoodsfacility = classifyGoodsfacility;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
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
	public String getAdminagencyName() {
		return adminagencyName;
	}
	public void setAdminagencyName(String adminagencyName) {
		this.adminagencyName = adminagencyName;
	}
	public String getFunctionaryId() {
		return functionaryId;
	}
	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
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
	public String getGoodsfacilityStateAfterservice() {
		return goodsfacilityStateAfterservice;
	}
	public void setGoodsfacilityStateAfterservice(String goodsfacilityStateAfterservice) {
		this.goodsfacilityStateAfterservice = goodsfacilityStateAfterservice;
	}
	public String getGoodsfacilityThreeName() {
		return goodsfacilityThreeName;
	}
	public void setGoodsfacilityThreeName(String goodsfacilityThreeName) {
		this.goodsfacilityThreeName = goodsfacilityThreeName;
	}
	@Override
	public String toString() {
		return "ReturnGoodsfacilityInfoDto [returnGoodsfacilityInfoCode=" + returnGoodsfacilityInfoCode
				+ ", goodsfacilityRentalCode=" + goodsfacilityRentalCode + ", goodsfacilityCode=" + goodsfacilityCode
				+ ", goodsfacilityName=" + goodsfacilityName + ", classifyGoodsfacility=" + classifyGoodsfacility
				+ ", memberLevel=" + memberLevel + ", citizenId=" + citizenId + ", citizenName=" + citizenName
				+ ", isRequestedToReturnAsDelivery=" + isRequestedToReturnAsDelivery + ", goodsfacilityRentalDayEnd="
				+ goodsfacilityRentalDayEnd + ", overdueDays=" + overdueDays + ", adminagencyCode=" + adminagencyCode
				+ ", adminagencyName=" + adminagencyName + ", functionaryId=" + functionaryId + ", functionaryName="
				+ functionaryName + ", stateGoodsCode=" + stateGoodsCode + ", stateGoods=" + stateGoods
				+ ", dateReturnCheck=" + dateReturnCheck + ", goodsfacilityStateAfterservice="
				+ goodsfacilityStateAfterservice + ", goodsfacilityThreeName=" + goodsfacilityThreeName + "]";
	}
	
	
	
}
