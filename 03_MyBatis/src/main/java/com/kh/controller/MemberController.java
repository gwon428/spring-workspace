package com.kh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.model.vo.Member;
import com.kh.service.MemberService;

// 어노테이션을 통한 bean 등록
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@GetMapping("allMember") /*@RequestMapping*/
	public String allMember(Model model) {
		List<Member> list = service.showAllMember();
		// request에 담았던 것을 model에 담는다!
		model.addAttribute("list", list);
		return "allMember";
		// /WEB-INF/views/allMember.jsp
	}
	
	// register -> register.jsp (회원 정보 : 아이디, 비밀번호, 이름) -> (@Get/PostMapping) signUp (매개변수 Member를 통해 받음)
	// -> redirect : 첫 페이지로 이동 (로그인 된 상태로의) return "redirect:/index.jsp";
	@GetMapping("register")
	public String registerMember() {
		return "register";
	}
	
	@PostMapping("signUp")
	public String signUp(Member vo) {
		service.registerMember(vo);
		return "redirect:/";
	}
	
	// login -> login.jsp (아이디, 비밀번호) -> @PostMapping : signIn (매개변수 Member를 통해 받음)
	// -> session : 멤버 정보 저장을 위해 매개변수로 HttpServletRequest -> session에 바인딩
	// -> login_result.jsp (회원 정보 보일 수 있도록)
	@GetMapping("login")
	public String logIn() {
		return "login";
	}
	
	@PostMapping("signIn")
	public String signIn(HttpServletRequest request, Member vo) {
		HttpSession session = request.getSession();
		session.setAttribute("vo", service.signIn(vo));
		return "login_result";
	}
	
	// logout -> session 죽이기! : 매개변수로 HttpServletRequest
	// -> redirect : 첫 페이지로 이동 return "redirect:/index.jsp";
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// getAttribute로 member를 받아와서 member가 null이 아닌 경우 session 죽이기
		session.invalidate();
		return "redirect:/";
	}
	
	// update -> update.jsp (회원 정보가 보여진 상태 : 아이디, 비밀번호, 이름) -> 업데이트할 것들 입력받아서
	// @PostMapping : updateMember (매개변수 Member를 통해 받음)
	// -> redirect : 첫 페이지로 이동 return "redirect:/index.jsp";
	@GetMapping("update")
	public String update() {
		return "update";
	}
	
	@PostMapping("updateMember")
	public String update(Member vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// && vo가 null이 아닐 경우 조건도 필요하긴 함
		if(service.updateMember(vo)==1){
			session.setAttribute("vo", vo);
		}
		return "redirect:/";
	}
	
	// search -> search.jsp (키워드 정보 하나만 받음!) -> @GetMapping : find (String keyword)로 받음)
	// -> find_result.jsp (검색된 정보 보일 수 있도록! 여러 명 가능 WHERE id LIKE %keyword%) OR name LIKE %keyword%
	@GetMapping("search")
	public String search() {
		return "search";
	}
	
	@GetMapping("findMember")
	public String find(Model model, String select, String keyword){
		List<Member> list = service.findMember(keyword, select);
		// 데이터 바인딩 (스프링이 제공하는 Model model)
		model.addAttribute("list", list);
		return "find_result";
	}
	
	@GetMapping("find2")
	public String find2(String[] checkId, Model model) {
		List<Member> list = service.findMember2(checkId);
		model.addAttribute("list", list);
		return "find_result";
	}
}
