package kr.or.nationRental.annualfeePakage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageAuthorityDto;
import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageDto;
import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageService;
import kr.or.nationRental.login.service.MemberDto;

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
	public String insertAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto
			,HttpSession session) {
		logger.debug("AnnualfeePakageController - insertAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		MemberDto member = (MemberDto) session.getAttribute("member");
		annualfeePakageDto.setFunctionaryId(member.getMemberId());
		annualfeePakageService.insertAnnualfeePakage(annualfeePakageDto);
		
		return "redirect:/selectListAnnualfeePakage";
	}
	
	/*연회비 패키지 조회
	 *첫번째는 연회비 패키지 조회form으로 이동하는 것
	 *session처리되어있는 memberLevel에 따라 기능이 약간씩 다른데 
	 *관리자의 경우 - 등록된 연회비 패키지를 전부 볼수 있고, 삭제처리 할수 있는 form
	 *공무원의 경우 - 등록된 연회비 패키지를 전부 볼수 있고, 그중에서 자신의 id로 등록한 연회비패키지를 수정, 삭제처리할수 있는 form
	 *시민의 경우 - 등록된 연회비 패키지를 전부 볼수 있고, 그중에서 연회비패키지를 구입할 수 있는 form이며 구입한 연회비 패키지를 구분할수 있는 form 
	 *위의 기능구분을 상세보기창에서 구분하는것으로 하자
	 */
	@RequestMapping(value="/selectListAnnualfeePakage", method=RequestMethod.GET)
	public String selectListAnualfeePakage(HttpSession session
											,Model model
											,@RequestParam(value="currentPage", defaultValue="1") int currentPage
											,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
											,@RequestParam(value="searchOption", defaultValue="all") String searchOption
											,@RequestParam(value="keyword", defaultValue="") String keyword) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memeberLevel = member.getMemberLevel();
		

		Map<String, Object> map = annualfeePakageService.selectListFunctionary(currentPage, pagePerRow, searchOption, keyword);
		logger.debug("AnnualfeePakageController - selectListAnualfeePakage - map.get('list') : " + map.get("list"));
		model.addAttribute("memeberLevel", memeberLevel);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/annualfeePakage/selectListAnnualfeePakage";
	}
	
	/*연회비패키지 상세보기
	 * 상세보기에 필요한 기능들
	 *화면에 보여주기
	 *관리자화면 조건없는 삭제
	 *공무원 자기가 등록한것 삭제 수정
	 *시민 구입
	 *필요한 데이터들
	 *보여주기 필요 데이터
	 *level, 등록자 id?, 연회비패키지명, 가격, 상세내용, 할인률, 적용되는 행정기관들
	 *삭제 수정 구입에 필요한 데이터 세션처리된 id와 level
	 *보여주기 위한 form을 권한에 따라 따로따로 만드드냐
	 *아니면 한 화면 내에서 권한을 구분하여 하나로 보여주느냐
	 *우선은 한 화면 내에서 권한을 구분하여 하나로 보여주는 방법을 생각해본다
	 */
	@RequestMapping(value="/annualfeePakageSangse", method=RequestMethod.GET)
	public String annualfeePakageSangse(HttpSession session
											,Model model
											,AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageController - annualfeePakageSangse - annualfeePakageDto : " + annualfeePakageDto);
		MemberDto member = (MemberDto) session.getAttribute("member");
		

		AnnualfeePakageDto returnAnnualfeePakageDto = annualfeePakageService.annualfeePakageSangse(annualfeePakageDto);
		logger.debug("AnnualfeePakageController - annualfeePakageSangse - returnAnnualfeePakageDto : " + returnAnnualfeePakageDto.toString());
		model.addAttribute("member", member);
		model.addAttribute("returnAnnualfeePakageDto", returnAnnualfeePakageDto);
		return "/annualfeePakage/annualfeePakageSangse";
	}
	
	/*연회비패키지 삭제처리 */
	@RequestMapping(value="/deleteAnnualfeePakage", method=RequestMethod.GET)
	public String deleteAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageController - deleteAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto);
		

		annualfeePakageService.deleteAnnualfeePakage(annualfeePakageDto);
		
		
		return "redirect:/selectListAnnualfeePakage";
	}
	
	/*연회비패키지 수정처리 
	 * 수정처리를 위한 화면기능
	 * */
	@RequestMapping(value="/updateAnnualfeePakage", method=RequestMethod.GET)
	public String updateAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto
										,Model model) {
		logger.debug("AnnualfeePakageController - updateAnnualfeePakage - GET - annualfeePakageDto : " + annualfeePakageDto);
		

		AnnualfeePakageDto returnAnnualfeePakageDto = annualfeePakageService.updateVeiwAnnualfeePakage(annualfeePakageDto);
		
		model.addAttribute("returnAnnualfeePakageDto", returnAnnualfeePakageDto);
		return "/annualfeePakage/updateAnnualfeePakage";
	}
	
	/*연회비 수정처리
	 * 수정처리를 위한 메서드
	 * annualfee_pakage테이블의 데이터 update 처리
	 * annualfee_pakage_authority테이블의 데이터 delete처리
	 * annualfee_pakage_authority테이블의 데이터 insert처리
	 * annualfeePakageSangse로 redirect
	 */
	@RequestMapping(value="/updateAnnualfeePakage", method=RequestMethod.POST)
	public String updateAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto 
										,HttpSession session
										,Model model) {
		logger.debug("AnnualfeePakageController - updateAnnualfeePakage - POST - annualfeePakageDto : " + annualfeePakageDto);
		

		annualfeePakageService.updateAnnualfeePakage(annualfeePakageDto);
		
		return "redirect:/selectListAnnualfeePakage";
	}
	
	/*연회비 구입
	 * 연회비패키지코드
	 * session처리된 id
	 */
	@RequestMapping(value="/insertAnnualfeePakageOwnership", method=RequestMethod.GET)
	public String insertAnnualfeePakageOwnership(AnnualfeePakageDto annualfeePakageDto																			
										,HttpSession session) {
		logger.debug("AnnualfeePakageController - updateAnnualfeePakage - POST - annualfeePakageDto : " + annualfeePakageDto);
		MemberDto member= (MemberDto) session.getAttribute("member");
		annualfeePakageDto.setCitizenId(member.getMemberId());

		annualfeePakageService.insertAnnualfeePakageOwnership(annualfeePakageDto);
		
		return "redirect:/selectListAnnualfeePakage";
	}
	
	/*시민이 자신이 구입한 연회비패키지만 보기
	 * 
	 */
	@RequestMapping(value="/selectListAnnualfeePakageOwnership", method=RequestMethod.GET)
	public String selectListAnnualfeePakageOwnership(HttpSession session
													,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memeberId = member.getMemberId();
		

		List<AnnualfeePakageDto> list = annualfeePakageService.selectListAnnualfeePakageOwnership(memeberId);
		logger.debug("AnnualfeePakageController - selectListAnualfeePakage - memeberId : " + memeberId);
		model.addAttribute("list", list);
		
		return "/annualfeePakage/selectListAnnualfeePakageOwnership";
	}
}
