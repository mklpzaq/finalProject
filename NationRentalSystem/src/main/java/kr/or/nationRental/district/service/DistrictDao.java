package kr.or.nationRental.district.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DistrictDao {
	private static final Logger logger = LoggerFactory.getLogger(DistrictDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	final String NS = "kr.or.nationRental.district.service.DistrictMapper.";

	//행정구역 전체 목록
	public List<DistrictDto> selectListDistrict() {
		logger.info("---selectListDistrict");
		return sqlSession.selectList(NS+"selectListDistrict");
	}
	
	//행정구역 시도 목록
	public List<DistrictDto> selectListSido() {
		logger.info("---selectListSido");
		return sqlSession.selectList(NS+"selectListSido");
	}
	
	//행정구역 시군구 목록
	public List<DistrictDto> selectListSigungu() {
		logger.info("---selectListSigungu");
		return sqlSession.selectList(NS+"selectListSigungu");
	}
}
