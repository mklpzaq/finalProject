package kr.or.nationRental.donation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DonationDao {
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(DonationDao.class);
	final String NS = "kr.or.nationRental.donation.service.DonationMapper.";

	//회원 : 기부 신청 등록
	public int insertDonation(DonationDto donationDto) {
		logger.info("---insertDonation");
		int row = sqlSession.insert(NS+"insertDonation", donationDto);
		return row;
	}

	//회원 : 기부신청 리스트
	public List<DonationDto> selectListDonation(String memberId){
		logger.debug("selectListDonation");
		return sqlSession.selectList(NS+"selectListDonation", memberId);
	}
	
	//회원 : 기부신청 1개 게시글 보기
	public DonationDto viewDonation(DonationDto donationDto) {
		return sqlSession.selectOne(NS + "viewDonation", donationDto);	
	}
	
}
