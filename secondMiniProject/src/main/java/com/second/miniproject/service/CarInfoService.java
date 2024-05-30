package com.second.miniproject.service;

import com.second.miniproject.domain.CarInfo;

public interface CarInfoService {

	public abstract boolean carInfoCheck(String id);
	
	public abstract CarInfo carInfo(String id);
	
	public abstract void insertCarInfo(CarInfo carInfo);
	
	public abstract void updateCarMileage(String id, String editCmileage);
	
	public abstract void enginOilUpdate(String id, String cenginOil);
	
	public abstract void airFilterUpdate(String id, String cairFilter);
	
	public abstract void tireUpdate(String id, String cTire);
}
