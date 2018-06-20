package kr.or.nationRental.returnGoodsfacilityInfo.service;

import java.sql.Date;

public class DateDto {
	private Date startDate;
	private Date endDate;
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "DateDto [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
	

}
