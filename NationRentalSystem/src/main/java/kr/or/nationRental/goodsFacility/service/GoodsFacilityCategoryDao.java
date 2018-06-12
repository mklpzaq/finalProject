package kr.or.nationRental.goodsFacility.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.district.service.DistrictDto;


@Repository
public class GoodsFacilityCategoryDao {
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityCategoryDao.class);
	@Autowired private SqlSessionTemplate sqlSession;
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	final String NS = "kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryMapper.";

	//물품시설 카테고리 전체 목록
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategory() {
		logger.info("---selectListGoodsFacilityCategory");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategory");
	}
	
	//물품시설 1차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryOne() {
		logger.info("---selectListGoodsFacilityCategoryOne");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryOne");
	}
	
	//물품시설 2차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryTwo() {
		logger.info("---selectListGoodsFacilityCategoryTwo");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryTwo");
	}
	
	//물품시설 3차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryThree() {
		logger.info("---selectListGoodsFacilityCategoryThree");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryThree");
	}
	
	//1차 카테고리 등록
	public int insertGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("---insertGoodsFacilityCategoryOne");
		int row = sqlSession.insert(NS+"insertGoodsFacilityCategoryOne", goodsFacilityCategoryDto);
		return row;
	}
	
	//2차 카테고리 등록
	public int insertGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("---insertGoodsFacilityCategoryTwo");
		int row = sqlSession.insert(NS+"insertGoodsFacilityCategoryTwo",goodsFacilityCategoryDto);
		return row;
	}
	
	//3차 카테고리 등록
	public int insertGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("---insertGoodsFacilityCategoryThree");
		int row = sqlSession.insert(NS+"insertGoodsFacilityCategoryThree",goodsFacilityCategoryDto);
		return row;
	}
	
	//1차 카테고리 삭제
	public void deleteGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsfacilityOneCode) {
		sqlSession.delete(NS + "deleteGoodsFacilityCategoryOne", goodsfacilityOneCode);	
	}
	
//2차 카테고리 삭제
	public void deleteGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsfacilityTwoCode) {
		sqlSession.delete(NS + "deleteGoodsFacilityCategoryTwo", goodsfacilityTwoCode);	
	}
	
	//3차 카테고리 삭제
	public void deleteGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsfacilityThreeCode) {
		sqlSession.delete(NS + "deleteGoodsFacilityCategoryThree", goodsfacilityThreeCode);	
	}
}
