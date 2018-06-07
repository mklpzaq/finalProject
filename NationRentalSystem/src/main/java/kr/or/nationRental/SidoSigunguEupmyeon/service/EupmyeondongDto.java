package kr.or.nationRental.SidoSigunguEupmyeon.service;

public class EupmyeondongDto {

	private String eupmyeonCode; //eupmyeon_code
	private String sigunguCode; //sigungu_code
	private String eupmyeonMiddleCode; //eupmyeon_middle_code
	private String eupmyeonName; //eupmyeon_name
	
	public String getEupmyeonCode() {
		return eupmyeonCode;
	}
	public void setEupmyeonCode(String eupmyeonCode) {
		this.eupmyeonCode = eupmyeonCode;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getEupmyeonMiddleCode() {
		return eupmyeonMiddleCode;
	}
	public void setEupmyeonMiddleCode(String eupmyeonMiddleCode) {
		this.eupmyeonMiddleCode = eupmyeonMiddleCode;
	}
	public String getEupmyeonName() {
		return eupmyeonName;
	}
	public void setEupmyeonName(String eupmyeonName) {
		this.eupmyeonName = eupmyeonName;
	}
	
	@Override
	public String toString() {
		return "EupmyeondongDto [eupmyeonCode=" + eupmyeonCode + ", sigunguCode=" + sigunguCode
				+ ", eupmyeonMiddleCode=" + eupmyeonMiddleCode + ", eupmyeonName=" + eupmyeonName + "]";
	}
}
