package dto;

public class CampingDto {
	private String no  ,
			       type,
			       name;

	public CampingDto(String no, String type, String name) {
		super();
		this.no = no;
		this.type = type;
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
