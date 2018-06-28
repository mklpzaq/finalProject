package kr.or.nationRental.agencyEmployee.service;

import java.util.ArrayList;
import java.util.List;


public class BusinessTypeForAgencyEmployeeDto {
	private String agencyEmployeeId; //낙찰된 대행업체 직원 id
	private String agencyName; //대행업체명
	private List<String> nowAgencyBusinesstypeListForAgencyEmployee;
	private List<String> addAgencyBusinesstypeList;
	private List<String> allAgencyBusinesstypeList;
	
	/* 생성자 매서드 */
	public BusinessTypeForAgencyEmployeeDto() {
		this.nowAgencyBusinesstypeListForAgencyEmployee = new ArrayList<String>();
		this.addAgencyBusinesstypeList = new ArrayList<String>();
		this.allAgencyBusinesstypeList = new ArrayList<String>();
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

	public List<String> getNowAgencyBusinesstypeListForAgencyEmployee() {
		return nowAgencyBusinesstypeListForAgencyEmployee;
	}

	public void setNowAgencyBusinesstypeListForAgencyEmployee(List<String> nowAgencyBusinesstypeListForAgencyEmployee) {
		this.nowAgencyBusinesstypeListForAgencyEmployee = nowAgencyBusinesstypeListForAgencyEmployee;
	}

	public List<String> getAddAgencyBusinesstypeList() {
		return addAgencyBusinesstypeList;
	}

	public void setAddAgencyBusinesstypeList(List<String> addAgencyBusinesstypeList) {
		this.addAgencyBusinesstypeList = addAgencyBusinesstypeList;
	}

	public List<String> getAllAgencyBusinesstypeList() {
		return allAgencyBusinesstypeList;
	}

	public void setAllAgencyBusinesstypeList(List<String> allAgencyBusinesstypeList) {
		this.allAgencyBusinesstypeList = allAgencyBusinesstypeList;
	}

	@Override
	public String toString() {
		return "BusinessTypeForAgencyEmployeeDto [agencyEmployeeId=" + agencyEmployeeId + ", agencyName=" + agencyName
				+ ", nowAgencyBusinesstypeListForAgencyEmployee=" + nowAgencyBusinesstypeListForAgencyEmployee
				+ ", addAgencyBusinesstypeList=" + addAgencyBusinesstypeList + ", allAgencyBusinesstypeList="
				+ allAgencyBusinesstypeList + "]";
	}
}
