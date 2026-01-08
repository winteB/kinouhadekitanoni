package dto;

public class QnaDto {
	private String no, title, content, hit, reg_id, reg_date,
					answer, answer_id, answer_date;
	
	
	
	//qna 등록 생성자
	public QnaDto(String no, String title, String content, String reg_id, String reg_date) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
	}

	//전체 생성자
	public QnaDto(String no, String title, String content, String hit, String reg_id, String reg_date, String answer,
			String answer_id, String answer_date) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.answer = answer;
		this.answer_id = answer_id;
		this.answer_date = answer_date;
	}

	public String getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getHit() {
		return hit;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getAnswer() {
		return answer;
	}

	public String getAnswer_id() {
		return answer_id;
	}

	public String getAnswer_date() {
		return answer_date;
	}
	
	

	
	
	
}
