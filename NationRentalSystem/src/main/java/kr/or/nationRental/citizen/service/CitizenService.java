package kr.or.nationRental.citizen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.district.service.DistrictDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;

@Service
public class CitizenService {
	
	@Autowired
	private CitizenDao citizenDao;

	private static final Logger logger = LoggerFactory.getLogger(CitizenService.class);
	

	public Map<String, Object> selectBoxes(DistrictDto districDto) {
		logger.debug("CitizenService selectBoxes : " + "," + districDto.toString());		
		
		List<DistrictDto> districtList = citizenDao.getdistrict();
		logger.debug("List<DistrictDto> : " + districtList);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("districtList", districtList);
	
		return map;
	}	
	
	public void insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenService insertCitizen : " + citizenDto.toString());
		
		citizenDao.insertCitizen(citizenDto);
		
	}

	public Map<String, Object> getCitizenList(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("CitizenService getCitizenList :");
		int beginRow = (currentPage-1)*pagePerRow;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		logger.debug("searchOption :" + searchOption);
		logger.debug("keyword :" + keyword);
		
		List<CitizenDto> list = citizenDao.getCitizenList(map);
		logger.debug("List<CitizenDto> : " + list);
		
		int total = citizenDao.totalCountCitizen(map);
		
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

	
	public CitizenDto getOneCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenService getOneCitizen : " +citizenDto.toString());
		
		CitizenDto oneCitizen = citizenDao.getOneCitizen(citizenDto);
		
		return oneCitizen;
	}

	public CitizenDto updateCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenService updateCitizen : " +citizenDto.toString());
		
		CitizenDto updateCitizen = citizenDao.updateCitizen(citizenDto);
		
		return updateCitizen;
	}

	public int updateOneCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenService updateOneCitizen : " +citizenDto.toString());
		
		return citizenDao.updateOneCitizen(citizenDto);
	}

	

	
	

	
	
	
	
}
