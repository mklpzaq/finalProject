package kr.or.nationRental.agencyEmployee.service;

import java.util.ArrayList;
import java.util.List;


public class BusinessTypeForAgencyEmployeeDto {
	private String agencyEmployeeId; //낙찰된 대행업체 직원 id
	private String agencyName; //대행업체명
	private List<String> nowAgencyBusinesstypeList;
	private List<String> addAgencyBusinesstypeList;
	
	/* 생성자 매서드 */
	public BusinessTypeForAgencyEmployeeDto() {
		this.nowAgencyBusinesstypeList = new ArrayList<String>();
		this.addAgencyBusinesstypeList = new ArrayList<String>();
	}
	/* getter setter toString */

	public String getAgencyEmployeeId() {
		return agencyEmployeeId;
	}

	public void setAgencyEmployeeId(String agencyEmployeeId) {
		this.agencyEmployeeId = agencyEmployeeId;
	}

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

	public List<String> getNowAgencyBusinesstypeList() {
		return nowAgencyBusinesstypeList;
	}

	public void setNowAgencyBusinesstypeList(List<String> nowAgencyBusinesstypeList) {
		this.nowAgencyBusinesstypeList = nowAgencyBusinesstypeList;
	}

	public List<String> getAddAgencyBusinesstypeList() {
		return addAgencyBusinesstypeList;
	}

	public void setAddAgencyBusinesstypeList(List<String> addAgencyBusinesstypeList) {
		this.addAgencyBusinesstypeList = addAgencyBusinesstypeList;
	}

	@Override
	public String toString() {
		return "BusinessTypeForAgencyEmployeeDto [agencyEmployeeId=" + agencyEmployeeId + ", agencyName=" + agencyName
				+ ", nowAgencyBusinesstypeList=" + nowAgencyBusinesstypeList + ", addAgencyBusinesstypeList="
				+ addAgencyBusinesstypeList + "]";
	}
}
