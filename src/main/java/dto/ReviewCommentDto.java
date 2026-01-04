package dto;

public class ReviewCommentDto {
    private String c_no;        // 댓글 번호 (C_NO)
    private String review_no;   // 원본 글 번호 (REVIEW_NO)
    private String review_id;   // 리뷰 ID (REVIEW_ID)
    private String user_id;     // 작성자 ID (USER_ID)
    private String content;     // 내용 (CONTENT)
    private String reg_date;    // 작성일 (REG_DATE)
    private String update_date; // 수정일 (UPDATE_DATE)
    
    // 기본 생성자
    public ReviewCommentDto() {}

    // 리스트 조회용 생성자
    public ReviewCommentDto(String c_no, String review_no, String user_id, String content, String reg_date) {
        this.c_no = c_no;
        this.review_no = review_no;
        this.user_id = user_id;
        this.content = content;
        this.reg_date = reg_date;
    }

    /* ===================== Getter ===================== */
    public String getC_no() { return c_no; }
    public String getReview_no() { return review_no; }
    public String getReview_id() { return review_id; }
    public String getUser_id() { return user_id; }
    public String getContent() { return content; }
    public String getReg_date() { return reg_date; }
    public String getUpdate_date() { return update_date; }

    /* ===================== Setter ===================== */
    public void setC_no(String c_no) { this.c_no = c_no; }
    public void setReview_no(String review_no) { this.review_no = review_no; }
    public void setReview_id(String review_id) { this.review_id = review_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }
    public void setContent(String content) { this.content = content; }
    public void setReg_date(String reg_date) { this.reg_date = reg_date; }
    public void setUpdate_date(String update_date) { this.update_date = update_date; }
}