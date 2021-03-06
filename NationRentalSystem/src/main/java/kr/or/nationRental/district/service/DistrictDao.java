package kr.or.nationRental.district.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.administrator.service.AdministratorDto;

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
	
	//행정구역 읍면동 목록
	public List<DistrictDto> selectListEupmyeon() {
		logger.info("---selectListEupmyeon");
		return sqlSession.selectList(NS+"selectListEupmyeon");
	}
	
	//시도 등록
	public int insertSido(DistrictDto districtDto) {
		logger.info("---insertSido");
		int row = sqlSession.insert(NS+"insertSido", districtDto);
		return row;
	}
	
	//시군구 등록
	public int insertSigungu(DistrictDto districtDto) {
		logger.info("---insertSigungu");
		int row = sqlSession.insert(NS+"insertSigungu",districtDto);
		return row;
	}
	
	//읍면동 등록
	public int insertEupmyeon(DistrictDto districtDto) {
		logger.info("---insertEupmyeon");
		int row = sqlSession.insert(NS+"insertEupmyeon",districtDto);
		return row;
	}
	
}
