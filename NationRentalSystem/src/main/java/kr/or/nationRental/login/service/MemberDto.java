package kr.or.nationRental.login.service;

public class MemberDto {
	private String memberId;
	private String memberPw;
	private String memberLevel;
	private String memberName;
	private String memberPhone;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	
	@Override
	public String toString() {
		return "LoginDto [memberId=" + memberId + ", memberPw=" + memberPw + ", memberLevel=" + memberLevel
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + "]";
	}
}
