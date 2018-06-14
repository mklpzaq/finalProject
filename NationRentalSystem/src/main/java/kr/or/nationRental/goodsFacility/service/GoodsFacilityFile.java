package kr.or.nationRental.goodsFacility.service;

import java.util.Date;

public class GoodsFacilityFile {
	private int goodsfacilityFileCode;
	private int goodsfacilityCode;
	private String goodsfacilityFileName;
	private String goodsfacilityFileExt;
	private String goodsfacilityFileType;
	private int goodsfacilityFileSize;
	private Date dateUploadFile;
	public int getGoodsfacilityFileCode() {
		return goodsfacilityFileCode;
	}
	public void setGoodsfacilityFileCode(int goodsfacilityFileCode) {
		this.goodsfacilityFileCode = goodsfacilityFileCode;
	}
	public int getGoodsfacilityCode() {
		return goodsfacilityCode;
	}
	public void setGoodsfacilityCode(int goodsfacilityCode) {
		this.goodsfacilityCode = goodsfacilityCode;
	}
	public String getGoodsfacilityFileName() {
		return goodsfacilityFileName;
	}
	public void setGoodsfacilityFileName(String goodsfacilityFileName) {
		this.goodsfacilityFileName = goodsfacilityFileName;
	}
	public String getGoodsfacilityFileExt() {
		return goodsfacilityFileExt;
	}
	public void setGoodsfacilityFileExt(String goodsfacilityFileExt) {
		this.goodsfacilityFileExt = goodsfacilityFileExt;
	}
	public String getGoodsfacilityFileType() {
		return goodsfacilityFileType;
	}
	public void setGoodsfacilityFileType(String goodsfacilityFileType) {
		this.goodsfacilityFileType = goodsfacilityFileType;
	}
	public int getGoodsfacilityFileSize() {
		return goodsfacilityFileSize;
	}
	public void setGoodsfacilityFileSize(int goodsfacilityFileSize) {
		this.goodsfacilityFileSize = goodsfacilityFileSize;
	}
	public Date getDateUploadFile() {
		return dateUploadFile;
	}
	public void setDateUploadFile(Date dateUploadFile) {
		this.dateUploadFile = dateUploadFile;
	}
	@Override
	public String toString() {
		return "GoodsFacilityFile [goodsfacilityFileCode=" + goodsfacilityFileCode + ", goodsfacilityCode="
				+ goodsfacilityCode + ", goodsfacilityFileName=" + goodsfacilityFileName + ", goodsfacilityFileExt="
				+ goodsfacilityFileExt + ", goodsfacilityFileType=" + goodsfacilityFileType + ", goodsfacilityFileSize="
				+ goodsfacilityFileSize + ", dateUploadFile=" + dateUploadFile + "]";
	}
	
	
}
