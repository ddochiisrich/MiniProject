package com.second.miniproject.domain;

import java.sql.Timestamp;

public class CarInfo {

	private String id;
    private String carNickname;
    private String carImg;
    private int managementDays;
    private int carMileage;
    private Double carFuelAverage;
    private Timestamp createdAt;
    
    public CarInfo() {}

	public CarInfo(String id, String carNickname, String carImg, int managementDays, int carMileage,
			Double carFuelAverage, Timestamp createdAt) {
		super();
		this.id = id;
		this.carNickname = carNickname;
		this.carImg = carImg;
		this.managementDays = managementDays;
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

	public String getCarImg() {
		return carImg;
	}

	public void setCarImg(String carImg) {
		this.carImg = carImg;
	}

	public int getManagementDays() {
		return managementDays;
	}

	public void setManagementDays(int managementDays) {
		this.managementDays = managementDays;
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
