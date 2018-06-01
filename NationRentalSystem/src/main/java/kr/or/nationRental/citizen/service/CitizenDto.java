package kr.or.nationRental.citizen.service;
import java.sql.Date;

public class CitizenDto {
	private String citizenId; //시민ID
	private String citizenPw; //Pw
	private String citizenName; //시민명
	private int citizenJuminNum; //주민번호
	private int sigunguCode; //시군구코드
	private String sigunguName; //시군구명
	private int eupmyeonCode; //읍면동코드
	private String eupmyeonName; //읍면동명
	private String citizenAddressSangse; //상세주소
	private int citizenPhone; //시민 전화번호
	private String citizenEmail; //시민 이메일
	private Date citizenDateJoin; //가입날짜
	
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	public String getCitizenPw() {
		return citizenPw;
	}
	public void setCitizenPw(String citizenPw) {
		this.citizenPw = citizenPw;
	}
	public String getCitizenName() {
		return citizenName;
	}
	public void setCitizenName(String citizenName) {
		this.citizenName = citizenName;
	}
	public int getCitizenJuminNum() {
		return citizenJuminNum;
	}
	public void setCitizenJuminNum(int citizenJuminNum) {
		this.citizenJuminNum = citizenJuminNum;
	}
	public int getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getSigunguName() {
		return sigunguName;
	}
	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}
	public int getEupmyeonCode() {
		return eupmyeonCode;
	}
	public void setEupmyeonCode(int eupmyeonCode) {
		this.eupmyeonCode = eupmyeonCode;
	}
	public String getEupmyeonName() {
		return eupmyeonName;
	}
	public void setEupmyeonName(String eupmyeonName) {
		this.eupmyeonName = eupmyeonName;
	}
	public String getCitizenAddressSangse() {
		return citizenAddressSangse;
	}
	public void setCitizenAddressSangse(String citizenAddressSangse) {
		this.citizenAddressSangse = citizenAddressSangse;
	}
	public int getCitizenPhone() {
		return citizenPhone;
	}
	public void setCitizenPhone(int citizenPhone) {
		this.citizenPhone = citizenPhone;
	}
	public String getCitizenEmail() {
		return citizenEmail;
	}
	public void setCitizenEmail(String citizenEmail) {
		this.citizenEmail = citizenEmail;
	}
	public Date getCitizenDateJoin() {
		return citizenDateJoin;
	}
	public void setCitizenDateJoin(Date citizenDateJoin) {
		this.citizenDateJoin = citizenDateJoin;
	}
	@Override
	public String toString() {
		return "citizenDto [citizenId=" + citizenId + ", citizenPw=" + citizenPw + ", citizenName=" + citizenName
				+ ", citizenJuminNum=" + citizenJuminNum + ", sigunguCode=" + sigunguCode + ", sigunguName="
				+ sigunguName + ", eupmyeonCode=" + eupmyeonCode + ", eupmyeonName=" + eupmyeonName
				+ ", citizenAddressSangse=" + citizenAddressSangse + ", citizenPhone=" + citizenPhone
				+ ", citizenEmail=" + citizenEmail + ", citizenDateJoin=" + citizenDateJoin + "]";
	}
	
	
}
