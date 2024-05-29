package com.second.miniproject.dao;

import com.second.miniproject.domain.CarInfo;

public interface CarInfoDao {

	public abstract boolean carInfoCheck(String id);
	
	public abstract CarInfo carInfo(String id);
	
}
