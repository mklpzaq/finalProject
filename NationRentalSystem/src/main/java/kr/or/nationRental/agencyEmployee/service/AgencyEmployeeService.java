package kr.or.nationRental.agencyEmployee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.nationRental.functionary.service.FunctionaryDto;


@Service
public class AgencyEmployeeService {
	@Autowired
	private AgencyEmployeeDao agencyEmployeeDao;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeService.class);
	
	public List<FunctionaryDto> selectListFunctionaryForAgencyEmployee(FunctionaryDto functionaryDto) {
		logger.debug("selectListFunctionaryForAgencyEmployee agencyEmployeeDao");
		return agencyEmployeeDao.selectListFunctionaryForAgencyEmployee(functionaryDto);
	}
	
	public Map<String, Object> selectListAgencyEmployee(int currentPage, int pagePerRow, String searchSelect, String searchWord, AgencyEmployeeDto agencyEmployeeDto){
		logger.debug("selectListAgencyEmployee AgencyEmployeeService");
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
		
		/* 현재 로그인한 대행업체 직원의 업체명 정보를 가져와야 한다. */
		String agencyName = agencyEmployeeDao.getAgencyName(agencyEmployeeDto);
		logger.debug("agencyName : " + agencyName);
		map.put("agencyName", agencyName);
		
		
		/* beginRow와 pagePerRow값에 따라 SQL문의 LIMIT문이 작동될 것이고
		 * 그에 맞는 list가 반환된다.
		 * 검색 또한 마찬가지로 검색결과에 맞는 레코드들이
		 * SQL문의 LIMIT문에 의해 제한되어 list에 저장된다.
		 * (pagePerRow값이 10이면 list에 담기는 개수는 10개 레코드이다.)
		 * */
		List<AgencyEmployeeDto> list = agencyEmployeeDao.selectListAgencyEmployee(map);
		logger.debug("list<AgencyEmployeeDto> : " + list);
		/* 검색을 하였다면 검색조건에 맞는 레코드 개수가 반환되고,
		 * 검색을 하지 않았다면 DB에 존재하는 모든 address 레코드 개수가 반환된다. 
		 *  */
		int total = agencyEmployeeDao.totalCountAgencyEmployee(map);
		
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
	
	
	/* 회원 탈퇴 */
	@Transactional
	public void deleteAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto, HttpSession session) {
		logger.debug("deleteAgencyEmployee AgencyEmployeeService");
		agencyEmployeeDto = agencyEmployeeDao.selectOneAgencyEmployee(agencyEmployeeDto);
		/* begin 탈퇴하기전 1년 보관 스토리지 추가 */
		agencyEmployeeDto.setAgencyEmployeeInjeungNum(agencyEmployeeDao.getAgencyCode(agencyEmployeeDto));
		agencyEmployeeDto.setAgencyEmployeeName(agencyEmployeeDao.getAgencyName(agencyEmployeeDto));
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeDao.insertStorageAgencyEmployee(agencyEmployeeDto);
		/* end 탈퇴하기전 1년 보관 스토리지 추가 */
		
		int result = agencyEmployeeDao.deleteAgencyEmployee(agencyEmployeeDto);
		agencyEmployeeDao.deleteAgencyNakchalEmployee(agencyEmployeeDto);
		if(1 == result) {
			session.invalidate();
		}
	}
	
	/* 회원 정보 수정 */
	@Transactional
	public void updateAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("updateAgencyEmployee AgencyEmployeeService");
		agencyEmployeeDao.updateAgencyEmployee(agencyEmployeeDto);
	}
	
	public AgencyEmployeeDto selectOneAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("selectOneAgencyEmployee AgencyEmployeeService");
		agencyEmployeeDto = agencyEmployeeDao.selectOneAgencyEmployee(agencyEmployeeDto);
		agencyEmployeeDto.setAgencyName(agencyEmployeeDao.getAgencyName(agencyEmployeeDto));
		logger.debug(agencyEmployeeDto.toString());
		return agencyEmployeeDto;
	}
	
	@Transactional
	public void insertAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("insertAgencyEmployee AgencyEmployeeService");
		agencyEmployeeDao.insertAgencyEmployee(agencyEmployeeDto);
		agencyEmployeeDao.insertAgencyNakchalEmployee(agencyEmployeeDto);
	}
	
	public String idCheck(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheck AgencyEmployeeService");
		/*
		 * Administrator, Functionary, AgencyEmployee, Citizen 테이블을 모두 참조해
		 * ID 중복이 있는지를 체크한다.
		 * ID 중복이 발생하였다면, result 변수에 F 가 초기화되고
		 * ID 중복이 발생하지 아니하였다면, result 변수에 T 가 초기화된다.
		 * */
		String result = null;
		if(agencyEmployeeDto.getAgencyEmployeeId().equals("")) {
			logger.debug("ID를 아무것도 입력하지 않았을 경우.");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckAdministrator(agencyEmployeeDto)) {
			logger.debug("관리자에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckFunctionary(agencyEmployeeDto)) {
			logger.debug("공무원에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckAgencyEmployee(agencyEmployeeDto) ) {
			logger.debug("대행업체 직원에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckCitizen(agencyEmployeeDto)) {
			logger.debug("시민에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckStorageAgencyEmployee(agencyEmployeeDto)) {
			logger.debug("스토리지 대행업체 직원에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckStorageCitizen(agencyEmployeeDto)) {
			logger.debug("스토리지 시민에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == agencyEmployeeDao.idCheckStorageFunctionary(agencyEmployeeDto)) {
			logger.debug("스토리지 공무원에서 ID 중복이 발생함");
			result = "F";
		}else {
			logger.debug("ID중복이 발생하지 아니함.");
			result = "T";
		}

		return result;
	}
	
	/*
	 * agencyEmployeeDto에 담겨있는 인증번호를 통해 낙찰된 대행업체의 대행업체명을 가져온다.
	 * */
	public AgencyEmployeeDto getAgencyNameForInsert(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("getAgencyNameForInsert AgencyEmployeeService");
		return agencyEmployeeDao.getAgencyNameForInsert(agencyEmployeeDto);
	}
	
	public int injeungAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("injeungAgencyEmployee AgencyEmployeeService");
		return agencyEmployeeDao.injeungAgencyEmployee(agencyEmployeeDto);
	}
	
	
}
