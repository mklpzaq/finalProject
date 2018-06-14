package kr.or.nationRental.adminagency.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminagencyDao {
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminagencyDao.class);
	final String NS = "kr.or.nationRental.adminagency.service.AdminagencyMapper.";

	//물품시설 카테고리 전체 목록  페이징
		public List<AdminagencyDto> selectListAdminagency(Map<String, Object> map) {
			return sqlSession.selectList(NS+"selectListAdminagency", map);
		}

		//물품시설 카테고리 전체 목록
		public int totalCountAdminagency(Map<String, Object> map) {
			return sqlSession.selectOne(NS+"totalCountAdminagency", map);
		}

}
