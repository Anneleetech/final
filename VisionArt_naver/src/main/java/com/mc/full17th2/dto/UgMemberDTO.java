package com.mc.full17th2.dto;

public class UgMemberDTO {
	private int member_id;
	private int artist_id;
	private int art_field_id;
	
	private String id;
	private String password;
	private String name;
	private String phone_number;
	private String email;
	
	private Boolean is_admin;

	public UgMemberDTO() {
		super();
		
	}

	public UgMemberDTO(int member_id, int artist_id, int art_field_id, String id, String password, String name,
			String phone_number, String email, Boolean is_admin) {
		super();
		this.member_id = member_id;
		this.artist_id = artist_id;
		this.art_field_id = art_field_id;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.email = email;
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

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(Boolean is_admin) {
		this.is_admin = is_admin;
	}
	
	
}
