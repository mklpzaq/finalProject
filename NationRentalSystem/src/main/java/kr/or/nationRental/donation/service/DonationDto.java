package kr.or.nationRental.donation.service;

import java.sql.Date;
import java.util.List;

public class DonationDto {
	private int donationRequestCode; // 기부신청코드
	private String memberId; //작성자 ID
	private String donationTitle; //제목
	private String donationPw; //작성PS
	private String donationContent; //내용
	private Date donationRequestDate; //작성날짜
	private String donationApproval; //승인여부
	
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
	public String getDonationTitle() {
		return donationTitle;
	}
	public void setDonationTitle(String donationTitle) {
		this.donationTitle = donationTitle;
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
	public Date getDonationRequestDate() {
		return donationRequestDate;
	}
	public void setDonationRequestDate(Date donationRequestDate) {
		this.donationRequestDate = donationRequestDate;
	}
	public String getDonationApproval() {
		return donationApproval;
	}
	public void setDonationApproval(String donationApproval) {
		this.donationApproval = donationApproval;
	}
	
	@Override
	public String toString() {
		return "DonationDto [donationRequestCode=" + donationRequestCode + ", memberId=" + memberId + ", donationTitle="
				+ donationTitle + ", donationPw=" + donationPw + ", donationContent=" + donationContent
				+ ", donationRequestDate=" + donationRequestDate + ", donationApproval=" + donationApproval
				+ ", citizenId=" + "]";
	}
	
	
}
