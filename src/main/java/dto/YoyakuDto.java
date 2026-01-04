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
