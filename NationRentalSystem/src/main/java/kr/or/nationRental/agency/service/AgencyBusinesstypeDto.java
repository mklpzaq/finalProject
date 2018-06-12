package kr.or.nationRental.agency.service;

public class AgencyBusinesstypeDto {
	private int agencyBusinesstypeCode; //agency_businesstype_code
	private String agencyBusinesstypeName; //agency_businesstype_name
	
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

