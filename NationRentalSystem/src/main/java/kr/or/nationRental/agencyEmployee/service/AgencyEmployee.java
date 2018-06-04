package kr.or.nationRental.agencyEmployee.service;

public class AgencyEmployee {
	private String agencyEmployeeId;
	private String agencyEmployeePw;
	private String agencyName;
	private String agencyEmployeeName;
	private int agencyEmployeePhone;
	private String agencyEmployeeEmail;
	private String agencyEmployeeDateJoin;
	
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}
	public String getAgencyEmployeePw() {
		return agencyEmployeePw;
	}
	public void setAgencyEmployeePw(String agencyEmployeePw) {
		this.agencyEmployeePw = agencyEmployeePw;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getAgencyEmployeeName() {
		return agencyEmployeeName;
	}
	public void setAgencyEmployeeName(String agencyEmployeeName) {
		this.agencyEmployeeName = agencyEmployeeName;
	}
	public int getAgencyEmployeePhone() {
		return agencyEmployeePhone;
	}
	public void setAgencyEmployeePhone(int agencyEmployeePhone) {
		this.agencyEmployeePhone = agencyEmployeePhone;
	}
	public String getAgencyEmployeeEmail() {
		return agencyEmployeeEmail;
	}
	public void setAgencyEmployeeEmail(String agencyEmployeeEmail) {
		this.agencyEmployeeEmail = agencyEmployeeEmail;
	}
	public String getAgencyEmployeeDateJoin() {
		return agencyEmployeeDateJoin;
	}
	public void setAgencyEmployeeDateJoin(String agencyEmployeeDateJoin) {
		this.agencyEmployeeDateJoin = agencyEmployeeDateJoin;
	}
	@Override
	public String toString() {
		return "AgencyEmployee [agencyEmployeeId=" + agencyEmployeeId + ", agencyEmployeePw=" + agencyEmployeePw
				+ ", agencyName=" + agencyName + ", agencyEmployeeName=" + agencyEmployeeName + ", agencyEmployeePhone="
				+ agencyEmployeePhone + ", agencyEmployeeEmail=" + agencyEmployeeEmail + ", agencyEmployeeDateJoin="
				+ agencyEmployeeDateJoin + "]";
	}
}
