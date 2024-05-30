package com.second.miniproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.second.miniproject.domain.CarInfo;
import com.second.miniproject.service.CarInfoService;

@Controller
@SessionAttributes("membership") 
public class CarInfoController {

    private static final String DEFAULT_PATH = "/resources/upload/";

    @Autowired
    private CarInfoService carInfoService;

    @PostMapping("/infoRegistProcess")
    public String insertCarInfo(CarInfo carInfo, Model model, HttpServletRequest request, 
            @RequestParam(value="cimg1", required=false) MultipartFile multipartFile, 
            HttpSession session) throws IOException {
    
    	 // 세션에서 id 가져오기

    	String memberId = (String) session.getAttribute("id");
        
        if (memberId == null) {
            return "redirect:/login";
        }

        carInfo.setId(memberId);

        if (!multipartFile.isEmpty()) {
            String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);

            UUID uid = UUID.randomUUID();
            String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
            File file = new File(filePath, saveName);

            System.out.println("insertBoard - newName : " + file.getName());

            multipartFile.transferTo(file);

            carInfo.setCarImg(saveName);
        }

        carInfoService.insertCarInfo(carInfo);
        CarInfo updatedCarInfo = carInfoService.carInfo(memberId);

        session.setAttribute("info", updatedCarInfo);
        session.setAttribute("carInfoCheck", true);  // 세션에 차량 정보가 등록되었음을 표시

        return "redirect:main";  // 리다이렉트를 통해 갱신된 정보가 반영되도록 함
    }
    
    @RequestMapping("/cmileageUpdateProcess")
    public String updateCarMileage(String id, String editCmileage, HttpSession session) {
    	
    	String memberId = (String) session.getAttribute("id");
    	
        carInfoService.updateCarMileage(memberId, editCmileage);
        
        return "BricksMain";
        
    }
}
