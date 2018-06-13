package kr.or.nationRental.goodsFacility.service;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GoodsFacilityRequest {
	private int goodsfacilityCode;
	private int goodsfacilityThreeCode;
	private String goodsfacilityName;
	private int goodsfacilityPurchaseprice;
	private int goodsfacilityPriceRental;
	private String goodsfacilityTextSangse;
	private int adminagencyCode;
	private String sigunguName;
	private String sidoName;
	private String eupmyeonName;
	private String goodsfacilityAddressSangse;
	private String functionaryId;
	private String goodsfacilityClassifyGoodsfacility;
	private String goodsfacilityClassifyDonationpurchase;
	private String goodsfacilityIsExtra;
	private String goodsfacilityIsPossibleDelivery;
	private String goodsfacilityStateAfterservice;
	private String goodsfacilityIsPossibleRental;
	private List<MultipartFile> multipartfile;
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
	public List<MultipartFile> getMultipartfile() {
		return multipartfile;
	}
	public void setMultipartfile(List<MultipartFile> multipartfile) {
		this.multipartfile = multipartfile;
	}
	@Override
	public String toString() {
		return "GoodsFacilityRequest [goodsfacilityCode=" + goodsfacilityCode + ", goodsfacilityThreeCode="
				+ goodsfacilityThreeCode + ", goodsfacilityName=" + goodsfacilityName + ", goodsfacilityPurchaseprice="
				+ goodsfacilityPurchaseprice + ", goodsfacilityPriceRental=" + goodsfacilityPriceRental
				+ ", goodsfacilityTextSangse=" + goodsfacilityTextSangse + ", adminagencyCode=" + adminagencyCode
				+ ", sigunguName=" + sigunguName + ", sidoName=" + sidoName + ", eupmyeonName=" + eupmyeonName
				+ ", goodsfacilityAddressSangse=" + goodsfacilityAddressSangse + ", functionaryId=" + functionaryId
				+ ", goodsfacilityClassifyGoodsfacility=" + goodsfacilityClassifyGoodsfacility
				+ ", goodsfacilityClassifyDonationpurchase=" + goodsfacilityClassifyDonationpurchase
				+ ", goodsfacilityIsExtra=" + goodsfacilityIsExtra + ", goodsfacilityIsPossibleDelivery="
				+ goodsfacilityIsPossibleDelivery + ", goodsfacilityStateAfterservice=" + goodsfacilityStateAfterservice
				+ ", goodsfacilityIsPossibleRental=" + goodsfacilityIsPossibleRental + ", multipartfile="
				+ multipartfile + "]";
	}
	
	
}
