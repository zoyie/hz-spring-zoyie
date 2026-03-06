package com.hzvtc.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();

        // 允许访问的路径
        if (uri.contains("/auth/") || uri.equals("/") || uri.contains("/static/")) {
            return true;
        }

        // 检查用户是否登录
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return false;
        }

        return true;
    }
}
