package com.mc.full17th2.dto;

public class ArtistDTO {

	private int artist_id;
	private String artist_name;
	public ArtistDTO() {
		super();
	}
	public ArtistDTO(int artist_id, String artist_name) {
		this.artist_id = artist_id;
		this.artist_name = artist_name;
	}
	public int getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(int artist_id) {
		this.artist_id = artist_id;
	}
	public String getArtist_name() {
		return artist_name;
	}
	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}
	
	
}
