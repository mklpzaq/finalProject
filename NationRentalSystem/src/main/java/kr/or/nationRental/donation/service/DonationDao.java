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
	
	//회원 : 기부 수정
	public int updateDonation(DonationDto donationDto) { 
		logger.info("---updateDonation");
		return sqlSession.update(NS+"updateDonation", donationDto);
	}
	
	//회원 : 기부 취소(삭제)
	public void deleteDonation(DonationDto donationDto) {
		sqlSession.delete(NS + "deleteDonation", donationDto);
	}
	
	//공무원 : 기부 승인대기 리스트
	public List<DonationDto> approvalListDonation(){
		logger.debug("approvalListDonation");
		return sqlSession.selectList(NS+"approvalListDonation");
	}
	
	//공무원 : 기부 승인대기 1개 게시물 보기
	public DonationDto viewApprovalDonation(DonationDto donationDto) {
		return sqlSession.selectOne(NS + "viewDonation", donationDto);	
	}
	
	//공무원 : 기부 승인(업데이트)
	public int updateApprovalDonation(DonationDto donationDto) { 
		logger.info("---updateAdmupdateApprovalDonationinistrator");
		return sqlSession.update(NS+"updateApprovalDonation", donationDto);
	}
}
