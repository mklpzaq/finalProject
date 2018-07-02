package kr.or.nationRental.rentalTotalPayment.service;

import java.sql.Date;

import com.mysql.fabric.xmlrpc.base.Data;

public class RequestRefundDto {
	private int requestRefundCode; //환불코드
	private int rentalTotalPaymentCode; //결제코드
	private String citizenId; //시민Id
	private Date dateRequestRefund; //환불신청날짜
	
	public int getRequestRefundCode() {
		return requestRefundCode;
	}
	public void setRequestRefundCode(int requestRefundCode) {
		this.requestRefundCode = requestRefundCode;
	}
	public int getRentalTotalPaymentCode() {
		return rentalTotalPaymentCode;
	}
	public void setRentalTotalPaymentCode(int rentalTotalPaymentCode) {
		this.rentalTotalPaymentCode = rentalTotalPaymentCode;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	public Date getDateRequestRefund() {
		return dateRequestRefund;
	}
	public void setDateRequestRefund(Date dateRequestRefund) {
		this.dateRequestRefund = dateRequestRefund;
	}
	
	@Override
	public String toString() {
		return "RequestRefundDto [requestRefundCode=" + requestRefundCode + ", rentalTotalPaymentCode="
				+ rentalTotalPaymentCode + ", citizenId=" + citizenId + ", dateRequestRefund=" + dateRequestRefund
				+ "]";
	}
	
}
