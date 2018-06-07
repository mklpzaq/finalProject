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
	final String NS = "kr.or.nationRental.sidoSigunguEupmyeon.service.SidoSigunguEupmyeonMapper.";

	//행정구역 목록
		public List<DistrictDto> selectListDistrict() {
			logger.info("---selectListDistrict");
			return sqlSession.selectList(NS+"selectListDistrict");
		}
}
