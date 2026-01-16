package dto;

public class QnaDto {
	private String no, title, content, hit, reg_id, name, reg_date,
					answer, answer_id, answer_date;
	
	
		//수정
		public QnaDto(String no, String title, String content) {
			this.no = no;
			this.title = title;
			this.content = content;
		}
		//답변
		public QnaDto(String no, String answer, String answer_id, String answer_date) {
			this.no = no;
			this.answer = answer;
			this.answer_id = answer_id;
			this.answer_date = answer_date;
		}

		//목록조회
		public QnaDto(String no, String title, String content, String hit, String reg_id, String name, String reg_date,
				String answer) {
			this.no = no;
			this.title = title;
			this.content = content;
			this.hit = hit;
			this.reg_id = reg_id;
			this.name = name;
			this.reg_date = reg_date;
			this.answer = answer;
		}

		//이전글, 다음글
		public QnaDto(String no, String title) {
			this.no = no;
			this.title = title;
		}
		
		//저장
		public QnaDto(String no, String title, String content, String reg_id, String reg_date) {
			this.no = no;
			this.title = title;
			this.content = content;
			this.reg_id = reg_id;
			this.reg_date = reg_date;
		}
		//전체생성자, 상세
		public QnaDto(String no, String title, String content, String hit, String reg_id, String name, String reg_date,
				String answer, String answer_id, String answer_date) {
			this.no = no;
			this.title = title;
			this.content = content;
			this.hit = hit;
			this.reg_id = reg_id;
			this.name = name;
			this.reg_date = reg_date;
			this.answer = answer;
			this.answer_id = answer_id;
			this.answer_date = answer_date;
		}

	public String getName() {
		return name;
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
