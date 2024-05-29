package com.second.miniproject.domain;

import java.security.Timestamp;

public class Board {
//	- 차종을 입력 - cname, 사고일지 - content, 사진 file1, 주행거리 km, 타이어 tire, 냉각수 coolant, 배터리 battery, 와이퍼 wiper, 에어컨 - aircon, no - number
	// regDate - 시간 , readCount - 조회수
	// recommend 추천, thank 좋아요
	private int no;
	private String cname;
	private String notent;
	private String km; // int 로 받을지 고민중
	private String tire;
	private String coolant;
	private String battery;
	private String wiper;
	private String aircon;
	private Timestamp regDate;
	private int readCount;	
	
	public Board() {}
	
	public Board(int no, String cname, String notent, String km, String tire, String coolant, String battery,
			String wiper, String aircon, Timestamp regDate, int readCount) {
		super();
		this.no = no;
		this.cname = cname;
		this.notent = notent;
		this.km = km;
		this.tire = tire;
		this.coolant = coolant;
		this.battery = battery;
		this.wiper = wiper;
		this.aircon = aircon;
		this.regDate = regDate;
		this.readCount = readCount;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getNotent() {
		return notent;
	}
	public void setNotent(String notent) {
		this.notent = notent;
	}
	public String getKm() {
		return km;
	}
	public void setKm(String km) {
		this.km = km;
	}
	public String getTire() {
		return tire;
	}
	public void setTire(String tire) {
		this.tire = tire;
	}
	public String getCoolant() {
		return coolant;
	}
	public void setCoolant(String coolant) {
		this.coolant = coolant;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public String getWiper() {
		return wiper;
	}
	public void setWiper(String wiper) {
		this.wiper = wiper;
	}
	public String getAircon() {
		return aircon;
	}
	public void setAircon(String aircon) {
		this.aircon = aircon;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
}