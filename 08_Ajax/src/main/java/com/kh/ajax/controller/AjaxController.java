package com.kh.ajax.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ajax.model.vo.Member;
import com.kh.ajax.service.MemberService;

@Controller
public class AjaxController {

	public static final String serviceKey = "UNmnLkcNtzgMKivBzvyb3TdrsqmthwquJWOHYpkKXK6aXtSdhG1gbTQ6EOqATL5t3ApCJ2hySkej4pCTXuaAZg%3D%3D";
	
	@ResponseBody
	@GetMapping(value="/animal", produces="application/json; charset=utf-8")
	public String animal(String name) throws IOException {
		
		String url = "https://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo";
		
		url += "?ServiceKey=" + serviceKey;
		url += "&care_nm=" + URLEncoder.encode(name, "UTF-8");
		url += "&_type=json";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";	// JSON이 담기는 변수
		String line = null;
		while((line = br.readLine())!=null) {
			responseText += line;
		}
		br.close();
		urlConnection.disconnect();
		
		System.out.println(responseText);
		
		return responseText;
	}
	
	private int count = 0;
	
	@Autowired
	private MemberService service;
	
	@ResponseBody	// 응답 자체?
	@GetMapping("/count")
	public int count() {
		System.out.println("ajax로 요청이 들어옴!");
		return ++count;
	}
	
	@ResponseBody		// 이걸 하지 않으면 .jsp를 찾음
	@GetMapping("/encoding")
	public String encoding(String nick) {
		System.out.println("encoding...");
		return nick;
	}
	
	@ResponseBody
	@PostMapping("/check")
	public boolean check(String id) {
		Member member = service.idCheck(id);
		if(member == null) return false;
		return true;
	}
	
	@ResponseBody
	@PostMapping("/serial")
	public Member serial(Member member) {
		System.out.println(member);
		service.register(member);
		return member;
	}
}
