package kr.or.nationRental.unitedAfterserviceRequest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.regularCheck.service.RegularCheckDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;

@Service
public class UnitedAfterserviceRequestService {
	@Autowired
	private UnitedAfterserviceRequestDao unitedAfterserviceRequestDao;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestService.class);
	
	/*public List<RegularCheckDto> selectListRegularCheck() {
		logger.debug("selectListRegularCheck UnitedAfterserviceRequestService");
		return unitedAfterserviceRequestDao.selectListRegularCheck();
	}*/
	
	public Map<String, Object> selectListRegularCheck(int currentPage, int pagePerRow, String searchSelect, String searchWord){
		logger.debug("selectListRegularCheck UnitedAfterserviceRequestService");
		int beginRow = (currentPage-1)*pagePerRow;
		
		/*Map<String, Integer> map = new HashMap<String, Integer>();*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
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
		List<RegularCheckDto> list = unitedAfterserviceRequestDao.selectListRegularCheck(map);
		logger.debug("list<BoardDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = unitedAfterserviceRequestDao.totalCountRegularCheck(map);
		
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
	
	
	public Map<String, Object> selectListUnitedAfterserviceRequest(int currentPage, int pagePerRow, String searchSelect, String searchWord){
		logger.debug("selectListUnitedAfterserviceRequest UnitedAfterserviceRequestService");
		int beginRow = (currentPage-1)*pagePerRow;
		
		/*Map<String, Integer> map = new HashMap<String, Integer>();*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
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
		List<UnitedAfterserviceRequestDto> list = unitedAfterserviceRequestDao.selectListUnitedAfterserviceRequest(map);
		logger.debug("list<BoardDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = unitedAfterserviceRequestDao.totalCountUnitedAfterserviceRequestDto(map);
		
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
	
	public void insertUnitedAfterserviceRequest(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("insertUnitedAfterserviceRequest UnitedAfterserviceRequestService");
		unitedAfterserviceRequestDao.insertUnitedAfterserviceRequest(unitedAfterserviceRequestDto);
	}
	
	public AgencyDto selectOneAgencyForAjax(AgencyDto agencyDto) {
		logger.debug("selectOneAgencyForAjax UnitedAfterserviceRequestService");
		return unitedAfterserviceRequestDao.selectOneAgencyForAjax(agencyDto);
	}
	
	public List<AgencyDto> selectListAgencyDto(String functionaryId) {
		logger.debug("selectListAgencyDto UnitedAfterserviceRequestService");
		/* 공무원(Functionary) 이 속한 지자체 기관 구하기 */
		FunctionaryDto functionaryDto = unitedAfterserviceRequestDao.selectOneFunctionaryForListAgency(functionaryId);
		logger.debug(functionaryDto.toString());
		/* 공무원(Functionary) 이 속한 지자체 기관과 계약한 대행업체(agency) List 구하기 */
		List<AgencyDto> list =  unitedAfterserviceRequestDao.selectListAgencyDto(functionaryDto);
		if(!list.isEmpty()) {
			logger.debug(list.toString());
		}
		return list;
	}
	
	
	public UnitedAfterserviceRequestDto selectOneUnitedAfterserviceRequestDtoForInsert(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto, String beforePageCode){
		logger.debug("selectOneUnitedAfterserviceRequestDtoForInsert UnitedAfterserviceRequestDto");
		if(beforePageCode.equals("반납AS")) {
			unitedAfterserviceRequestDto = unitedAfterserviceRequestDao.selectOneUnitedAfterserviceRequestDtoForInsert(unitedAfterserviceRequestDto);
		}else if(beforePageCode.equals("점검AS")) {
			unitedAfterserviceRequestDto = unitedAfterserviceRequestDao.selectOneUnitedAfterserviceRequestDtoForInsertRegularCheckAS(unitedAfterserviceRequestDto);
		}
		
		return unitedAfterserviceRequestDto;
	}
	
	public Map<String, Object> selectListReturnGoodsfacilityInfo(int currentPage, int pagePerRow, String searchSelect, String searchWord){
		logger.debug("selectListReturnGoodsfacilityInfo UnitedAfterserviceRequestService");
		int beginRow = (currentPage-1)*pagePerRow;
		
		/*Map<String, Integer> map = new HashMap<String, Integer>();*/
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
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
		List<ReturnGoodsfacilityInfoDto> list = unitedAfterserviceRequestDao.selectListReturnGoodsfacilityInfo(map);
		logger.debug("list<BoardDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = unitedAfterserviceRequestDao.totalCountReturnGoodsfacilityInfo(map);
		
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
