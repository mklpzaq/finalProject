package kr.or.nationRental.administrator.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.functionary.service.FunctionaryDto;

@Repository
public class AdministratorDao {
	private static final Logger logger = LoggerFactory.getLogger(AdministratorDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	// final : 객체 참조변수를 변경하지 못하게 하는 접근제한자
	//final String NS = "kr.or.nationRental.administrator.service.AdministratorMapper.";
	final String NS = "kr.or.nationRental.administrator.service.AdministratorMapper.";
	

	//관리자를 등록하는 메서드
	//입력변수로 Administrator 클래스 데이터 타입을 받는다.
	public int insertAdministrator(AdministratorDto administratorDto) {
		logger.info("---insertAdmin");
		int row = sqlSession.insert(NS+"insertAdministrator", administratorDto);
		return row;
	}
	
	//관리자 계정 목록
	public List<AdministratorDto> selectListAdministrator() {
		return sqlSession.selectList(NS+"selectListAdministrator");
	}
	
}	