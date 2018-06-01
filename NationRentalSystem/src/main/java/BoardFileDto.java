import java.sql.Date;

public class BoardFileDto {
	
	private int boardFileCode; //게시글 첨부파일코드
	private int boardCode; //게시글코드
	private String boardFileName; //게시글 첨부파일명
	private String boardFileExt; //게시글 첨부파일확장자
	private String boardFileType; //게시글 첨부파일타입
	private long boardFileSize; //게시글 첨부파일사이즈
	private Date dateUploadFile; //게시글 첨부파일날짜
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
	public long getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(long boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public Date getDateUploadFile() {
		return dateUploadFile;
	}
	public void setDateUploadFile(Date dateUploadFile) {
		this.dateUploadFile = dateUploadFile;
	}
	@Override
	public String toString() {
		return "BoardFileDto [boardFileCode=" + boardFileCode + ", boardCode=" + boardCode + ", boardFileName="
				+ boardFileName + ", boardFileExt=" + boardFileExt + ", boardFileType=" + boardFileType
				+ ", boardFileSize=" + boardFileSize + ", dateUploadFile=" + dateUploadFile + "]";
	}
	
	
}
