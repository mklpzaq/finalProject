package kr.or.nationRental.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*
 * 입력받는 모양하고 테이블 모양하고 일치하지 않는다.
 * 이러한 불일치를 서비스에서 해결하자.
 * */
public class BoardRequest {
	private int boardCode;
	private int boardCategoryCode;
	private String memberId;
	private String boardPw;
	private String boardName;
	private String textBoardContent;
	private String dateWriteBoard;
	private int boardHits;
	private List<MultipartFile> multipartFile;
	/*private File file; 스프링에서 파일로 바로 받지 말고 Spring에서 쓰는 멀티파트를 쓰자
	 * 
	 * */
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public int getBoardCategoryCode() {
		return boardCategoryCode;
	}
	public void setBoardCategoryCode(int boardCategoryCode) {
		this.boardCategoryCode = boardCategoryCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardPw() {
		return boardPw;
	}
	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getTextBoardContent() {
		return textBoardContent;
	}
	public void setTextBoardContent(String textBoardContent) {
		this.textBoardContent = textBoardContent;
	}
	public String getDateWriteBoard() {
		return dateWriteBoard;
	}
	public void setDateWriteBoard(String dateWriteBoard) {
		this.dateWriteBoard = dateWriteBoard;
	}
	public int getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}
	public List<MultipartFile> getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(List<MultipartFile> multipartFile) {
		this.multipartFile = multipartFile;
	}
	@Override
	public String toString() {
		return "BoardRequest [boardCode=" + boardCode + ", boardCategoryCode=" + boardCategoryCode + ", memberId="
				+ memberId + ", boardPw=" + boardPw + ", boardName=" + boardName + ", textBoardContent="
				+ textBoardContent + ", dateWriteBoard=" + dateWriteBoard + ", boardHits=" + boardHits
				+ ", multipartFile=" + multipartFile + "]";
	}
}
