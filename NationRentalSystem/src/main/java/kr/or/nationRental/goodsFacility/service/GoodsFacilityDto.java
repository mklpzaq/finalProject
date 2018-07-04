package kr.or.nationRental.goodsFacility.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class GoodsFacilityDto {
	private int goodsfacilityCode; //물품/시설코드
	private int goodsfacilityThreeCode; //물품시설 카테고리3차 코드
	private String goodsfacilityName; //물품/시설명
	private int goodsfacilityPurchaseprice; //물품/시설 구입금액
	private int goodsfacilityPriceRental; //물품시설 대여대관 금액
	private String goodsfacilityTextSangse; //물품시설 상세설명
	private int adminagencyCode; //행정기관코드
	private String adminagencyName; //행정기관명
	private String sigunguName; //시군구명
	private String sidoName; //시도명
	private String eupmyeonName; //읍면동명
	private String goodsfacilityAddressSangse; //물품시설상세주소
	private String functionaryId; //공무원 아이디
	private String goodsfacilityClassifyGoodsfacility; //물품/시설 여부
	private String goodsfacilityClassifyDonationpurchase; //기부/구입 여부
	private String goodsfacilityIsExtra; //예비상태 여부
	private String goodsfacilityIsPossibleDelivery; //배달가능 여부
	private String goodsfacilityStateAfterservice; //현재AS상태 여부
	private String goodsfacilityIsPossibleRental; //물품시설 대여대관 가능여부
	private Date goodsfacilityDateRegistration; //물품시설등록일자
	private List<GoodsFacilityFile> goodsFacilityFile;
	
	/* 입력받을때 필요할 내용 */
	private String goodsfacilityThreeName;

	public int getGoodsfacilityCode() {
		return goodsfacilityCode;
	}

	public void setGoodsfacilityCode(int goodsfacilityCode) {
		this.goodsfacilityCode = goodsfacilityCode;
	}

	public int getGoodsfacilityThreeCode() {
		return goodsfacilityThreeCode;
	}

	public void setGoodsfacilityThreeCode(int goodsfacilityThreeCode) {
		this.goodsfacilityThreeCode = goodsfacilityThreeCode;
	}

	public String getGoodsfacilityName() {
		return goodsfacilityName;
	}

	public void setGoodsfacilityName(String goodsfacilityName) {
		this.goodsfacilityName = goodsfacilityName;
	}

	public int getGoodsfacilityPurchaseprice() {
		return goodsfacilityPurchaseprice;
	}

	public void setGoodsfacilityPurchaseprice(int goodsfacilityPurchaseprice) {
		this.goodsfacilityPurchaseprice = goodsfacilityPurchaseprice;
	}

	public int getGoodsfacilityPriceRental() {
		return goodsfacilityPriceRental;
	}

	public void setGoodsfacilityPriceRental(int goodsfacilityPriceRental) {
		this.goodsfacilityPriceRental = goodsfacilityPriceRental;
	}

	public String getGoodsfacilityTextSangse() {
		return goodsfacilityTextSangse;
	}

	public void setGoodsfacilityTextSangse(String goodsfacilityTextSangse) {
		this.goodsfacilityTextSangse = goodsfacilityTextSangse;
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

	public String getSigunguName() {
		return sigunguName;
	}

	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}

	public String getSidoName() {
		return sidoName;
	}

	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	public String getEupmyeonName() {
		return eupmyeonName;
	}

	public void setEupmyeonName(String eupmyeonName) {
		this.eupmyeonName = eupmyeonName;
	}

	public String getGoodsfacilityAddressSangse() {
		return goodsfacilityAddressSangse;
	}

	public void setGoodsfacilityAddressSangse(String goodsfacilityAddressSangse) {
		this.goodsfacilityAddressSangse = goodsfacilityAddressSangse;
	}

	public String getFunctionaryId() {
		return functionaryId;
	}

	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
	}

	public String getGoodsfacilityClassifyGoodsfacility() {
		return goodsfacilityClassifyGoodsfacility;
	}

	public void setGoodsfacilityClassifyGoodsfacility(String goodsfacilityClassifyGoodsfacility) {
		this.goodsfacilityClassifyGoodsfacility = goodsfacilityClassifyGoodsfacility;
	}

	public String getGoodsfacilityClassifyDonationpurchase() {
		return goodsfacilityClassifyDonationpurchase;
	}

	public void setGoodsfacilityClassifyDonationpurchase(String goodsfacilityClassifyDonationpurchase) {
		this.goodsfacilityClassifyDonationpurchase = goodsfacilityClassifyDonationpurchase;
	}

	public String getGoodsfacilityIsExtra() {
		return goodsfacilityIsExtra;
	}

	public void setGoodsfacilityIsExtra(String goodsfacilityIsExtra) {
		this.goodsfacilityIsExtra = goodsfacilityIsExtra;
	}

	public String getGoodsfacilityIsPossibleDelivery() {
		return goodsfacilityIsPossibleDelivery;
	}

	public void setGoodsfacilityIsPossibleDelivery(String goodsfacilityIsPossibleDelivery) {
		this.goodsfacilityIsPossibleDelivery = goodsfacilityIsPossibleDelivery;
	}

	public String getGoodsfacilityStateAfterservice() {
		return goodsfacilityStateAfterservice;
	}

	public void setGoodsfacilityStateAfterservice(String goodsfacilityStateAfterservice) {
		this.goodsfacilityStateAfterservice = goodsfacilityStateAfterservice;
	}

	public String getGoodsfacilityIsPossibleRental() {
		return goodsfacilityIsPossibleRental;
	}

	public void setGoodsfacilityIsPossibleRental(String goodsfacilityIsPossibleRental) {
		this.goodsfacilityIsPossibleRental = goodsfacilityIsPossibleRental;
	}

	public Date getGoodsfacilityDateRegistration() {
		return goodsfacilityDateRegistration;
	}

	public void setGoodsfacilityDateRegistration(Date goodsfacilityDateRegistration) {
		this.goodsfacilityDateRegistration = goodsfacilityDateRegistration;
	}

	public List<GoodsFacilityFile> getGoodsFacilityFile() {
		return goodsFacilityFile;
	}

	public void setGoodsFacilityFile(List<GoodsFacilityFile> goodsFacilityFile) {
		this.goodsFacilityFile = goodsFacilityFile;
	}

	public String getGoodsfacilityThreeName() {
		return goodsfacilityThreeName;
	}

	public void setGoodsfacilityThreeName(String goodsfacilityThreeName) {
		this.goodsfacilityThreeName = goodsfacilityThreeName;
	}

	@Override
	public String toString() {
		return "GoodsFacilityDto [goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityThreeCode="
				+ goodsfacilityThreeCode + ", goodsfacilityName=" + goodsfacilityName + ", goodsfacilityPurchaseprice="
				+ goodsfacilityPurchaseprice + ", goodsfacilityPriceRental=" + goodsfacilityPriceRental
				+ ", goodsfacilityTextSangse=" + goodsfacilityTextSangse + ", adminagencyCode=" + adminagencyCode
				+ ", adminagencyName=" + adminagencyName + ", sigunguName=" + sigunguName + ", sidoName=" + sidoName
				+ ", eupmyeonName=" + eupmyeonName + ", goodsfacilityAddressSangse=" + goodsfacilityAddressSangse
				+ ", functionaryId=" + functionaryId + ", goodsfacilityClassifyGoodsfacility="
				+ goodsfacilityClassifyGoodsfacility + ", goodsfacilityClassifyDonationpurchase="
				+ goodsfacilityClassifyDonationpurchase + ", goodsfacilityIsExtra=" + goodsfacilityIsExtra
				+ ", goodsfacilityIsPossibleDelivery=" + goodsfacilityIsPossibleDelivery
				+ ", goodsfacilityStateAfterservice=" + goodsfacilityStateAfterservice
				+ ", goodsfacilityIsPossibleRental=" + goodsfacilityIsPossibleRental
				+ ", goodsfacilityDateRegistration=" + goodsfacilityDateRegistration + ", goodsFacilityFile="
				+ goodsFacilityFile + ", goodsfacilityThreeName=" + goodsfacilityThreeName + "]";
	}

	
	
}
