package kr.or.nationRental.donation.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class DonationService {
	@Autowired DonationDao donationDao;
	private static final Logger logger = LoggerFactory.getLogger(DonationService.class);


	//회원 : 기부 신청 등록하기
	public int insertDonation(DonationDto donationDto) {
		logger.info("---insertDonation");
		return donationDao.insertDonation(donationDto);
	}
	
	//회원 : 기부신청 리스트
	public List<DonationDto> selectListDonation(String memberId) {
		logger.info("---selectListDonation");
		return donationDao.selectListDonation(memberId);
	}
	
	//회원 : 기부신청 1개 게시글 보기
	public DonationDto viewDonation(DonationDto donationDto) {
		return donationDao.viewDonation(donationDto);
	}
}