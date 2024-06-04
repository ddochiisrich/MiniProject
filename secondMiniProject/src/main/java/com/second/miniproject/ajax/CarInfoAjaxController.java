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
	  
	  @RequestMapping("/enginOilUpdateProcess.ajax")
	  @ResponseBody
	    public CarInfo enginOilUpdate(String id, String editEngineOil, HttpSession session) {
	    	
	    	String memberId = (String) session.getAttribute("id");

	        carInfoService.enginOilUpdate(memberId, editEngineOil);
	        
	        CarInfo updatedCarInfo = carInfoService.carInfo(id);
	        
	        // 세션 갱신
	        session.setAttribute("info", updatedCarInfo);
	        
            return carInfoService.carInfo(id);
            
	    }
	  
	  @RequestMapping("/airFilterUpdateProcess.ajax")
	  @ResponseBody
	    public CarInfo airFilterUpdate(String id, String editairFilter, HttpSession session) {
	    	
	    	String memberId = (String) session.getAttribute("id");

	        carInfoService.airFilterUpdate(memberId, editairFilter);
	        
	        CarInfo updatedCarInfo = carInfoService.carInfo(id);
	        
	        // 세션 갱신
	        session.setAttribute("info", updatedCarInfo);
	        
            return carInfoService.carInfo(id);
            
	    }
	  
	  @RequestMapping("/tireUpdateProcess.ajax")
	  @ResponseBody
	  public CarInfo tireUpdate(String id, String editcTire, String cmileage, HttpSession session) {
	      String memberId = (String) session.getAttribute("id");

	      carInfoService.tireUpdate(memberId, editcTire);

	      CarInfo updatedCarInfo = carInfoService.carInfo(id);

	      // 세션 갱신
	      session.setAttribute("info", updatedCarInfo);
	      session.setAttribute("ctire", editcTire); // ctire 값을 세션에 저장
	      session.setAttribute("cmileage", cmileage); // cmileage 값을 세션에 저장!

	      return carInfoService.carInfo(id);
	  }
	  
	
}
