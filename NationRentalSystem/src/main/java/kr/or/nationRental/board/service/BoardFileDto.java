package kr.or.nationRental.board.service;

import java.util.List;

public class BoardFileDto {
	private int boardFileCode;
	private int boardCode;
	private String boardFileName;
	private String boardFileExt;
	private String boardFileType;
	private int boardFileSize;
	private String dateUploadFile;
	private List<BoardFileDto> boardFileDto;
	
	public int getBoardFileCode() {
		return boardFileCode;
	}
	public void setBoardFileCode(int boardFileCode) {
		this.boardFileCode = boardFileCode;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFileExt() {
		return boardFileExt;
	}
	public void setBoardFileExt(String boardFileExt) {
		this.boardFileExt = boardFileExt;
	}
	public String getBoardFileType() {
		return boardFileType;
	}
	public void setBoardFileType(String boardFileType) {
		this.boardFileType = boardFileType;
	}
	public int getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(int boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public String getDateUploadFile() {
		return dateUploadFile;
	}
	public void setDateUploadFile(String dateUploadFile) {
		this.dateUploadFile = dateUploadFile;
	}
	public List<BoardFileDto> getBoardFileDto() {
		return boardFileDto;
	}
	public void setBoardFileDto(List<BoardFileDto> boardFileDto) {
		this.boardFileDto = boardFileDto;
	}
	@Override
	public String toString() {
		return "BoardFileDto [boardFileCode=" + boardFileCode + ", boardCode=" + boardCode + ", boardFileName="
				+ boardFileName + ", boardFileExt=" + boardFileExt + ", boardFileType=" + boardFileType
				+ ", boardFileSize=" + boardFileSize + ", dateUploadFile=" + dateUploadFile + ", boardFileDto="
				+ boardFileDto + "]";
	}
}
