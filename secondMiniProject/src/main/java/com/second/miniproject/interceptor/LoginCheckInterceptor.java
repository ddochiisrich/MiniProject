package com.second.miniproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheckInterceptor implements HandlerInterceptor {

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
