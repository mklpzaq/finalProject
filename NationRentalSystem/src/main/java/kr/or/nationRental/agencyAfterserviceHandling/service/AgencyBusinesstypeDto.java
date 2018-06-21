package kr.or.nationRental.agencyAfterserviceHandling.service;

public class AgencyBusinesstypeDto {
	private int agencyBusinesstypeCode;
	private String agencyBusinesstypeName;
	
	public int getAgencyBusinesstypeCode() {
		return agencyBusinesstypeCode;
	}
	public void setAgencyBusinesstypeCode(int agencyBusinesstypeCode) {
		this.agencyBusinesstypeCode = agencyBusinesstypeCode;
	}
	public String getAgencyBusinesstypeName() {
		return agencyBusinesstypeName;
	}
	public void setAgencyBusinesstypeName(String agencyBusinesstypeName) {
		this.agencyBusinesstypeName = agencyBusinesstypeName;
	}
	@Override
	public String toString() {
		return "AgencyBusinesstypeDto [agencyBusinesstypeCode=" + agencyBusinesstypeCode + ", agencyBusinesstypeName="
				+ agencyBusinesstypeName + "]";
	}
}
