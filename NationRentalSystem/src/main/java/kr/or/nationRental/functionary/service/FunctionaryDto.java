package kr.or.nationRental.functionary.service;
import java.sql.Date;

public class FunctionaryDto {
	private String functionaryId; //공무원가입 아이디
	private int adminagencyCode; //공무원등록 행정구역코드
	private String adminagencyName; //공무원등록 행정구역명
	private String functionaryNum; //공무원번호
	private String functionaryPw; //공무원가입 비밀번호
	private String functionaryName; //공무원명
	private String functionaryPhone; //공무원 전화번호
	private String functionaryEmail; //공무원 이메일
	private Date functionaryDateJoin; //공무원 가입 날짜
	private int functionaryMoveInoutCode; //공무원 이력관리 코드
	private Date functionaryDateWorkStart; //전입날짜
	private Date functionaryDateWorkEnd; //전출날짜
	private String functionaryStateWork; //전입전출상태
	/* 입력받기 위해 필요한 추가사항 */
	private String sidoName;
	private String sigunguName;
	private String eupmyeonName;
	private String adminagencyAddressSangse;
	private String agencyEmployeeId;
	
	public String getFunctionaryId() {
		return functionaryId;
	}
	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
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
	public String getFunctionaryNum() {
		return functionaryNum;
	}
	public void setFunctionaryNum(String functionaryNum) {
		this.functionaryNum = functionaryNum;
	}
	public String getFunctionaryPw() {
		return functionaryPw;
	}
	public void setFunctionaryPw(String functionaryPw) {
		this.functionaryPw = functionaryPw;
	}
	public String getFunctionaryName() {
		return functionaryName;
	}
	public void setFunctionaryName(String functionaryName) {
		this.functionaryName = functionaryName;
	}
	public String getFunctionaryPhone() {
		return functionaryPhone;
	}
	public void setFunctionaryPhone(String functionaryPhone) {
		this.functionaryPhone = functionaryPhone;
	}
	public String getFunctionaryEmail() {
		return functionaryEmail;
	}
	public void setFunctionaryEmail(String functionaryEmail) {
		this.functionaryEmail = functionaryEmail;
	}
	public Date getFunctionaryDateJoin() {
		return functionaryDateJoin;
	}
	public void setFunctionaryDateJoin(Date functionaryDateJoin) {
		this.functionaryDateJoin = functionaryDateJoin;
	}
	public int getFunctionaryMoveInoutCode() {
		return functionaryMoveInoutCode;
	}
	public void setFunctionaryMoveInoutCode(int functionaryMoveInoutCode) {
		this.functionaryMoveInoutCode = functionaryMoveInoutCode;
	}
	public Date getFunctionaryDateWorkStart() {
		return functionaryDateWorkStart;
	}
	public void setFunctionaryDateWorkStart(Date functionaryDateWorkStart) {
		this.functionaryDateWorkStart = functionaryDateWorkStart;
	}
	public Date getFunctionaryDateWorkEnd() {
		return functionaryDateWorkEnd;
	}
	public void setFunctionaryDateWorkEnd(Date functionaryDateWorkEnd) {
		this.functionaryDateWorkEnd = functionaryDateWorkEnd;
	}
	public String getFunctionaryStateWork() {
		return functionaryStateWork;
	}
	public void setFunctionaryStateWork(String functionaryStateWork) {
		this.functionaryStateWork = functionaryStateWork;
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
	public String getAdminagencyAddressSangse() {
		return adminagencyAddressSangse;
	}
	public void setAdminagencyAddressSangse(String adminagencyAddressSangse) {
		this.adminagencyAddressSangse = adminagencyAddressSangse;
	}
	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}
	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}
	@Override
	public String toString() {
		return "FunctionaryDto [functionaryId=" + functionaryId + ", adminagencyCode=" + adminagencyCode
				+ ", adminagencyName=" + adminagencyName + ", functionaryNum=" + functionaryNum + ", functionaryPw="
				+ functionaryPw + ", functionaryName=" + functionaryName + ", functionaryPhone=" + functionaryPhone
				+ ", functionaryEmail=" + functionaryEmail + ", functionaryDateJoin=" + functionaryDateJoin
				+ ", functionaryMoveInoutCode=" + functionaryMoveInoutCode + ", functionaryDateWorkStart="
				+ functionaryDateWorkStart + ", functionaryDateWorkEnd=" + functionaryDateWorkEnd
				+ ", functionaryStateWork=" + functionaryStateWork + ", sidoName=" + sidoName + ", sigunguName="
				+ sigunguName + ", eupmyeonName=" + eupmyeonName + ", adminagencyAddressSangse="
				+ adminagencyAddressSangse + ", agencyEmployeeId=" + agencyEmployeeId + "]";
	}
}
