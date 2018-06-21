package kr.or.nationRental.agencyAfterserviceHandling.service;

public class AgencyAfterserviceHandlingDto {
	private int agencyAfterserviceHandlingCode;
	private int unitedAfterserviceRequestCode;
	private int agencyCode;
	private String agencyName;
	private int agencyBusinesstypeCode;
	private String agencyEmployeeId;
	private int goodsfacilityCode;
	private String goodsfacilityName;
	private String dateAfterserviceStart;
	private String textExpertOpinion;
	private String classifyAfterserviceState;
	private String dateAfterserviceEnd;
	
	/* 추가 맴버 변수*/
	private String agencyBusinesstypeName;
	
	public int getAgencyAfterserviceHandlingCode() {
		return agencyAfterserviceHandlingCode;
	}
	public void setAgencyAfterserviceHandlingCode(int agencyAfterserviceHandlingCode) {
		this.agencyAfterserviceHandlingCode = agencyAfterserviceHandlingCode;
	}
	public int getUnitedAfterserviceRequestCode() {
		return unitedAfterserviceRequestCode;
	}
	public void setUnitedAfterserviceRequestCode(int unitedAfterserviceRequestCode) {
		this.unitedAfterserviceRequestCode = unitedAfterserviceRequestCode;
	}
	public int getAgencyCode() {
		return agencyCode;
	}
	public void setAgencyCode(int agencyCode) {
		this.agencyCode = agencyCode;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public int getAgencyBusinesstypeCode() {
		return agencyBusinesstypeCode;
	}
	public void setAgencyBusinesstypeCode(int agencyBusinesstypeCode) {
		this.agencyBusinesstypeCode = agencyBusinesstypeCode;
	}
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
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
	public String getDateAfterserviceStart() {
		return dateAfterserviceStart;
	}
	public void setDateAfterserviceStart(String dateAfterserviceStart) {
		this.dateAfterserviceStart = dateAfterserviceStart;
	}
	public String getTextExpertOpinion() {
		return textExpertOpinion;
	}
	public void setTextExpertOpinion(String textExpertOpinion) {
		this.textExpertOpinion = textExpertOpinion;
	}
	public String getClassifyAfterserviceState() {
		return classifyAfterserviceState;
	}
	public void setClassifyAfterserviceState(String classifyAfterserviceState) {
		this.classifyAfterserviceState = classifyAfterserviceState;
	}
	public String getDateAfterserviceEnd() {
		return dateAfterserviceEnd;
	}
	public void setDateAfterserviceEnd(String dateAfterserviceEnd) {
		this.dateAfterserviceEnd = dateAfterserviceEnd;
	}
	@Override
	public String toString() {
		return "AgencyAfterserviceHandlingDto [agencyAfterserviceHandlingCode=" + agencyAfterserviceHandlingCode
				+ ", unitedAfterserviceRequestCode=" + unitedAfterserviceRequestCode + ", agencyCode=" + agencyCode
				+ ", agencyName=" + agencyName + ", agencyBusinesstypeCode=" + agencyBusinesstypeCode
				+ ", agencyEmployeeId=" + agencyEmployeeId + ", goodsfacilityCode=" + goodsfacilityCode
				+ ", goodsfacilityName=" + goodsfacilityName + ", dateAfterserviceStart=" + dateAfterserviceStart
				+ ", textExpertOpinion=" + textExpertOpinion + ", classifyAfterserviceState="
				+ classifyAfterserviceState + ", dateAfterserviceEnd=" + dateAfterserviceEnd + "]";
	}
}
