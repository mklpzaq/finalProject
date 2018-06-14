package kr.or.nationRental.adminagency.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;


@Repository
public class AdminagencyDao {
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminagencyDao.class);
	final String NS = "kr.or.nationRental.adminagency.service.AdminagencyMapper.";

	//행정기관 전체 목록  페이징
	public List<AdminagencyDto> selectListAdminagency(Map<String, Object> map) {
		return sqlSession.selectList(NS+"selectListAdminagency", map);
	}

	//행정기관 카테고리 전체 목록
	public int totalCountAdminagency(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"totalCountAdminagency", map);
	}
	
	//행정기관 신규등록
	public int insertAdminagency(AdminagencyDto adminagencyDto) {
		logger.info("---insertAdminagency");
		int row = sqlSession.insert(NS+"insertAdminagency", adminagencyDto);
		return row;
	}

}
