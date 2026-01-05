package dto;

public class ReviewDto {
    private String no;          // 리뷰 고유 번호
    private String title;       // 리뷰 제목
    private String review_id;   // 리뷰 식별 ID (추가 관리용)
    private String user_id;     // 작성자 ID
    private String target_id;   // 카테고리(낚시, 글램핑 등) ID
    private String attach;      // 첨부 파일 경로/이름
    private int rating;         // 평점 (별점)
    private int comment_hit;    // 댓글 수
    private String content;     // 리뷰 내용
    private int hit;            // 조회수
    private String reg_date;    // 등록일
    private String update_date; // 수정일
    
    // 기본 생성자
    public ReviewDto() {}

    // 리스트 조회용 생성자
    public ReviewDto(String no, String title, String user_id, String target_id, String attach, int rating, String reg_date) {
        this.no = no;
        this.title = title;
        this.user_id = user_id;
        this.target_id = target_id;
        this.attach = attach;
        this.rating = rating;
        this.reg_date = reg_date;
    }

    // 전체 데이터 저장용 생성자 (DAO insert용)
    public ReviewDto(String title, String user_id, String target_id, String attach, int rating, String content) {
        this.title = title;
        this.user_id = user_id;
        this.target_id = target_id;
        this.attach = attach;
        this.rating = rating;
        this.content = content;
    }

    /* ===================== Getter ===================== */
    public String getNo() { return no; }
    public String getTitle() { return title; }
    public String getReview_id() { return review_id; }
    public String getUser_id() { return user_id; }
    public String getTarget_id() { return target_id; }
    public String getAttach() { return attach; }
    public int getRating() { return rating; }
    public int getComment_hit() { return comment_hit; }
    public String getContent() { return content; }
    public int getHit() { return hit; }
    public String getReg_date() { return reg_date; }
    public String getUpdate_date() { return update_date; }

    /* ===================== Setter ===================== */
    public void setNo(String no) { this.no = no; }
    public void setTitle(String title) { this.title = title; }
    public void setReview_id(String review_id) { this.review_id = review_id; }
    public void setUser_id(String user_id) { this.user_id = user_id; }
    public void setTarget_id(String target_id) { this.target_id = target_id; }
    public void setAttach(String attach) { this.attach = attach; }
    public void setRating(int rating) { this.rating = rating; }
    public void setComment_hit(int comment_hit) { this.comment_hit = comment_hit; }
    public void setContent(String content) { this.content = content; }
    public void setHit(int hit) { this.hit = hit; }
    public void setReg_date(String reg_date) { this.reg_date = reg_date; }
    public void setUpdate_date(String update_date) { this.update_date = update_date; }
}