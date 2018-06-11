package kr.or.nationRental.goodsFacility.service;

public class GoodsFacilityCategoryDto {
	private int goodsfacilityOneCode; //goodsfacility_one_code
	private String goodsfacilityOneName; //goodsfacility_one_name
	private int goodsfacilityTwoCode; //goodsfacility_two_code
	private String goodsfacilityTwoName; //goodsfacility_two_name
	private int goodsfacilityThreeCode; //goodsfacility_three_code
	private String goodsfacilityThreeName; //goodsfacility_three_name
	
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
		return "GoodsFacilityCategoryDto [goodsfacilityOneCode=" + goodsfacilityOneCode + ", goodsfacilityOneName="
				+ goodsfacilityOneName + ", goodsfacilityTwoCode=" + goodsfacilityTwoCode + ", goodsfacilityTwoName="
				+ goodsfacilityTwoName + ", goodsfacilityThreeCode=" + goodsfacilityThreeCode
				+ ", goodsfacilityThreeName=" + goodsfacilityThreeName	+ "]";
	}
	
	

	
}
