package kr.or.nationRental.goodsFacility.service;




import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsFacilityFileDao {
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityFileDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "kr.or.nationRental.goodsFacility.service.GoodsFacilityFileMapper.";
	
	public int insertGoodsFacilityFile(GoodsFacilityFile goodsFacilityFile) {
		logger.debug("GoodsFacilityFileDao insertGoodsFacilityFile : " + goodsFacilityFile.toString());
		
		int row = sqlSession.insert(NS+"insertGoodsFacilityFile", goodsFacilityFile);
		return row;
	}
	
	
}
