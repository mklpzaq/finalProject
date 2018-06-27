package kr.or.nationRental.donation.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DonationRequest {
	private String donationTitle;
	private String donationContent; 
	private List<MultipartFile> multipartfile;
	
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
	public List<MultipartFile> getMultipartfile() {
		return multipartfile;
	}
	public void setMultipartfile(List<MultipartFile> multipartfile) {
		this.multipartfile = multipartfile;
	}
	
	@Override
	public String toString() {
		return "DonationRequest [donationTitle=" + donationTitle + ", donationContent=" + donationContent
				+ ", multipartfile=" + multipartfile + "]";
	}
	
	
	
}
