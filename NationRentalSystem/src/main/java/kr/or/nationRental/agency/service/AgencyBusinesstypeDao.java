package kr.or.nationRental.agency.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AgencyBusinesstypeDao {
	private static final Logger logger = LoggerFactory.getLogger(AgencyBusinesstypeDao.class);
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	final String NS = "kr.or.nationRental.agency.service.AgencyBusinesstypeMapper.";
	@Autowired private SqlSessionTemplate sqlSession;

	//업종 목록 페이징
	public List<AgencyBusinesstypeDto> selectListAgencyBusinesstype(Map<String, Object> map) {
		return sqlSession.selectList(NS+"selectListAgencyBusinesstype", map);
	}

	//업종 목록
	public int totalCountAgencyBusinesstype(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"totalCountAgencyBusinesstype", map);
	}

	//업종 등록
	public int insertAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.info("---insertAgencyBusinesstype");
		int row = sqlSession.insert(NS+"insertAgencyBusinesstype", agencyBusinesstypeDto);
		return row;
	}
	
	//업종 수정 폼 불러오기
	public AgencyBusinesstypeDto updateAgencyBusinesstypeForm(AgencyBusinesstypeDto agencyBusinesstypeDto){
		return sqlSession.selectOne(NS+"updateAgencyBusinesstypeForm", agencyBusinesstypeDto);
	}
	
	//업종 수정
	public int updateAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto) { 
		return sqlSession.update(NS+"updateAgencyBusinesstype", agencyBusinesstypeDto);
	}
	
	//업종 삭제
	public void deleteAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeCode) {
		sqlSession.delete(NS + "deleteAgencyBusinesstype", agencyBusinesstypeCode);	
	}
	
}
