package com.second.miniproject.domain;

import java.sql.Timestamp;

public class CarInfo {

	private String id;
    private String carNickname;
    private String cname;
    private String cnumber;
    private String cmanufacturer;
    private String carImg;
    private String cyear;
    private String ccolor;
    private String cfuelType;
    private String ctransmission;
    private String cenginOil;
    private String cairFilter;
    private String cTire;
    private int carMileage;
    private Double carFuelAverage;
    private Timestamp createdAt;
    
    public CarInfo() {}

	public CarInfo(String id, String carNickname, String cname, String cnumber, String cmanufacturer, String carImg,
			String cyear, String ccolor, String cfuelType, String ctransmission, String cenginOil, String cairFilter,
			String cTire, int carMileage, Double carFuelAverage, Timestamp createdAt) {

		this.id = id;
		this.carNickname = carNickname;
		this.cname = cname;
		this.cnumber = cnumber;
		this.cmanufacturer = cmanufacturer;
		this.carImg = carImg;
		this.cyear = cyear;
		this.ccolor = ccolor;
		this.cfuelType = cfuelType;
		this.ctransmission = ctransmission;
		this.cenginOil = cenginOil;
		this.cairFilter = cairFilter;
		this.cTire = cTire;
		this.carMileage = carMileage;
		this.carFuelAverage = carFuelAverage;
		this.createdAt = createdAt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCarNickname() {
		return carNickname;
	}

	public void setCarNickname(String carNickname) {
		this.carNickname = carNickname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCnumber() {
		return cnumber;
	}

	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}

	public String getCmanufacturer() {
		return cmanufacturer;
	}

	public void setCmanufacturer(String cmanufacturer) {
		this.cmanufacturer = cmanufacturer;
	}

	public String getCarImg() {
		return carImg;
	}

	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}

	public String getCyear() {
		return cyear;
	}

	public void setCyear(String cyear) {
		this.cyear = cyear;
	}

	public String getCcolor() {
		return ccolor;
	}

	public void setCcolor(String ccolor) {
		this.ccolor = ccolor;
	}

	public String getCfuelType() {
		return cfuelType;
	}

	public void setCfuelType(String cfuelType) {
		this.cfuelType = cfuelType;
	}

	public String getCtransmission() {
		return ctransmission;
	}

	public void setCtransmission(String ctransmission) {
		this.ctransmission = ctransmission;
	}

	public String getCenginOil() {
		return cenginOil;
	}

	public void setCenginOil(String cenginOil) {
		this.cenginOil = cenginOil;
	}

	public String getCairFilter() {
		return cairFilter;
	}

	public void setCairFilter(String cairFilter) {
		this.cairFilter = cairFilter;
	}

	public String getcTire() {
		return cTire;
	}

	public void setcTire(String cTire) {
		this.cTire = cTire;
	}

	public int getCarMileage() {
		return carMileage;
	}

	public void setCarMileage(int carMileage) {
		this.carMileage = carMileage;
	}

	public Double getCarFuelAverage() {
		return carFuelAverage;
	}

	public void setCarFuelAverage(Double carFuelAverage) {
		this.carFuelAverage = carFuelAverage;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	
    
	
}
