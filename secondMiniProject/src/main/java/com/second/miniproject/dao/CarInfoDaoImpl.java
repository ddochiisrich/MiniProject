package com.second.miniproject.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.second.miniproject.domain.CarInfo;

@Repository
public class CarInfoDaoImpl implements CarInfoDao {

	private final String NAME_SPACE = "com.second.miniproject.mapper.CarInfoMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean carInfoCheck(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".carInfoCheck", id);
	}

	@Override
	public CarInfo carInfo(String id) {
		
		return sqlSession.selectOne(NAME_SPACE + ".carInfo", id);
	}

	@Override
	public void insertCarInfo(CarInfo carInfo) {
		
		sqlSession.insert(NAME_SPACE + ".insertCarInfo", carInfo);
	}

}
