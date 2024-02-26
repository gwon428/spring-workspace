package com.kh.security.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

// 로그인 성공했을 때에 대한 handler (로그인하고 어디 페이지로 이동, 같은 것들에 대한 관리)
// failhandler, accessdenied... 등 많음!
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		// role에 따라 로그인 시 보이는 화면
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			String auth = authority.getAuthority();
			roleNames.add(auth);
		});
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin");
			return;
		} else if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/member");
			return;
		}
		response.sendRedirect("/all");
		}
	
	
}
