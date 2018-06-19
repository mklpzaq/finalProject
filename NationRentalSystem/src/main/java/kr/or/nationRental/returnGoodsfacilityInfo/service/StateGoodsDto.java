package kr.or.nationRental.returnGoodsfacilityInfo.service;


public class StateGoodsDto {
	private int stateGoodsCode;
	private String stateGoods;
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
	@Override
	public String toString() {
		return "stateGoodsDto [stateGoodsCode=" + stateGoodsCode + ", stateGoods=" + stateGoods + "]";
	}
	
	
}
