package kr.or.nationRental.donation.service;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DonationRequest {
	private int donationRequestCode; // 기부신청코드
	private String memberId; //작성자 ID
	private String donationTitle; //제목
	private String donationContent; //내용
	private Date donationRequestDate; //작성날짜
	private String donationApproval; //승인여부
	private List<MultipartFile> multipartfile;
	
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
	public List<MultipartFile> getMultipartfile() {
		return multipartfile;
	}
	public void setMultipartfile(List<MultipartFile> multipartfile) {
		this.multipartfile = multipartfile;
	}
	
	@Override
	public String toString() {
		return "DonationRequest [donationRequestCode=" + donationRequestCode + ", memberId=" + memberId
				+ ", donationTitle=" + donationTitle + ", donationContent=" + donationContent + ", donationRequestDate="
				+ donationRequestDate + ", donationApproval=" + donationApproval + ", multipartfile=" + multipartfile
				+ "]";
	}
	
	
	
	
	
}
