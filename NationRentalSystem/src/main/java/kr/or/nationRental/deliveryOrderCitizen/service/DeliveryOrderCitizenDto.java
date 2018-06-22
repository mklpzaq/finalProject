package kr.or.nationRental.deliveryOrderCitizen.service;

import java.sql.Date;

public class DeliveryOrderCitizenDto {
	private int deliveryOrderCitizenCode; //배달신청관리코드
	private int goodsfacilityRentalCode; //시설/물품 대여/예약 신청코드
	private String classifyRentalState; //대여/반납상태 구분
	private int goodsfacilityCode; //시설/물품 개별관리코드
	private String citizenId; //시민ID
	private int adminagencyCode; //행정기관코드
	private String sendAddressSido; //보내는쪽 시도명
	private String sendAddressSigungu; //보내는쪽 시군구명
	private String sendAddressEupmyeon; //보내는쪽 읍면동명
	private String sendAddressSangse; //보내는쪽 상세주소
	private String receiveAddressSido; //받는 쪽 시도
	private String receiveAddressSigungu; //받는쪽 시군구명
	private String receiveAddressEupmyeon; //받는쪽 읍면동명
	private String receiveAddressSangse; //받는쪽 상세주소
	private Date deliveryOrderCitizenDate; //배달신청일
	private String isCanceledDelivery; //배달신청취소 여부
	public int getDeliveryOrderCitizenCode() {
		return deliveryOrderCitizenCode;
	}
	public void setDeliveryOrderCitizenCode(int deliveryOrderCitizenCode) {
		this.deliveryOrderCitizenCode = deliveryOrderCitizenCode;
	}
	public int getGoodsfacilityRentalCode() {
		return goodsfacilityRentalCode;
	}
	public void setGoodsfacilityRentalCode(int goodsfacilityRentalCode) {
		this.goodsfacilityRentalCode = goodsfacilityRentalCode;
	}
	public String getClassifyRentalState() {
		return classifyRentalState;
	}
	public void setClassifyRentalState(String classifyRentalState) {
		this.classifyRentalState = classifyRentalState;
	}
	public int getGoodsfacilityCode() {
		return goodsfacilityCode;
	}
	public void setGoodsfacilityCode(int goodsfacilityCode) {
		this.goodsfacilityCode = goodsfacilityCode;
	}
	public String getCitizenId() {
		return citizenId;
	}
	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}
	public int getAdminagencyCode() {
		return adminagencyCode;
	}
	public void setAdminagencyCode(int adminagencyCode) {
		this.adminagencyCode = adminagencyCode;
	}
	public String getSendAddressSido() {
		return sendAddressSido;
	}
	public void setSendAddressSido(String sendAddressSido) {
		this.sendAddressSido = sendAddressSido;
	}
	public String getSendAddressSigungu() {
		return sendAddressSigungu;
	}
	public void setSendAddressSigungu(String sendAddressSigungu) {
		this.sendAddressSigungu = sendAddressSigungu;
	}
	public String getSendAddressEupmyeon() {
		return sendAddressEupmyeon;
	}
	public void setSendAddressEupmyeon(String sendAddressEupmyeon) {
		this.sendAddressEupmyeon = sendAddressEupmyeon;
	}
	public String getSendAddressSangse() {
		return sendAddressSangse;
	}
	public void setSendAddressSangse(String sendAddressSangse) {
		this.sendAddressSangse = sendAddressSangse;
	}
	public String getReceiveAddressSido() {
		return receiveAddressSido;
	}
	public void setReceiveAddressSido(String receiveAddressSido) {
		this.receiveAddressSido = receiveAddressSido;
	}
	public String getReceiveAddressSigungu() {
		return receiveAddressSigungu;
	}
	public void setReceiveAddressSigungu(String receiveAddressSigungu) {
		this.receiveAddressSigungu = receiveAddressSigungu;
	}
	public String getReceiveAddressEupmyeon() {
		return receiveAddressEupmyeon;
	}
	public void setReceiveAddressEupmyeon(String receiveAddressEupmyeon) {
		this.receiveAddressEupmyeon = receiveAddressEupmyeon;
	}
	public String getReceiveAddressSangse() {
		return receiveAddressSangse;
	}
	public void setReceiveAddressSangse(String receiveAddressSangse) {
		this.receiveAddressSangse = receiveAddressSangse;
	}
	public Date getDeliveryOrderCitizenDate() {
		return deliveryOrderCitizenDate;
	}
	public void setDeliveryOrderCitizenDate(Date deliveryOrderCitizenDate) {
		this.deliveryOrderCitizenDate = deliveryOrderCitizenDate;
	}
	public String getIsCanceledDelivery() {
		return isCanceledDelivery;
	}
	public void setIsCanceledDelivery(String isCanceledDelivery) {
		this.isCanceledDelivery = isCanceledDelivery;
	}
	@Override
	public String toString() {
		return "DeliveryOrderCitizenDto [deliveryOrderCitizenCode=" + deliveryOrderCitizenCode
				+ ", goodsfacilityRentalCode=" + goodsfacilityRentalCode + ", classifyRentalState="
				+ classifyRentalState + ", goodsfacilityCode=" + goodsfacilityCode + ", citizenId=" + citizenId
				+ ", adminagencyCode=" + adminagencyCode + ", sendAddressSido=" + sendAddressSido
				+ ", sendAddressSigungu=" + sendAddressSigungu + ", sendAddressEupmyeon=" + sendAddressEupmyeon
				+ ", sendAddressSangse=" + sendAddressSangse + ", receiveAddressSido=" + receiveAddressSido
				+ ", receiveAddressSigungu=" + receiveAddressSigungu + ", receiveAddressEupmyeon="
				+ receiveAddressEupmyeon + ", receiveAddressSangse=" + receiveAddressSangse
				+ ", deliveryOrderCitizenDate=" + deliveryOrderCitizenDate + ", isCanceledDelivery="
				+ isCanceledDelivery + "]";
	}
	
}
