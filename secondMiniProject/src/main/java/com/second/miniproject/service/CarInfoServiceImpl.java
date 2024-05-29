package com.second.miniproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.second.miniproject.dao.CarInfoDao;
import com.second.miniproject.domain.CarInfo;

@Service
public class CarInfoServiceImpl implements CarInfoService {

	@Autowired
	private CarInfoDao carInfoDao;
	
	@Override
	public boolean carInfoCheck(String id) {
		
		return carInfoDao.carInfoCheck(id) ;
	}

	@Override
	public CarInfo carInfo(String id) {
		
		return carInfoDao.carInfo(id);
	}

	@Override
	public void insertCarInfo(CarInfo carInfo) {
		
		carInfoDao.insertCarInfo(carInfo);
	}

}
