package kr.or.nationRental.functionary.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.login.service.MemberDto;

@Repository
public class FunctionaryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.functionary.service.FunctionaryMapper.";
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryDao.class);
	
	public int insertFunctionary(FunctionaryDto functionaryDto) {	
		logger.debug("FunctionaryDao - insertFunctionary - functionaryDto : " + functionaryDto);
		int row = sqlSession.insert(NS+"insertFunctionary", functionaryDto);	
		return row;
	}
	
	public int insertFunctionaryMoveInout(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertFunctionaryMoveInout - functionaryDto : " + functionaryDto);
		int row = sqlSession.insert(NS+"insertFunctionaryMoveInout", functionaryDto);
		return row;
	}
	
	public List<FunctionaryDto> selectListFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - selectListFunctionary - map : " + map.toString());
		return sqlSession.selectList(NS+"selectListFunctionary", map);
	}
	
	public int totalCountFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - totalCountFunctionary - map : " + map);
		return sqlSession.selectOne(NS+"totalCountFunctionary", map);
	}
	
	public FunctionaryDto viewFunctionaryInfo(String functionaryId) {
		logger.debug("FunctionaryDao - viewFunctionaryInfo - functionaryId : " + functionaryId);
		return sqlSession.selectOne(NS+"viewFunctionaryInfo", functionaryId);
	}
	
	public int updateFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - updateFunctionnary - functionaryDto : " + functionaryDto);
		return sqlSession.update(NS+"updateFunctionnary", functionaryDto);
	}
	
	public List<FunctionaryDto> selectAdminagency(String checkAdminagency) {
		logger.debug("FunctionaryDao - selectAdminagency - checkAdminagency : " + checkAdminagency);
		return sqlSession.selectList(NS+"selectAdminagency", checkAdminagency);		
	}
	
	public FunctionaryDto selectFunctionaryMoveInout(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectFunctionaryMoveInout - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectFunctionaryMoveInout", fuctionaryId);
	}

	public void updateFuctionaryMoveInout(FunctionaryDto returnfunctionaryMoveInoutCode) {
		logger.debug("FunctionaryDao - updateFuctionaryMoveInout - returnfunctionaryMoveInoutCode : " + returnfunctionaryMoveInoutCode);
		sqlSession.update(NS+"updateFuctionaryMoveInout", returnfunctionaryMoveInoutCode);
	}

	public void deleteFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - deleteFunctionnary - functionaryDto : " + functionaryDto);
		sqlSession.delete(NS+"deleteFunctionnary", functionaryDto);
	}

	public void insertStorageFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertStorageFunctionary - functionaryDto : " + functionaryDto);
		sqlSession.insert(NS+"insertStorageFunctionary", functionaryDto);
	}

	//administratorid찾기
	public String administratorIdSelect(MemberDto memberDto) {
		logger.debug("FunctionaryDao - administratorIdSelect - memberDto : " + memberDto);
		return sqlSession.selectOne(NS+"administratorIdSelect", memberDto);
	}
	
	//agencyEmployeeid찾기
	public String agencyEmployeeIdSelect(MemberDto memberDto) {
		logger.debug("FunctionaryDao - agencyEmployeeIdSelect - memberDto : " + memberDto);
		return sqlSession.selectOne(NS+"agencyEmployeeIdSelect", memberDto);
	}
	//citizenid찾기
	public String citizenIdSelect(MemberDto memberDto) {
		logger.debug("FunctionaryDao - citizenIdSelect - memberDto : " + memberDto);
		return sqlSession.selectOne(NS+"citizenIdSelect", memberDto);
	}
	//functionaryid찾기
	public String functionaryIdSelect(MemberDto memberDto) {
		logger.debug("FunctionaryDao - functionaryIdSelect - memberDto : " + memberDto);
		return sqlSession.selectOne(NS+"functionaryIdSelect", memberDto);
	}

	public int administratorIdCheck(MemberDto memberDto) {
		
		return sqlSession.selectOne(NS+"administratorIdCheck", memberDto);
	}

	public int agencyEmployeeIdCheck(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"agencyEmployeeIdCheck", memberDto);
	}

	public int citizenIdCheck(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"citizenIdCheck", memberDto);
	}

	public int functionaryIdCheck(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"functionaryIdCheck", memberDto);
	}
	
	

	/*public FunctionaryDto selectForStorageFunctionary(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectForStorageFunctionary - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectForStorageFunctionary", fuctionaryId);
	}*/
}
