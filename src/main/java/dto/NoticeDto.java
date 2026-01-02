package dto;

public class NoticeDto {
	private String no, title, content, important, attach,
					reg_id, reg_name, reg_date;
	private int hit;
	
	
	
	//이전글, 다음글
	public NoticeDto(String no, String title) {
		super();
		this.no = no;
		this.title = title;
	}

	//전체 생성자(등록, 상세조회)
	public NoticeDto(String no, String title, String content, String important, String attach, String reg_id,
			String reg_name, String reg_date, int hit) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.important = important;
		this.attach = attach;
		this.reg_id = reg_id;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.hit = hit;
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

	public String getImportant() {
		return important;
	}

	public String getAttach() {
		return attach;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getReg_name() {
		return reg_name;
	}

	public String getReg_date() {
		return reg_date;
	}

	public int getHit() {
		return hit;
	}
	
	
	
	
	
	
}
