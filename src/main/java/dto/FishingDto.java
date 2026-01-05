package dto;

public class FishingDto {
	private String	no  , 
					name,
					size;

	public FishingDto(String no, String name, String size) {
		super();
		this.no = no;
		this.name = name;
		this.size = size;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	
}
                