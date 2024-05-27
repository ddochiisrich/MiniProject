package com.second.miniproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public class LoginCheckInterceptor {

	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		// 우리 컨트롤러가 호출되기 전에 실행
		// 조건에 맞아 true 가 되면 다음으로 연결. false 라면 다음으로 연결이 않됨
		if (req.getSession().getAttribute("isLogin") == null) {
			return false;
		}
		return true;
	}

	/* modelAndView 는 요즘 개발 트렌드에서는 잘 사용하지 않는다고 합니다. - modelAndView : 데이터와 이동하고자 하는 view page 를 같이 저장한다.
	 * 메소드 종류
	 * setViewName(String view)
	 * addObject(String name, Object value)
	 * addAllObject(Map values)
	 */
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object hanler, ModelAndView modelAndView)
			throws Exception {
		// 우리 컨트롤러가 실행되고 dispatcher 로 넘어갈 때 실행
		System.out.println("postHandle : " + modelAndView.getViewName());
	}
}