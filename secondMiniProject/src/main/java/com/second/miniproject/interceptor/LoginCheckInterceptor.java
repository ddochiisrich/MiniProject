package com.second.miniproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
public class LoginCheckInterceptor implements HandlerInterceptor {
=======
public class LoginCheckInterceptor implements HandlerInterceptor{ // HandlerInterceptor 통한 로그인 유무 확인
>>>>>>> branch 'hyhy' of https://github.com/ddochiisrich/MiniProject.git

<<<<<<< HEAD
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        // 우리 컨트롤러가 호출되기 전에 실행
        // 조건에 맞아 true가 되면 다음으로 연결. false라면 다음으로 연결되지 않음
        if (req.getSession().getAttribute("isLogin") == null) {
            resp.sendRedirect("loginForm"); // 로그인 폼으로 리다이렉트
            return false;
        }
        return true;
    }
=======
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		// 우리 컨트롤러가 호출되기 전에 실행
		// 조건에 맞아 true 가 되면 다음으로 연결. false 라면 다음으로 연결이 않됨
		if (req.getSession().getAttribute("isLogin") == null) {
			resp.sendRedirect("loginForm");
			return false;
		}
		return true;
	}
>>>>>>> branch 'hyhy' of https://github.com/ddochiisrich/MiniProject.git

<<<<<<< HEAD
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler, ModelAndView modelAndView)
            throws Exception {
        // 우리 컨트롤러가 실행되고 dispatcher로 넘어갈 때 실행
        if (modelAndView != null) {
            System.out.println("postHandle : " + modelAndView.getViewName());
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex)
            throws Exception {
        // 요청 완료 후 실행
    }
}
=======
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

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
>>>>>>> branch 'hyhy' of https://github.com/ddochiisrich/MiniProject.git
