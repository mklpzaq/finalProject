import java.sql.Date;
import java.util.List;

public class BoardDto {
	private int boardCode; //게시글코드
	private int boardCategoryCode; //게시글 카테고리코드
	private String boardCategoryName; //게시글 카테고리명
	private String memberId; //등록자ID
	private String boardPw; //게시글 비밀번호
	private String boardName; //게시글제목
	private String textBoardContent; //게시글내용
	private List<BoardFileDto> boardFileDto; //게시글첨부파일
	private Date dateWriteBoard; //게시글 등록날짜
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
	public String getBoardCategoryName() {
		return boardCategoryName;
	}
	public void setBoardCategoryName(String boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
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
	public List<BoardFileDto> getBoardFileDto() {
		return boardFileDto;
	}
	public void setBoardFileDto(List<BoardFileDto> boardFileDto) {
		this.boardFileDto = boardFileDto;
	}
	public Date getDateWriteBoard() {
		return dateWriteBoard;
	}
	public void setDateWriteBoard(Date dateWriteBoard) {
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
		return "boardDto [boardCode=" + boardCode + ", boardCategoryCode=" + boardCategoryCode + ", boardCategoryName="
				+ boardCategoryName + ", memberId=" + memberId + ", boardPw=" + boardPw + ", boardName=" + boardName
				+ ", textBoardContent=" + textBoardContent + ", boardFileDto=" + boardFileDto + ", dateWriteBoard="
				+ dateWriteBoard + ", boardHits=" + boardHits + "]";
	}
	
}
