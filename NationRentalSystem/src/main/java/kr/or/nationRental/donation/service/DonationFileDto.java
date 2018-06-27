package kr.or.nationRental.donation.service;

import java.util.List;

import com.mysql.fabric.xmlrpc.base.Data;

public class DonationFileDto {
	private int donationFileCode; // 기부파일코드
	private int donationRequestCode; //기부신청코드
	private String donationFileName; //기부파일이름
	private String donationFileExt; //기부파일ext
	private String donationFileType; //기부파일type
	private long donationFileSize; //기부파일size
	private Data donationUploadFile; //기부파일 업로드날짜
	
	private List<DonationFileDto> donationFileDto;
	public int getDonationFileCode() {
		return donationFileCode;
	}
	public void setDonationFileCode(int donationFileCode) {
		this.donationFileCode = donationFileCode;
	}
	public int getDonationRequestCode() {
		return donationRequestCode;
	}
	public void setDonationRequestCode(int donationRequestCode) {
		this.donationRequestCode = donationRequestCode;
	}
	public String getDonationFileName() {
		return donationFileName;
	}
	public void setDonationFileName(String donationFileName) {
		this.donationFileName = donationFileName;
	}
	public String getDonationFileExt() {
		return donationFileExt;
	}
	public void setDonationFileExt(String donationFileExt) {
		this.donationFileExt = donationFileExt;
	}
	public String getDonationFileType() {
		return donationFileType;
	}
	public void setDonationFileType(String donationFileType) {
		this.donationFileType = donationFileType;
	}
	public long getDonationFileSize() {
		return donationFileSize;
	}
	public void setDonationFileSize(long donationFileSize) {
		this.donationFileSize = donationFileSize;
	}
	public Data getDonationUploadFile() {
		return donationUploadFile;
	}
	public void setDonationUploadFile(Data donationUploadFile) {
		this.donationUploadFile = donationUploadFile;
	}
	public List<DonationFileDto> getDonationFileDto() {
		return donationFileDto;
	}
	public void setDonationFileDto(List<DonationFileDto> donationFileDto) {
		this.donationFileDto = donationFileDto;
	}
	
	@Override
	public String toString() {
		return "DonationFileDto [donationFileCode=" + donationFileCode + ", donationRequestCode=" + donationRequestCode
				+ ", donationFileName=" + donationFileName + ", donationFileExt=" + donationFileExt
				+ ", donationFileType=" + donationFileType + ", donationFileSize=" + donationFileSize
				+ ", donationUploadFile=" + donationUploadFile + ", donationFileDto=" + donationFileDto + "]";
	}
	
}