package kr.co.hangOn.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.hangOn.repository.domain.User;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	 
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception { 
		HttpSession session = request.getSession(); 
        User user = (User)session.getAttribute("user"); 
        if (user != null) { 
            return true; 
        } 
        else {
        	session.setAttribute("filter", "filter");
        	response.sendRedirect("../main/filter.do"); 
        	return false; 
        }
	} 
}
