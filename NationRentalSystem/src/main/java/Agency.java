import java.sql.Date;

public class Agency {
	private int agencyCode; //낙찰업체 코드(인증코드)
	private int adminagencyCode; //계약된 행정기관의 코드
	private String adminagencyName; //계약된 행정기관 명
	private String functionaryName; //등록공무원 명	
	private String agencyName; //낙찰업체명
	private int agencyBusinesstypeCode; //업종코드
	private String agencyBusinesstypeNames; //업종명	
	private Date agencyDateRegistration; //계약시작일
	private Date agencyDateContractClosed; //계약종료일
	
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
	public String getAdminagencyName() {
		return adminagencyName;
	}
	public void setAdminagencyName(String adminagencyName) {
		this.adminagencyName = adminagencyName;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
	}
	public int getAgencyBusinesstypeCode() {
		return agencyBusinesstypeCode;
	}
	public void setAgencyBusinesstypeCode(int agencyBusinesstypeCode) {
		this.agencyBusinesstypeCode = agencyBusinesstypeCode;
	}
	public String getAgencyBusinesstypeNames() {
		return agencyBusinesstypeNames;
	}
	public void setAgencyBusinesstypeNames(String agencyBusinesstypeNames) {
		this.agencyBusinesstypeNames = agencyBusinesstypeNames;
	}
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public Date getAgencyDateRegistration() {
		return agencyDateRegistration;
	}
	public void setAgencyDateRegistration(Date agencyDateRegistration) {
		this.agencyDateRegistration = agencyDateRegistration;
	}
	public Date getAgencyDateContractClosed() {
		return agencyDateContractClosed;
	}
	public void setAgencyDateContractClosed(Date agencyDateContractClosed) {
		this.agencyDateContractClosed = agencyDateContractClosed;
	}
	@Override
	public String toString() {
		return "agency [agencyCode=" + agencyCode + ", adminagencyCode=" + adminagencyCode + ", adminagencyName="
				+ adminagencyName + ", functionaryName=" + functionaryName + ", agencyBusinesstypeCode="
				+ agencyBusinesstypeCode + ", agencyBusinesstypeNames=" + agencyBusinesstypeNames + ", agencyName="
				+ agencyName + ", agencyDateRegistration=" + agencyDateRegistration + ", agencyDateContractClosed="
				+ agencyDateContractClosed + "]";
	}
	
	
	
	
}
