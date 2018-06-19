package kr.or.nationRental.totalRentalPaymentInfo.service;

import java.sql.Date;

public class TotalRentalPaymentInfoDto {

	private int totalRentalPaymentInfoCode; // 개별결제코드
	private int totalRentalPayment; //총 대여료
	private int usedPoint;// 사용포인트
	private int deliveryPrice; //배송료
	private int totalPayment; //총결제금액 = 총대여료 - 사용포인트 + 배송료
	private Date datePayment; //결제날짜
	
	public int getTotalRentalPaymentInfoCode() {
		return totalRentalPaymentInfoCode;
	}
	public void setTotalRentalPaymentInfoCode(int totalRentalPaymentInfoCode) {
		this.totalRentalPaymentInfoCode = totalRentalPaymentInfoCode;
	}
	public int getTotalRentalPayment() {
		return totalRentalPayment;
	}
	public void setTotalRentalPayment(int totalRentalPayment) {
		this.totalRentalPayment = totalRentalPayment;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}
	public Date getDatePayment() {
		return datePayment;
	}
	public void setDatePayment(Date datePayment) {
		this.datePayment = datePayment;
	}
	
	@Override
	public String toString() {
		return "TotalRentalPaymentInfoDto [totalRentalPaymentInfoCode=" + totalRentalPaymentInfoCode
				+ ", totalRentalPayment=" + totalRentalPayment + ", usedPoint=" + usedPoint + ", deliveryPrice="
				+ deliveryPrice + ", totalPayment=" + totalPayment + ", datePayment=" + datePayment + "]";
	}
	
	
}
