package dto;

public class YoyakuDto {
	private String no        ,
			       user_id   ,
			       kind      ,
			       spot      ,
			       river     ,
			       pay_date  ,
			       price     ,
			       start_date,
			       end_date  ,
			       party	 ,
			       paymant   ;//결제상태
	
	private String 	username,
					site;//글램핑 오토캠핑 카라반 좌대
	
	private String 	cam_no,
					cam_type,
					cam_name,
					fish_no,
					fish_size,
					fish_name;
//전부쓰기-일단 관리자 예약 리스트에서 사용
	public YoyakuDto(String no, String user_id, String kind, String spot, String river, String pay_date, String price,
			String start_date, String end_date, String party, String paymant, String username, String site,
			String cam_no, String cam_type, String cam_name, String fish_no, String fish_size, String fish_name) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.kind = kind;
		this.spot = spot;
		this.river = river;
		this.pay_date = pay_date;
		this.price = price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.party = party;
		this.paymant = paymant;
		this.username = username;
		this.site = site;
		this.cam_no = cam_no;
		this.cam_type = cam_type;
		this.cam_name = cam_name;
		this.fish_no = fish_no;
		this.fish_size = fish_size;
		this.fish_name = fish_name;
	}

	public String getCam_no() {
		return cam_no;
	}

	public String getCam_type() {
		return cam_type;
	}

	public String getCam_name() {
		return cam_name;
	}

	public String getFish_no() {
		return fish_no;
	}

	public String getFish_size() {
		return fish_size;
	}

	public String getFish_name() {
		return fish_name;
	}
// 예약 등록용
	public YoyakuDto(String no, String user_id, String kind, String spot, String river, String pay_date, String price,
			String start_date, String end_date, String paymant, String party) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.kind = kind;
		this.spot = spot;
		this.river = river;
		this.pay_date = pay_date;
		this.price = price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.paymant = paymant;
		this.party = party;
	}

	public String getNo() {
		return no;
	}

	public String getParty() {
		return party;
	}

	public String getUsername() {
		return username;
	}

	public String getSite() {
		return site;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getKind() {
		return kind;
	}

	public String getSpot() {
		return spot;
	}

	public String getRiver() {
		return river;
	}

	public String getPay_date() {
		return pay_date;
	}

	public String getPrice() {
		return price;
	}

	public String getStart_date() {
		return start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public String getPaymant() {
		return paymant;
	}
	
	
	
	
	
	
	
	
	
}
