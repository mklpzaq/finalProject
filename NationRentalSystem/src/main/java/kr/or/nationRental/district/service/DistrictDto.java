package kr.or.nationRental.district.service;

public class DistrictDto {
	private String sidoCode; //시도코드
	private String sidoName; //시도명
	private String sigunguCode; //시군구코드
	private String sigunguMiddleCode; //시군구 중분류코드
	private String sigunguName; //시군구명
	private String eupmyeonCode; //읍면동코드
	private String eupmyeonMiddleCode; //읍면동 중분류코드
	private String eupmyeonName; //읍면동명
	
	public String getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
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
	public String getEupmyeonCode() {
		return eupmyeonCode;
	}
	public void setEupmyeonCode(String eupmyeonCode) {
		this.eupmyeonCode = eupmyeonCode;
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
		return "SidoSigunguEupmyeonDto [sidoCode=" + sidoCode + ", sidoName=" + sidoName + ", sigunguCode="
				+ sigunguCode + ", sigunguMiddleCode=" + sigunguMiddleCode + ", sigunguName=" + sigunguName
				+ ", eupmyeonCode=" + eupmyeonCode + ", eupmyeonMiddleCode=" + eupmyeonMiddleCode + ", eupmyeonName="
				+ eupmyeonName + "]";
	}
	
}
