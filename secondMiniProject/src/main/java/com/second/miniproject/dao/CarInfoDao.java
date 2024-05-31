package com.second.miniproject.dao;

import com.second.miniproject.domain.CarInfo;

public interface CarInfoDao {

	public abstract boolean carInfoCheck(String id);
	
	public abstract CarInfo carInfo(String id);
	
	public abstract void insertCarInfo(CarInfo carInfo);
	
	public abstract void updateCarMileage(String id, String editCmileage);
	
	public abstract void enginOilUpdate(String id, String cenginOil);
	
	public abstract void cairFilterUpdate(String id, String cairFilter);
	
	public abstract void cTireUpdate(String id, String cengcTireinOil);
	
	
}
