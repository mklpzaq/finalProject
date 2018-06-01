import java.sql.Date;

public class CommentDto {
	private int commentCode; //댓글코드
	private int boardCode; //게시글코드
	private String memberId; //댓글등록자ID
	private String commentPw; //댓글PW
	private String textCommentContent; //댓글내용
	private Date dateWriteComment; //댓글등록날짜
	
	public int getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCommentPw() {
		return commentPw;
	}
	public void setCommentPw(String commentPw) {
		this.commentPw = commentPw;
	}
	public String getTextCommentContent() {
		return textCommentContent;
	}
	public void setTextCommentContent(String textCommentContent) {
		this.textCommentContent = textCommentContent;
	}
	public Date getDateWriteComment() {
		return dateWriteComment;
	}
	public void setDateWriteComment(Date dateWriteComment) {
		this.dateWriteComment = dateWriteComment;
	}
	@Override
	public String toString() {
		return "commentDto [commentCode=" + commentCode + ", boardCode=" + boardCode + ", memberId=" + memberId
				+ ", commentPw=" + commentPw + ", textCommentContent=" + textCommentContent + ", dateWriteComment="
				+ dateWriteComment + "]";
	}
	
	
}
