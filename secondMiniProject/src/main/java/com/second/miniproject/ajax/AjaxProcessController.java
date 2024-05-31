package com.second.miniproject.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.second.miniproject.service.MemberService;

@Controller
public class AjaxProcessController {
	@Autowired
	private MemberService memberService;

	// 응답 데이터 유형 - json
	public Map<String, Boolean> memberPassCheck(String id, String pass){
		Map<String, Boolean> resultMap = new HashMap<String, Boolean>();
		boolean result = memberService.memberPassCheck(id, pass);
		resultMap.put("result", result);
		
		return resultMap;
	}
}
