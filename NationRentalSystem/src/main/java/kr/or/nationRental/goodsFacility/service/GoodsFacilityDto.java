package kr.or.nationRental.goodsFacility.service;

public class GoodsFacilityDto {
	private int goodsfacilityOneCode;
	private String goodsfacilityOneName;
	private int goodsfacilityTwoCode;
	private String goodsfacilityTwoName;
	private int goodsfacilityThreeCode;
	private String goodsfacilityThreeName;
	
	public int getGoodsfacilityOneCode() {
		return goodsfacilityOneCode;
	}
	public void setGoodsfacilityOneCode(int goodsfacilityOneCode) {
		this.goodsfacilityOneCode = goodsfacilityOneCode;
	}
	public String getGoodsfacilityOneName() {
		return goodsfacilityOneName;
	}
	public void setGoodsfacilityOneName(String goodsfacilityOneName) {
		this.goodsfacilityOneName = goodsfacilityOneName;
	}
	public int getGoodsfacilityTwoCode() {
		return goodsfacilityTwoCode;
	}
	public void setGoodsfacilityTwoCode(int goodsfacilityTwoCode) {
		this.goodsfacilityTwoCode = goodsfacilityTwoCode;
	}
	public String getGoodsfacilityTwoName() {
		return goodsfacilityTwoName;
	}
	public void setGoodsfacilityTwoName(String goodsfacilityTwoName) {
		this.goodsfacilityTwoName = goodsfacilityTwoName;
	}
	public int getGoodsfacilityThreeCode() {
		return goodsfacilityThreeCode;
	}
	public void setGoodsfacilityThreeCode(int goodsfacilityThreeCode) {
		this.goodsfacilityThreeCode = goodsfacilityThreeCode;
	}
	public String getGoodsfacilityThreeName() {
		return goodsfacilityThreeName;
	}
	public void setGoodsfacilityThreeName(String goodsfacilityThreeName) {
		this.goodsfacilityThreeName = goodsfacilityThreeName;
	}
	
	@Override
	public String toString() {
		return "GoodsFacilityDto [goodsfacilityOneCode=" + goodsfacilityOneCode + ", goodsfacilityOneName="
				+ goodsfacilityOneName + ", goodsfacilityTwoCode=" + goodsfacilityTwoCode + ", goodsfacilityTwoName="
				+ goodsfacilityTwoName + ", goodsfacilityThreeCode=" + goodsfacilityThreeCode
				+ ", goodsfacilityThreeName=" + goodsfacilityThreeName + "]";
	}
	
	
	
	
}
