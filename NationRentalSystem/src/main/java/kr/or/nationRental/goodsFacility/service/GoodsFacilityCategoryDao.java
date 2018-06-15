package kr.or.nationRental.goodsFacility.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsFacilityCategoryDao {
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityCategoryDao.class);
	@Autowired private SqlSessionTemplate sqlSession;
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	final String NS = "kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryMapper.";

	//물품시설 카테고리 전체 목록  페이징 및 검색
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategory(Map<String, Object> map) {
		logger.info("---selectListGoodsFacilityCategory");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategory", map);
	}

	//물품시설 카테고리 전체 목록 페이징 및 검색
	public int totalCountGoodsFacilityCategory(Map<String, Object> map) {
		logger.info("---totalCountGoodsFacilityCategory");
		return sqlSession.selectOne(NS+"totalCountGoodsFacilityCategory", map);
	}

	//물품시설 1차 카테고리 목록 보기 페이징 및 검색
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryOne(Map<String, Object> map) {
		logger.info("---selectListGoodsFacilityCategoryOne");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryOne", map);
	}
	
	//물품시설 1차 카테고리 목록 보기 페이징 및 검색
	public int totalCountGoodsFacilityCategoryOne(Map<String, Object> map) {
		logger.info("---totalCountGoodsFacilityCategoryOne");
		return sqlSession.selectOne(NS+"totalCountGoodsFacilityCategoryOne", map);
	}
		
	//물품시설 2차 카테고리 목록 보기 페이징 및 검색
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryTwo(Map<String, Object> map) {
		logger.info("---selectListGoodsFacilityCategoryTwo");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryTwo", map);
	}
	
	//물품시설 2차 카테고리 목록 보기 페이징 및 검색
	public int totalCountGoodsFacilityCategoryTwo(Map<String, Object> map) {
		logger.info("---totalCountGoodsFacilityCategoryTwo");
		return sqlSession.selectOne(NS+"totalCountGoodsFacilityCategoryTwo", map);
	}
	
	//물품시설 3차 카테고리 목록 보기 페이징 및 검색
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryThree(Map<String, Object> map) {
		logger.info("---selectListGoodsFacilityCategoryThree");
		return sqlSession.selectList(NS+"selectListGoodsFacilityCategoryThree", map);
	}
	
	//물품시설 3차 카테고리 목록 보기 페이징 및 검색
	public int totalCountGoodsFacilityCategoryThree(Map<String, Object> map) {
		logger.info("---totalCountGoodsFacilityCategoryThree");
		return sqlSession.selectOne(NS+"totalCountGoodsFacilityCategoryThree", map);
	}
	
	
	
	//1차 리스트와 2차 리스트를 조인하기 위해 새로 만듦
	//조인리스트 1차 카테고리
	public List<GoodsFacilityCategoryDto> selectJoinListGoodsFacilityCategoryOne() {
	logger.info("---selectJoinListGoodsFacilityCategoryOne");
	return sqlSession.selectList(NS+"selectJoinListGoodsFacilityCategoryOne");
	}
		
	//1차 리스트와 2차 리스트, 3차 리스트를  조인하기 위해 새로 만듦
	//조인리스트 1차 카테고리
	public List<GoodsFacilityCategoryDto> selectJoinListGoodsFacilityCategoryTwo() {
		logger.info("---selectJoinListGoodsFacilityCategoryTwo");
		return sqlSession.selectList(NS+"selectJoinListGoodsFacilityCategoryTwo");
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
