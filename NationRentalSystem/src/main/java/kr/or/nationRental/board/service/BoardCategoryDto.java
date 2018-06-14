package kr.or.nationRental.board.service;

public class BoardCategoryDto {
	private int boardCategoryCode;
	private String boardCategoryName;
	
	public int getBoardCategoryCode() {
		return boardCategoryCode;
	}
	public void setBoardCategoryCode(int boardCategoryCode) {
		this.boardCategoryCode = boardCategoryCode;
	}
	public String getBoardCategoryName() {
		return boardCategoryName;
	}
	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}
	@Override
	public String toString() {
		return "BoardCategoryDto [boardCategoryCode=" + boardCategoryCode + ", boardCategoryName=" + boardCategoryName
				+ "]";
	}
}
