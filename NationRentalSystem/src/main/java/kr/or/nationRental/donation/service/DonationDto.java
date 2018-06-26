package kr.or.nationRental.donation.service;

import com.mysql.fabric.xmlrpc.base.Data;

public class DonationDto {
	private int donationRequestCode; // 기부신청코드
	private String memberId; //작성자 ID
	private String donationName; //제목
	private String donationPw; //작성PS
	private String donationContent; //내용
	private Data donationRequestData; //작성날짜
	
	public int getDonationRequestCode() {
		return donationRequestCode;
	}
	public void setDonationRequestCode(int donationRequestCode) {
		this.donationRequestCode = donationRequestCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getDonationName() {
		return donationName;
	}
	public void setDonationName(String donationName) {
		this.donationName = donationName;
	}
	public String getDonationPw() {
		return donationPw;
	}
	public void setDonationPw(String donationPw) {
		this.donationPw = donationPw;
	}
	public String getDonationContent() {
		return donationContent;
	}
	public void setDonationContent(String donationContent) {
		this.donationContent = donationContent;
	}
	public Data getDonationRequestData() {
		return donationRequestData;
	}
	public void setDonationRequestData(Data donationRequestData) {
		this.donationRequestData = donationRequestData;
	}
	
	@Override
	public String toString() {
		return "DonationDto [donationRequestCode=" + donationRequestCode + ", memberId=" + memberId + ", donationName="
				+ donationName + ", donationPw=" + donationPw + ", donationContent=" + donationContent
				+ ", donationRequestData=" + donationRequestData + "]";
	}
	
}
