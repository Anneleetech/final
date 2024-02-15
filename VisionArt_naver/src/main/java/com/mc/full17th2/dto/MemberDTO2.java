package com.mc.full17th2.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberDTO2 {
	private int member_id;
	private int artist_id;
	private int art_field_id;
	
	private String id;
	private String email;
	private String password;
	private String name;
	private Date signup_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthdate;
	private String address;
	private String nickname;
	private String phone_number;
	private Boolean is_admin;
	
	public MemberDTO2() {
		super();
		
	}

	public MemberDTO2(int member_id, int artist_id, int art_field_id, String id, String email, String password,
			String name, Date signup_date, Date birthdate, String address, String nickname, String phone_number,
			Boolean is_admin) {
		this.member_id = member_id;
		this.artist_id = artist_id;
		this.art_field_id = art_field_id;
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.signup_date = signup_date;
		this.birthdate = birthdate;
		this.address = address;
		this.nickname = nickname;
		this.phone_number = phone_number;
		this.is_admin = is_admin;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(int artist_id) {
		this.artist_id = artist_id;
	}

	public int getArt_field_id() {
		return art_field_id;
	}

	public void setArt_field_id(int art_field_id) {
		this.art_field_id = art_field_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public Boolean getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(Boolean is_admin) {
		this.is_admin = is_admin;
	}

	
}
