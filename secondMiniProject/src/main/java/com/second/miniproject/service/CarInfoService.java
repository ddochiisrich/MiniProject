package com.second.miniproject.service;

import com.second.miniproject.domain.CarInfo;

public interface CarInfoService {

	public abstract boolean carInfoCheck(String id);
	
	public abstract CarInfo carInfo(String id);
}
