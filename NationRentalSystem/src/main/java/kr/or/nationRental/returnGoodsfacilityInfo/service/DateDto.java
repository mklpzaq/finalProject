package kr.or.nationRental.returnGoodsfacilityInfo.service;


public class DateDto {
	private String startDate;
	private String endDate;
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "DateDto [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
}
