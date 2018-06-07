package kr.or.nationRental.SidoSigunguEupmyeon.service;

public class SigunguDto {
	private String sigunguCode; //sigungu_code
	private String sidoCode; //sido_code
	private String sigunguMiddleCode; //sigungu_middle_code
	private String sigunguName; //sigungu_name
	
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getSigunguMiddleCode() {
		return sigunguMiddleCode;
	}
	public void setSigunguMiddleCode(String sigunguMiddleCode) {
		this.sigunguMiddleCode = sigunguMiddleCode;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	
	@Override
	public String toString() {
		return "SigunguDto [sigunguCode=" + sigunguCode + ", sidoCode=" + sidoCode + ", sigunguMiddleCode="
				+ sigunguMiddleCode + ", sigunguName=" + sigunguName + "]";
	}
	
}
