package com.kh.storage.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Controller
public class MemberController {
	
	@PostMapping("/login")
	public String login(String id, String pwd, Model model) {
		
		// 로그인 처리를 했다고 가정
		
		// 자동 로그인, 개인정보 수정 내에서 기존 비밀번호 정보
		// JWT(JSON Web Token) 토큰을 만들어서 해당 정보를 localStorage에 담아서 사용
		String token = jwtToken(id, pwd);
		System.out.println(token);
		
		// 발행한 토큰을 model을 통해 바인딩
		model.addAttribute("token", token);
		
		// 로그인 되었다 가정 하에 토큰을 받아서 해당 정보들을 다시 디코딩해서 가져오기
		Claims claims = decodeJwt(token);
		String password = claims.get("pwd", String.class);
		System.out.println(password);
		return "result";
	}
	
	// 토큰 만드는 메서드
	private String jwtToken(String id, String pwd) {
		Date now = new Date();		// 현재 날짜
		Date expireDate = new Date(now.getTime() + 3600000);	// 유효 시간 1시간
		return Jwts.builder()
				.setSubject(id)
				.claim("pwd", pwd)
				.setIssuedAt(now)	// IssuedAt : 토큰이 발급된 시간 저장
				.setExpiration(expireDate)	// 토큰 만료 시간
				.signWith(SignatureAlgorithm.HS512, "storage-token")
				.compact();
	}
	
	private Claims decodeJwt(String token) {
		Jws<Claims> claims = Jwts.parser()
				.setSigningKey("storage-token")
				.parseClaimsJws(token);
		return claims.getBody();
	}
}
