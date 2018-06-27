package kr.or.nationRental.nakchal.service;

public class NakchalDto {
	/* agency table */
	private int agency_code;
	private int adminagency_code;
	private String functionary_name;
	private String agency_name;
	private int agency_businesstype_code;
	private String agency_date_registration;
	private String agency_date_contract_closed;
	/* adminagency table */
	private String adminagency_name;
	private String sido_name;
	private String sigungu_name;
	private String eupmyeon_name;
	/* agencyEmployee table */
	private String agencyEmployeeId;
	
	public int getAgency_code() {
		return agency_code;
	}
	public void setAgency_code(int agency_code) {
		this.agency_code = agency_code;
	}
	public int getAdminagency_code() {
		return adminagency_code;
	}
	public void setAdminagency_code(int adminagency_code) {
		this.adminagency_code = adminagency_code;
	}
	public String getFunctionary_name() {
		return functionary_name;
	}
	public void setFunctionary_name(String functionary_name) {
		this.functionary_name = functionary_name;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agency_name) {
		this.agency_name = agency_name;
	}
	public int getAgency_businesstype_code() {
		return agency_businesstype_code;
	}
	public void setAgency_businesstype_code(int agency_businesstype_code) {
		this.agency_businesstype_code = agency_businesstype_code;
	}
	public String getAgency_date_registration() {
		return agency_date_registration;
	}
	public void setAgency_date_registration(String agency_date_registration) {
		this.agency_date_registration = agency_date_registration;
	}
	public String getAgency_date_contract_closed() {
		return agency_date_contract_closed;
	}
	public void setAgency_date_contract_closed(String agency_date_contract_closed) {
		this.agency_date_contract_closed = agency_date_contract_closed;
	}
	public String getAdminagency_name() {
		return adminagency_name;
	}
	public void setAdminagency_name(String adminagency_name) {
		this.adminagency_name = adminagency_name;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}
	public String getSigungu_name() {
		return sigungu_name;
	}
	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}
	public String getEupmyeon_name() {
		return eupmyeon_name;
	}
	public void setEupmyeon_name(String eupmyeon_name) {
		this.eupmyeon_name = eupmyeon_name;
	}
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}
	@Override
	public String toString() {
		return "NakchalDto [agency_code=" + agency_code + ", adminagency_code=" + adminagency_code
				+ ", functionary_name=" + functionary_name + ", agency_name=" + agency_name
				+ ", agency_businesstype_code=" + agency_businesstype_code + ", agency_date_registration="
				+ agency_date_registration + ", agency_date_contract_closed=" + agency_date_contract_closed
				+ ", adminagency_name=" + adminagency_name + ", sido_name=" + sido_name + ", sigungu_name="
				+ sigungu_name + ", eupmyeon_name=" + eupmyeon_name + ", agencyEmployeeId=" + agencyEmployeeId + "]";
	}
}
