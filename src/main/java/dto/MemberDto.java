package dto;

public class MemberDto {
	private String id, name, password, password_length,
					age, address, mobile_1, mobile_2, mobile_3,
					email_1, email_2, gender,
					reg_date, update_date, exit_date;

	public MemberDto(String id, String name, String password, String password_length, String age, String address,
			String mobile_1, String mobile_2, String mobile_3, String email_1, String email_2, String gender,
			String reg_date, String update_date, String exit_date) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.password_length = password_length;
		this.age = age;
		this.address = address;
		this.mobile_1 = mobile_1;
		this.mobile_2 = mobile_2;
		this.mobile_3 = mobile_3;
		this.email_1 = email_1;
		this.email_2 = email_2;
		this.gender = gender;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.exit_date = exit_date;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getPassword_length() {
		return password_length;
	}

	public String getAge() {
		return age;
	}

	public String getAddress() {
		return address;
	}

	public String getMobile_1() {
		return mobile_1;
	}

	public String getMobile_2() {
		return mobile_2;
	}

	public String getMobile_3() {
		return mobile_3;
	}

	public String getEmail_1() {
		return email_1;
	}

	public String getEmail_2() {
		return email_2;
	}

	public String getGender() {
		return gender;
	}

	public String getReg_date() {
		return reg_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public String getExit_date() {
		return exit_date;
	}
	
	
	
	
	
	
}
