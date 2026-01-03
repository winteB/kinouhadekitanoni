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
			       paymant   ;

	public YoyakuDto(String no, String user_id, String kind, String spot, String river, String pay_date, String price,
			String start_date, String end_date, String paymant) {
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
	}

	public String getNo() {
		return no;
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
