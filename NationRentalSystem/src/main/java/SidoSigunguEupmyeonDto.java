
public class SidoSigunguEupmyeonDto {
	private int sidoCode; //시도코드
	private String sidoName; //시도명
	private int sigunguCode; //시군구코드
	private int sigunguMiddleCode; //시군구 중분류코드
	private String sigunguName; //시군구명
	private int eupmyeonCode; //읍면동코드
	private int eupmyeonMiddleCode; //읍면동 중분류코드
	private String eupmyeonName; //읍면동명
	public int getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(int sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public int getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public int getSigunguMiddleCode() {
		return sigunguMiddleCode;
	}
	public void setSigunguMiddleCode(int sigunguMiddleCode) {
		this.sigunguMiddleCode = sigunguMiddleCode;
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
	public int getEupmyeonMiddleCode() {
		return eupmyeonMiddleCode;
	}
	public void setEupmyeonMiddleCode(int eupmyeonMiddleCode) {
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
		return "SidoSigunguEupmyeon [sidoCode=" + sidoCode + ", sidoName=" + sidoName + ", sigunguCode=" + sigunguCode
				+ ", sigunguMiddleCode=" + sigunguMiddleCode + ", sigunguName=" + sigunguName + ", eupmyeonCode="
				+ eupmyeonCode + ", eupmyeonMiddleCode=" + eupmyeonMiddleCode + ", eupmyeonName=" + eupmyeonName + "]";
	}
	
	
}
