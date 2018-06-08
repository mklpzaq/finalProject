package kr.or.nationRental.annualfeePakage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageDao;
import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageDto;
import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageService;

@Controller
public class AnnualfeePakageController {
	
	@Autowired
	private AnnualfeePakageService annualfeePakageService;
	
	private static final Logger logger = LoggerFactory.getLogger(AnnualfeePakageController.class);
	//연회비등록화면
	@RequestMapping(value="/insertAnnualfeePakage", method=RequestMethod.GET)
	public String insertannualfeePakage() {
			
		return "/annualfeePakage/insertAnnualfeePakage";
	}
	
	/*연회비패키지등록
	 *연회비패키지등록시 해당 연회비패키지가 어떤 행정기관에 적용되는지 같이 등록을 해줘야한다
	 *연회비패키지 하나는 여러 행정기관에 적용될 수 있다
	 *dto 구성 
	 *연회비패키지의 적용범위가 1:1이 아니기 때문에 하나의 dto로 묶어 사용하는것이 힘들다
	 *연회비패키지의 dto를 만들고 해당 dto에 연회비패키지 적용 행정기관을 또 다른 dto를 List로 받을수 있도록 한다
	 *매서드 구성
	 *연회비패키지의 적용 행정기관을 제외한 다른 데이터들로 연회비패키지를 먼저 insert하는 메서드를 실행한 뒤에
	 *해당 쿼리의 primary값으로 설정한 autoincrement의 값을 리턴받아
	 *연회비패키지의 적용 행정기관을 insert하는 메서드의 값으로 집어넣는다
	 *해당 메서드들은 트랜잭션처리한다  
	 *? 생각해보니 dto구성을 나눌 필요가 없이 연회비패키지 적용 행정기관을 받는 변수를 List타입으로 해주면 되지 않을까 싶다	 *
	 */
	@RequestMapping(value="/insertAnnualfeePakage", method=RequestMethod.POST)
	public String insertAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageController - insertAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		annualfeePakageService.insertAnnualfeePakage(annualfeePakageDto);
		
		return "/";
	}
}
