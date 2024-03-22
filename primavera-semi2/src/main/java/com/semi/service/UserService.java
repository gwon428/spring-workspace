package com.semi.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.semi.model.dao.UserDAO;
import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
import com.semi.model.vo.User;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = dao.getMemberById(username);
		return user;
	}

	public User idCheck(String id) {
		return dao.check(id);
	}

	public User phoneCheck(String phone) {
		return dao.phonecheck(phone);
	}

	public User emailCheck(String email) {
		return dao.emailcheck(email);
	}

	public User userCheck(User user) {
		return dao.checkUser(user);
	}

	// 카카오 로그인
	public String getAccessToken(String authorize_code) throws IOException {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=2aa4500445d4b2a832d23e0d819fb737"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:8080/kakaologin"); // REDIRECT_URI 본인이 설정한 주소 넣어주기
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	public User getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String id = element.getAsJsonObject().get("id").getAsString();
			userInfo.put("name", nickname);
			userInfo.put("id", id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 정보가 저장되어있는지 확인
		User result = dao.findkakao(userInfo);
		if(result == null) {
			dao.kakaoinsert(userInfo);
			return dao.findkakao(userInfo);
			// 가입 후 픽업 신청 시 회원 정보를 수정하도록.
			// 이 때 비밀번호 설정해도 저장 안 되는 이유?가 뭔지..
			} else {
			UserDetails user = loadUserByUsername(result.getId());
			Authentication auth = new UsernamePasswordAuthenticationToken(user, "", user.getAuthorities());
			SecurityContext context = SecurityContextHolder.createEmptyContext();
			context.setAuthentication(auth);
			SecurityContextHolder.setContext(context);
			return result;
		}
	}

	public int registerUser(User user) {
		String encodePw = bcpe.encode(user.getPassword());
		user.setPassword(encodePw);
		return dao.registerUser(user);
	}

	public int updateUser(User user) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User userDetails = (User) principal;

		String inputPw = bcpe.encode(user.getPassword());
		user.setPassword(inputPw);

		userDetails.setName(user.getName());
		userDetails.setPhone(user.getPhone());
		userDetails.setEmail(user.getEmail());

		return dao.updateUser(user);
	}
	
	public void logout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	// 회원 탈퇴 시 연결 끊기
	public void unlink(String link) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + link);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		
		System.out.println("Service userDetails : " + userDetails);
		// DB에서도 삭제
		dao.deleteUser(userDetails);
	}

	public int deleteUser(UserDetails userDetails) {
		return dao.deleteUser(userDetails);
	}

	public List<User> showAllUser(Paging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.showAllUser(paging);
	}

	public int total() {
		return dao.total();
	}

	public User findId(User user) {
		return dao.findId(user);
	}

	public User checkEmail(User user) {
		return dao.checkEmail(user);
	}

	// 내가 쓴 후기 리스트 출력
	public List<Review> showReview(Pagingseven paging) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;

		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));

		paging.setId(userDetails.getUsername());
		return dao.showReview(paging);
	}

	public int showReviewtotal() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;

		return dao.totalmyReview(userDetails.getUsername());
	}

	// 내가 쓴 qna 리스트 출력
	public List<Qna> showQna(Pagingseven paging) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;

		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));

		paging.setId(userDetails.getUsername());
		return dao.showQna(paging);
	}

	public int showQnatotal() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		return dao.totalmyQna(userDetails.getUsername());
	}

	public int updatePwd(User user) {
		String inputPw = bcpe.encode(user.getPassword());
		user.setPassword(inputPw);
		return dao.updatePwd(user);
	}

	// 수집일 순
	public List<User> showUsercolDate(Paging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.showUsercolDate(paging);
	}

	// 주문번호 순
	public List<User> showUserorderNum(Paging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.showUserorderNum(paging);
	}

	

}
