package com.semi.controller;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
import com.semi.model.vo.User;
import com.semi.service.UserService;

@Controller
public class UserController {

	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private UserService service;

	@Autowired
	private HttpSession session;

	@Autowired
	JavaMailSenderImpl mailSender;

	// 마이페이지로 이동
	// 비회원 시 : 로그인, 회원가입, 아이디 찾기, 비밀번호 찾기
	// 회원 : 내 review, 내 Q&A, 진행상황, 회원정보수정, 회원탈퇴, 로그아웃
	// 관리자 : 공지 게시판, Q&A 관리, 전체 회원 조회, progress 관리, 수거신청 현황, 로그아웃
	@GetMapping("myPage")
	public String myPage() {
		return "user/myPage";
	}

	/*------------------------------------------  로그인 ------------------------------------------*/
	// 카카오 로그인
	@GetMapping("/kakaologin")
	public String Kakaologin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 사용자 코드 : code
		// 받은 코드를 getAccessToken으로 보냄
		String access_Token = service.getAccessToken(code);

		User userInfo = service.getUserInfo(access_Token);

		session.invalidate();
		session.setAttribute("kakaoName", userInfo.getName());
		session.setAttribute("kakaoId", userInfo.getId());

		return "collect/collect";
	}

	/*------------------------------------------ 회원가입 ------------------------------------------*/
	// 회원가입
	@GetMapping("/register")
	public String join() {
		return "user/register";
	}

	// 회원가입 시 아이디 중복 체크
	@ResponseBody
	@PostMapping("/check")
	public boolean check(String id) {
		User user = service.idCheck(id);
		if (user == null)
			return false;
		return true;
	}

	// 회원가입 시 전화번호 중복 체크
	@ResponseBody
	@PostMapping("/checkphone")
	public boolean checkphone(String phone) {
		User user = service.phoneCheck(phone);
		if (user == null)
			return false;
		return true;
	}

	// 회원가입 시 이메일 중복 체크
	@ResponseBody
	@PostMapping("/checkemail")
	public boolean emailcheck(String email) {
		User user = service.emailCheck(email);
		if (user == null)
			return false;
		return true;
	}

	// 회원가입 후 마이페이지로
	@PostMapping("/register")
	public String register(User user) {
		service.registerUser(user);
		return "user/myPage";
	}

	/*------------------------------------------ 회원정보수정 ------------------------------------------*/
	// 회원정보수정
	// 비밀번호가 비어있을 경우 (카카오로 로그인 하자마자) 바로 수정 폼으로
	// 비밀번호가 비어있지 않을 경우 (일반적인 경우) 비밀번호 확인 후 수정 폼으로
	@GetMapping("/userUpdate")
	public String update() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User userDetails = (User) principal;
		if (userDetails.getPassword() == null) {
			return "user/updateUser";
		}
		return "user/updateCheck";
	}

	// 비밀번호 확인 후 일치하면 수정 폼, 불일치하면 다시 확인하는 화면
	@PostMapping("/updateCheck")
	public String updateCheck(String password, Model model) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User userDetails = (User) principal;

		model.addAttribute("pwd", password);

		if (bcpe.matches(password, userDetails.getPassword()) || password.equals(userDetails.getPassword())) {
			model.addAttribute("user", userDetails);
			return "user/updateUser";
		} else {
			return "redirect:/userUpdate";
		}

	}

	// 카카오 유저가 바로 접근 시 (jsp에서 비밀번호 null 조건 걸어둠) 바로 수정 폼으로
	@GetMapping("/updatekakaoUser")
	public String updateUser() {
		return "user/updateUser";
	}

	// 회원정보 수정 폼
	@PostMapping("/updateUser")
	public String update(@AuthenticationPrincipal User user, HttpServletRequest request, Authentication authentication,
			Model model) {

		// 변경할 비밀번호를 다시 암호화해서 sql에 업데이트
		HttpSession session = request.getSession();
		if (service.updateUser(user) == 1) {
			session.setAttribute("user", user);
		}
		model.addAttribute("user", user);
		return "redirect:/";
	}

	// 회원 정보 수정 시 전화번호 중복 체크
	@ResponseBody
	@PostMapping("/editphone")
	public int editphone(String phone) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User) principal;

		User editphone = service.phoneCheck(phone);

		boolean check = false;

		if (editphone != null) {
			// 누군가의 전화번호인 경우
			check = user.getPhone().equals(editphone.getPhone());
		} else {
			check = false;
		}

		if (check) {
			// 본인 번호일 때
			return 2;
		} else if (editphone == null) {
			// 본인 번호가 아니고, 기존 사용자의 번호도 아닐 때
			// 사용 가능할 때
			return 1;
		}

		return 3;
	}

	// 회원 정보 수정 시 이메일 중복 체크
	@ResponseBody
	@PostMapping("/editemail")
	public int editemail(String email) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = (User) principal;

		User editemail = service.emailCheck(email);

		boolean check = false;

		if (editemail != null) {
			// 누군가의 전화번호인 경우
			check = user.getEmail().equals(editemail.getEmail());
		} else {
			check = false;
		}

		if (check) {
			// 본인 번호일 때
			return 2;
		} else if (editemail == null) {
			// 본인 번호가 아니고, 기존 사용자의 번호도 아닐 때
			// 사용 가능할 때
			return 1;
		}

		return 3;
	}

	// 회원정보 수정 시 본인일 경우 전화번호, 이메일 중복 확인에서 본인의 전화번호, 이메일 제외
	@ResponseBody
	@PostMapping("/checkUser")
	public boolean checkUser(User user) {

		User finder = service.userCheck(user);

		if (finder == null)
			return false;
		return true;
	}

	/*------------------------------------------ 회원 탈퇴 ------------------------------------------*/
	// 회원 탈퇴 시도 시 비밀번호 확인 창으로
	@GetMapping("/deleteUser")
	public String delete() {
		return "user/deleteCheck";
	}

	// 탈퇴 (비밀번호 확인 후 탈퇴 처리)
	@PostMapping("/deleteCheck")
	public String deleteCheck(String password) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		if (bcpe.matches(password, userDetails.getPassword())) {
			service.deleteUser(userDetails);
			SecurityContextHolder.clearContext();
			return "redirect:/";
		} else {
			return "user/deleteCheck";
		}
	}

	// 카카오 연결 끊기 -> DB에서도 삭제 처리
	@GetMapping("/kakaounlink")
	public String unlink(HttpSession session) {
		String link = (String) session.getAttribute("access_Token");
		service.unlink(link);
		session.invalidate();
		return "redirect:/";
	}

	/*------------------------------------------ 로그아웃 ------------------------------------------*/
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "user/myPage";
	}

	/*------------------------------------------ 비회원 ------------------------------------------*/
	/*------------------------------------------ 아이디 찾기 ------------------------------------------*/

	// 비회원 - 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "account/findId";
	}

	// 비회원 - 아이디 찾기 (이름, 이메일)
	@PostMapping("/findId")
	public String findId(User user, Model model) {
		// 찾고자 하는 사용자 정보(이름, 이메일)을 user 형태로 받아 jsp에서 출력할 수 있도록 바인딩
		model.addAttribute("finder", user);
		if (service.findId(user) != null) {
			// 찾은 user 정보를 jsp에서 출력할 수 있도록 바인딩
			model.addAttribute("user", service.findId(user));
			// 찾기를 성공했을 경우 나오는 페이지
			return "account/findIdResult";
		} else {
			// 해당 사용자가 없다고 출력할 페이지
			return "account/findFail";
		}
	}

	// 찾은 아이디로 로그인하기
	@GetMapping("/findIdlogin")
	public String findIdLogin(String id, Model model) {
		model.addAttribute("id", id);
		return "/user/myPage";
	}
	
	/*------------------------------------------ 비밀번호 찾기 ------------------------------------------*/
	// 비회원 - 비밀번호 찾기
	@GetMapping("changePwd")
	public String changePwd(String id, Model model) {
		model.addAttribute("id", id);
		return "account/changePwd";
	}

	// 비회원 - 메일 전송
	@ResponseBody
	@PostMapping("/EmailAuth")
	public int emailAuth(String email) {

		Random random = new Random();
		// 난수 범위 : 111111~999999 (6자리 난수)
		int checkNum = random.nextInt(888888) + 111111;

		String setForm = "primavera240327@gmail.com";
		String toMail = email;
		String title = "비밀번호 변경 인증 이메일입니다.";
		String content = "인증 코드는 " + checkNum + "입니다. " + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return checkNum;
	}

	// 아이디와 비밀번호 확인 후 비밀번호 재설정 페이지로
	@PostMapping("checkEmail")
	public String checkEmail(User user, Model model) {
		model.addAttribute("id", user.getId());
		return "account/changePassword";
	}

	@PostMapping("updatePwd")
	public String updatePwd(User user, HttpServletRequest request, Authentication authentication) {
		HttpSession session = request.getSession();
		if (service.updatePwd(user) == 1) {
			session.setAttribute("user", user);
		}
		return "user/myPage";
	}

	/*------------------------------------------ 관리자 ------------------------------------------*/
	// 관리자 - 전체 회원 조회
	@GetMapping("allUser")
	public String allUser(Model model, Paging paging) {
		List<User> list = service.showAllUser(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Paging(paging.getPage(), service.total()));
		return "user/allUser";
	}
	
	/*------------------------------------------ 회원 -------------------------------------------*/
	// 내가 쓴 review
	@GetMapping("showReview")
	public String showReview(Model model, Pagingseven paging) {
		List<Review> list = service.showReview(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Pagingseven(paging.getPage(), service.showReviewtotal()));
		return "user/showReview";
	}

	// 내가 쓴 qna
	@GetMapping("showQna")
	public String showQna(Model model, Pagingseven paging) {
		List<Qna> list = service.showQna(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new Pagingseven(paging.getPage(), service.showQnatotal()));
		return "user/showQna";
	}

	

}
