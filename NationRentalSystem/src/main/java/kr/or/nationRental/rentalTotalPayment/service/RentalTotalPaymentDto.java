package kr.or.nationRental.rentalTotalPayment.service;

import java.sql.Date;

public class RentalTotalPaymentDto {
	private int RentalTotalPaymentCode; // 시설/물품 대여 최종결제 코드
	private int GoodsfacilityRentalCode; //시설/물품 대여/예약 신청코드
	private String citizenId; //시민ID
	private int goodsfacilityCode; //시설/물품 개별관리코드
	private String goodsfacilityName; //시설/물품명
	private int adminagencyCode; //행정기관코드
	private String adminagencyName; //행정기관명
	private int goodsfacilityPriceRental; //시설/뭎품 대여/대관료
	private int usedPoint; //사용 포인트
	private int annualfeePakageCode; //사용 영회비 코드
	private String annualfeePakageName; //연회비 명
	private int deliveryPrice; //배송비
	private int rentalTotalPayment; //총 결제금액 = 대여대관료 - 상요포인트 - 연회비 + 배송료
	private Date datePayment; //결제날짜
	
	public int getRentalTotalPaymentCode() {
		return RentalTotalPaymentCode;
	}
	public void setRentalTotalPaymentCode(int rentalTotalPaymentCode) {
		RentalTotalPaymentCode = rentalTotalPaymentCode;
	}
	public int getGoodsfacilityRentalCode() {
		return GoodsfacilityRentalCode;
	}
	public void setGoodsfacilityRentalCode(int goodsfacilityRentalCode) {
		GoodsfacilityRentalCode = goodsfacilityRentalCode;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
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
	public int getGoodsfacilityPriceRental() {
		return goodsfacilityPriceRental;
	}
	public void setGoodsfacilityPriceRental(int goodsfacilityPriceRental) {
		this.goodsfacilityPriceRental = goodsfacilityPriceRental;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public int getAnnualfeePakageCode() {
		return annualfeePakageCode;
	}
	public void setAnnualfeePakageCode(int annualfeePakageCode) {
		this.annualfeePakageCode = annualfeePakageCode;
	}
	public String getAnnualfeePakageName() {
		return annualfeePakageName;
	}
	public void setAnnualfeePakageName(String annualfeePakageName) {
		this.annualfeePakageName = annualfeePakageName;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getRentalTotalPayment() {
		return rentalTotalPayment;
	}
	public void setRentalTotalPayment(int rentalTotalPayment) {
		this.rentalTotalPayment = rentalTotalPayment;
	}
	public Date getDatePayment() {
		return datePayment;
	}
	public void setDatePayment(Date datePayment) {
		this.datePayment = datePayment;
	}
	
	@Override
	public String toString() {
		return "RentalTotalPaymentDto [RentalTotalPaymentCode=" + RentalTotalPaymentCode + ", GoodsfacilityRentalCode="
				+ GoodsfacilityRentalCode + ", citizenId=" + citizenId + ", goodsfacilityCode=" + goodsfacilityCode
				+ ", goodsfacilityName=" + goodsfacilityName + ", adminagencyCode=" + adminagencyCode
				+ ", adminagencyName=" + adminagencyName + ", goodsfacilityPriceRental=" + goodsfacilityPriceRental
				+ ", usedPoint=" + usedPoint + ", annualfeePakageCode=" + annualfeePakageCode + ", annualfeePakageName="
				+ annualfeePakageName + ", deliveryPrice=" + deliveryPrice + ", rentalTotalPayment="
				+ rentalTotalPayment + ", datePayment=" + datePayment + "]";
	}
	
	
}
