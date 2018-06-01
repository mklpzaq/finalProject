
public class GoodsfacilityDto {
	
	private int goodsfacilityOneCode; //시설물품 1차 카테고리코드
	private String goodsfacilityOneName; //시설물품 1차 카테고리명
	private int goodsfacilityTwoCode; //시설물품 2차 카테고리코드
	private String goodsfacilityTwoName; //시설물품 2차 카테고리명
	private int goodsfacilityThreeCode; //시설물품 3차 카테고리코드
	private String goodsfacilityThreeName; //시설물품 3차 카테고리명 
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
		return "goodsfacilityDto [goodsfacilityOneCode=" + goodsfacilityOneCode + ", goodsfacilityOneName="
				+ goodsfacilityOneName + ", goodsfacilityTwoCode=" + goodsfacilityTwoCode + ", goodsfacilityTwoName="
				+ goodsfacilityTwoName + ", goodsfacilityThreeCode=" + goodsfacilityThreeCode
				+ ", goodsfacilityThreeName=" + goodsfacilityThreeName + "]";
	}
	
	
}
