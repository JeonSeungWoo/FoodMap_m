package org.woo.web.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.woo.web.login.domain.LoginVO;
import org.woo.web.login.service.LoginService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	private LoginService service;

	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginCreate(Model model, LoginVO vo) throws Exception {

		return "login/loginSuccess";

	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void checkId(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model,
			@RequestBody LoginVO vo) throws Exception {
		System.out.println(vo);

		System.out.println(service.checkId(vo));

		int checkId = service.checkId(vo);

		if (checkId == 0) {
			// 회원 가입 후 로그인.
			service.loginCreate(vo);

			service.login(vo);
			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.

		} else {
			// 로그인 성공.
			service.login(vo);
			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.
		}

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
		// http://developers.kakao.com/logout
		
		return "redirect:/";

	}

}
