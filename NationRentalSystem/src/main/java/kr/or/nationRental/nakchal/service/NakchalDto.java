package kr.or.nationRental.nakchal.service;

public class NakchalDto {
	/* agency table */
	private int agencyCode;
	private int adminagencyCode;
	private String functionaryName;
	private String agencyName;
	private int agencyBusinesstypeCode;
	private String agencyDateRegistration;
	private String agencyDateContractClosed;
	/* adminagency table */
	private String adminagencyName;
	private String sidoName;
	private String sigunguName;
	private String eupmyeonName;
	/* agencyEmployee table */
	private String agencyEmployeeId;
	/* agency_businesstype table */
	private String agencyBusinesstypeName;
	
	public int getAgencyCode() {
		return agencyCode;
	}
	public void setAgencyCode(int agencyCode) {
		this.agencyCode = agencyCode;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public int getAgencyBusinesstypeCode() {
		return agencyBusinesstypeCode;
	}
	public void setAgencyBusinesstypeCode(int agencyBusinesstypeCode) {
		this.agencyBusinesstypeCode = agencyBusinesstypeCode;
	}
	public String getAgencyDateRegistration() {
		return agencyDateRegistration;
	}
	public void setAgencyDateRegistration(String agencyDateRegistration) {
		this.agencyDateRegistration = agencyDateRegistration;
	}
	public String getAgencyDateContractClosed() {
		return agencyDateContractClosed;
	}
	public void setAgencyDateContractClosed(String agencyDateContractClosed) {
		this.agencyDateContractClosed = agencyDateContractClosed;
	}
	public String getAdminagencyName() {
		return adminagencyName;
	}
	public void setAdminagencyName(String adminagencyName) {
		this.adminagencyName = adminagencyName;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public String getEupmyeonName() {
		return eupmyeonName;
	}
	public void setEupmyeonName(String eupmyeonName) {
		this.eupmyeonName = eupmyeonName;
	}
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}
	public String getAgencyBusinesstypeName() {
		return agencyBusinesstypeName;
	}
	public void setAgencyBusinesstypeName(String agencyBusinesstypeName) {
		this.agencyBusinesstypeName = agencyBusinesstypeName;
	}
	@Override
	public String toString() {
		return "NakchalDto [agencyCode=" + agencyCode + ", adminagencyCode=" + adminagencyCode + ", functionaryName="
				+ functionaryName + ", agencyName=" + agencyName + ", agencyBusinesstypeCode=" + agencyBusinesstypeCode
				+ ", agencyDateRegistration=" + agencyDateRegistration + ", agencyDateContractClosed="
				+ agencyDateContractClosed + ", adminagencyName=" + adminagencyName + ", sidoName=" + sidoName
				+ ", sigunguName=" + sigunguName + ", eupmyeonName=" + eupmyeonName + ", agencyEmployeeId="
				+ agencyEmployeeId + ", agencyBusinesstypeName=" + agencyBusinesstypeName + "]";
	}
}
