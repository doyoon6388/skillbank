package com.skillbank.main.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            String uri = request.getRequestURI();
            String query = request.getQueryString();
            // 파라미터가 존재하면 합쳐서 저장, 없으면 그냥 URI 저장
            if (query != null) {
                uri += "?" + query;
            }
            session.setAttribute("prevPage", uri);
            response.sendRedirect("/login");
            return false;
        }

        return true;  // 컨트롤러 진입 허용
    }
}
