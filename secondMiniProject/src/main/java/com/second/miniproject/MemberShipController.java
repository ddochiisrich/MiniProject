package com.second.miniproject;

import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("membership") // 해당 컨트롤러 내에서만 동작. 해당 컨트롤러 안에서 다루는 특정 모델 객체를 세션에 넣고 공유할 때 사용
public class MemberShipController {

}
