package kr.or.nationRental.donation.service;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.login.service.MemberDto;


@Service
public class DonationService {
	@Autowired DonationDao donationDao;
	private static final Logger logger = LoggerFactory.getLogger(DonationService.class);

	//회원 : 기부 신청 폼 불러오기 화면에 게스트일 경우 게스트의 정보를 가져온다.
	public MemberDto setGuestId(MemberDto memberDto){
		logger.debug("setGuestId BoardService");
		UUID uuid = UUID.randomUUID();
		logger.debug("uuid : " + uuid);
		String strUuid = uuid + "";
		strUuid = strUuid.substring(0, 8);
		String guestId = "guest@" + strUuid;
		memberDto.setMemberId(guestId);
		return memberDto;
	}
	//회원 : 기부 신청 등록하기
	public int insertDonation(DonationDto donationDto) {
		logger.info("---insertDonation");
		return donationDao.insertDonation(donationDto);
		
	}
}
