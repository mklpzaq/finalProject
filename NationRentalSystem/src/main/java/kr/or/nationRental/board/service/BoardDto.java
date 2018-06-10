package kr.or.nationRental.board.service;

public class BoardDto {
	private int boardCode;
	private int boardCategoryCode;
	private String memberId;
	private String boardPw;
	private String boardName;
	private String textBoardContent;
	private String dateWriteBoard;
	private int boardHits;
	
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
	@Override
	public String toString() {
		return "BoardDto [boardCode=" + boardCode + ", boardCategoryCode=" + boardCategoryCode + ", memberId="
				+ memberId + ", boardPw=" + boardPw + ", boardName=" + boardName + ", textBoardContent="
				+ textBoardContent + ", dateWriteBoard=" + dateWriteBoard + ", boardHits=" + boardHits + "]";
	}
}
