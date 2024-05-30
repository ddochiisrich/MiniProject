package com.second.miniproject.ajax;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.second.miniproject.domain.CarInfo;
import com.second.miniproject.service.CarInfoService;

@Controller
public class CarInfoAjaxController {

	@Autowired
	private CarInfoService carInfoService;
	
	  @RequestMapping("/cmileageUpdateProcess.ajax")
	  @ResponseBody
	    public CarInfo updateCarMileage(String id, String editCmileage, HttpSession session) {
	    	
	    	String memberId = (String) session.getAttribute("id");
	    	
	        carInfoService.updateCarMileage(memberId, editCmileage);
	        
	        CarInfo updatedCarInfo = carInfoService.carInfo(id);
	        
	        // 세션 갱신
	        session.setAttribute("info", updatedCarInfo);
	        
            return carInfoService.carInfo(id);
            
	    }
	  
	
}
