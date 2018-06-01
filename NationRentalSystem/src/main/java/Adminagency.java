import java.sql.Date;

public class Adminagency {
	private int adminagencyCode; //행정기관코드
	private String adminagencyName; //행정기관명
	private int sigunguCode; //시군구코드
	private String sigunguName; //시군구명
	private int eupmyeonCode; //읍면동코드
	private String eupmyeonName; //읍면동명
	private String adminagencyAddressSangse; //상세주소
	private String adminagencyIsRentalBan; //대여/대관 가능 여부
	private Date adminagencyDateRegistration; //등록날짜
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
	public String getAdminagencyAddressSangse() {
		return adminagencyAddressSangse;
	}
	public void setAdminagencyAddressSangse(String adminagencyAddressSangse) {
		this.adminagencyAddressSangse = adminagencyAddressSangse;
	}
	public String getAdminagencyIsRentalBan() {
		return adminagencyIsRentalBan;
	}
	public void setAdminagencyIsRentalBan(String adminagencyIsRentalBan) {
		this.adminagencyIsRentalBan = adminagencyIsRentalBan;
	}
	public Date getAdminagencyDateRegistration() {
		return adminagencyDateRegistration;
	}
	public void setAdminagencyDateRegistration(Date adminagencyDateRegistration) {
		this.adminagencyDateRegistration = adminagencyDateRegistration;
	}
	@Override
	public String toString() {
		return "adminagency [adminagencyCode=" + adminagencyCode + ", adminagencyName=" + adminagencyName
				+ ", sigunguCode=" + sigunguCode + ", sigunguName=" + sigunguName + ", eupmyeonCode=" + eupmyeonCode
				+ ", eupmyeonName=" + eupmyeonName + ", adminagencyAddressSangse=" + adminagencyAddressSangse
				+ ", adminagencyIsRentalBan=" + adminagencyIsRentalBan + ", adminagencyDateRegistration="
				+ adminagencyDateRegistration + "]";
	}
	
	
	
}
