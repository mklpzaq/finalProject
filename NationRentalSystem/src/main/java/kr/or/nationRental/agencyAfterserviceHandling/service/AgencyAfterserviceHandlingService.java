package kr.or.nationRental.agencyAfterserviceHandling.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.regularCheck.service.RegularCheckDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestDto;

@Service
public class AgencyAfterserviceHandlingService {
	@Autowired
	private AgencyAfterserviceHandlingDao agencyAfterserviceHandlingDao;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingService.class);
	
	public Map<String, Object> selectListAgencyAfterserviceHandling(int currentPage, int pagePerRow, String searchSelect, String searchWord, AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto){
		logger.debug("selectListAgencyAfterserviceHandling AgencyAfterserviceHandlingService");
		int beginRow = (currentPage-1)*pagePerRow;
		
		/*Map<String, Integer> map = new HashMap<String, Integer>();*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		map.put("agencyAfterserviceHandlingDto", agencyAfterserviceHandlingDto);
		/* searchSignal : 1 일경우 '검색버튼'을 누른경우가 되므로 
		 * selectAddressList() 메서드를 사용하여 list를 가져올때,
		 * searchWord와 일치하는 레코드 부분만 list에 저장하게 만들어 주어야 한다.
		 * 그러기 위해서는 searchWord 값 정보와
		 * searchSignal 정보에 따른 분기가 필요할지 모르므로 map에 넣어준다. 
		 * */
		
		map.put("searchSelect", searchSelect);
		map.put("searchWord", searchWord);
		logger.debug("searchSelect :" + searchSelect);
		logger.debug("searchWord :" + searchWord);
		
		/* beginRow와 pagePerRow값에 따라 SQL문의 LIMIT문이 작동될 것이고
		 * 그에 맞는 list가 반환된다.
		 * 검색 또한 마찬가지로 검색결과에 맞는 레코드들이
		 * SQL문의 LIMIT문에 의해 제한되어 list에 저장된다.
		 * (pagePerRow값이 10이면 list에 담기는 개수는 10개 레코드이다.)
		 * */
		List<AgencyAfterserviceHandlingDto> list = agencyAfterserviceHandlingDao.selectListAgencyAfterserviceHandling(map);
		logger.debug("list<AgencyAfterserviceHandlingDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = agencyAfterserviceHandlingDao.totalCountAgencyAfterserviceHandling(map);
		
		/* DB에 address 레코드 수가 1개도 존재하지 않는 경우 == 초기상태일때, 1페이지로 나오게 lastPage를 1로 초기화 한다.*/
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
	
	@Transactional
	public void insertAgencyAfterserviceHandling(AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto) {
		logger.debug("insertAgencyAfterserviceHandling AgencyAfterserviceHandlingService");
		agencyAfterserviceHandlingDao.insertAgencyAfterserviceHandling(agencyAfterserviceHandlingDto);
		/* is_agencyEmployee_accept_order 를 N->Y로 업댓해야됨 */
		agencyAfterserviceHandlingDao.updateUnitedAfterserviceRequestForAcceptOrder(agencyAfterserviceHandlingDto);
	}
	
	public AgencyBusinesstypeDto selectOneAgencyBusinesstypeForAjax(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("selectOneAgencyBusinesstypeForAjax AgencyAfterserviceHandlingService");
		return agencyAfterserviceHandlingDao.selectOneAgencyBusinesstypeForAjax(agencyBusinesstypeDto);
	}
	
	public List<AgencyAfterserviceHandlingDto> selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee(AgencyAfterserviceHandlingDto AgencyAfterserviceHandlingDto) {
		logger.debug("selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee AgencyAfterserviceHandlingService");
		return agencyAfterserviceHandlingDao.selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee(AgencyAfterserviceHandlingDto);
	}
	
	public List<AgencyBusinesstypeDto> selectListAgencyBusinesstypeDto(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto){
		logger.debug("selectListAgencyBusinesstypeDto AgencyAfterserviceHandlingService");
		return agencyAfterserviceHandlingDao.selectListAgencyBusinesstypeDto(unitedAfterserviceRequestDto);
	}
	
	public UnitedAfterserviceRequestDto selectOneUnitedAfterserviceRequestDto(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("selectOneUnitedAfterserviceRequestDto AgencyAfterserviceHandlingService");
		return agencyAfterserviceHandlingDao.selectOneUnitedAfterserviceRequestDto(unitedAfterserviceRequestDto);
	}
	
	public Map<String, Object> selectListUnitedAfterserviceRequest(int currentPage, int pagePerRow, String searchSelect, String searchWord, AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto){
		logger.debug("selectListUnitedAfterserviceRequest AgencyAfterserviceHandlingService");
		int beginRow = (currentPage-1)*pagePerRow;
		
		/*Map<String, Integer> map = new HashMap<String, Integer>();*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		map.put("agencyAfterserviceHandlingDto", agencyAfterserviceHandlingDto);
		
		/* searchSignal : 1 일경우 '검색버튼'을 누른경우가 되므로 
		 * selectAddressList() 메서드를 사용하여 list를 가져올때,
		 * searchWord와 일치하는 레코드 부분만 list에 저장하게 만들어 주어야 한다.
		 * 그러기 위해서는 searchWord 값 정보와
		 * searchSignal 정보에 따른 분기가 필요할지 모르므로 map에 넣어준다. 
		 * */
		
		map.put("searchSelect", searchSelect);
		map.put("searchWord", searchWord);
		logger.debug("searchSelect :" + searchSelect);
		logger.debug("searchWord :" + searchWord);
		
		/* beginRow와 pagePerRow값에 따라 SQL문의 LIMIT문이 작동될 것이고
		 * 그에 맞는 list가 반환된다.
		 * 검색 또한 마찬가지로 검색결과에 맞는 레코드들이
		 * SQL문의 LIMIT문에 의해 제한되어 list에 저장된다.
		 * (pagePerRow값이 10이면 list에 담기는 개수는 10개 레코드이다.)
		 * */
		List<UnitedAfterserviceRequestDto> list = agencyAfterserviceHandlingDao.selectListUnitedAfterserviceRequest(map);
		logger.debug("list<BoardDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = agencyAfterserviceHandlingDao.totalCountUnitedAfterserviceRequestDto(map);
		
		/* DB에 address 레코드 수가 1개도 존재하지 않는 경우 == 초기상태일때, 1페이지로 나오게 lastPage를 1로 초기화 한다.*/
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
	
}
