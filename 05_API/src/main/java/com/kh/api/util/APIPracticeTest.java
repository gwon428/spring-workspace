package com.kh.api.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class APIPracticeTest {

	public static final String serviceKey = "UNmnLkcNtzgMKivBzvyb3TdrsqmthwquJWOHYpkKXK6aXtSdhG1gbTQ6EOqATL5t3ApCJ2hySkej4pCTXuaAZg%3D%3D";
	
	public static void main(String[] args) throws IOException {
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstMsgService/getSeaFcst";
		url += "?ServiceKey=" + serviceKey;
		url += "&pageNo=" + 2;
		url += "&numOfRows="+ 5;
		url += "&regId=" + "12A20100";
		url += "&dataType=" + URLEncoder.encode("JSON", "UTF-8");
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = null;
		while((line = br.readLine())!=null) {
			System.out.println(line);
		}
		br.close();
		urlConnection.disconnect();
	}

}
