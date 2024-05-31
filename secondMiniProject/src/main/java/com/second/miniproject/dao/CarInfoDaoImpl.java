package com.second.miniproject.dao;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public void updateCarMileage(String id, String editCmileage) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("editCmileage", editCmileage);

        sqlSession.update(NAME_SPACE + ".updateCmileage", params);
		
	}

	@Override
	public void enginOilUpdate(String id, String editEngineOil) {
		
		Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("cenginOil", editEngineOil);
        		
		sqlSession.update(NAME_SPACE + ".enginOilUpdate", params);
		
	}

	@Override
	public void cairFilterUpdate(String id, String editairFilter) {
		
		Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("cairFilter", editairFilter);
        		
		sqlSession.update(NAME_SPACE + ".airFilterUpdate", params);
		
	}

	@Override
	public void cTireUpdate(String id, String editcTire) {

		Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("cTire", editcTire);
        		
		sqlSession.update(NAME_SPACE + ".tireUpdate", params);
		
	}

}
