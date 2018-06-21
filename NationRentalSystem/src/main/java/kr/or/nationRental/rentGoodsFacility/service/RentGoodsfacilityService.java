package kr.or.nationRental.rentGoodsFacility.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;

@Service
public class RentGoodsfacilityService {
	
	@Autowired
	private RentGoodsfacilityDao rentGoodsfacilityDao;
	
	private static final Logger logger = LoggerFactory.getLogger(RentGoodsfacilityService.class);
	
	public GoodsFacilityDto insertApplicationRentForm(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("RentGoodsfacilityService insertApplicationRentForm : " + goodsFacilityDto.toString());
		
		goodsFacilityDto = rentGoodsfacilityDao.selectGoodsFacilityInfo(goodsFacilityDto);
		
		return goodsFacilityDto;
	}

	public void insertApplicationRent(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("RentGoodsfacilityService insertApplicationRentForm POST : " + rentGoodsfacilityDto.toString());
		rentGoodsfacilityDao.insertApplicationRent(rentGoodsfacilityDto);		
	}

	public Map<String, Object> getApplicationList(int currentPage, int pagePerRow, String searchOption, String keyword, CitizenDto citizenDto) {
		logger.debug("RentGoodsfacilityService getApplicationList :");
		int beginRow = (currentPage-1)*pagePerRow;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("citizenDto", citizenDto);
		logger.debug("searchOption :" + searchOption);
		logger.debug("keyword :" + keyword);
		logger.debug("citizenDto :" + citizenDto);
		
		List<RentGoodsfacilityDto> list = rentGoodsfacilityDao.getApplicationList(map);
		logger.debug("RentGoodsfacilityService RentGoodsfacilityDto list :" + list.toString());
		int total = rentGoodsfacilityDao.totalCountRentFORM(map);
		
		int lastPage = 0;
		if(0 == total) {
			lastPage = 1;
		}else if(total%pagePerRow == 0) {
			lastPage = total/pagePerRow;
		}else {
			lastPage = total/pagePerRow + 1;
		}
		/* 페이지가 5개 단위씩 보이게 하는 계산식 */
		int temp = (currentPage - 1)/5;
		int beginPageNumForCurrentPage = temp * 5 + 1;
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("beginPageNumForCurrentPage", beginPageNumForCurrentPage);
		
		return returnMap;		
	}

	public RentGoodsfacilityDto updateRentApplication(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("RentGoodsfacilityService updateRentApplication  :" + rentGoodsfacilityDto.toString());
		
		return rentGoodsfacilityDao.updateRentApp(rentGoodsfacilityDto);
	}

	public int updateApplication(RentGoodsfacilityDto rentGoodsfacilityDto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
