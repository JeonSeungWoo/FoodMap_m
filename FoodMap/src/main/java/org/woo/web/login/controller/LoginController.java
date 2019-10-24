package org.woo.web.login.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.woo.web.login.domain.LoginVO;
import org.woo.web.login.service.LoginService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	private LoginService service;

	@RequestMapping(value = "/loginCreate", method = RequestMethod.POST)
	public String loginCreate(Model model, LoginVO vo) throws Exception {
		
		//처음 등록 할 경우 insert후 nickName 설정.
		service.loginCreate(vo);
		
		return "redirect:/user/login";

	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void checkId(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		System.out.println("req : " + req);
		System.out.println("res : " + res);
		/*
		 * PrintWriter out = res.getWriter(); try { String parmid =
		 * (req.getParameter("id")== null)? "" : String.valueOf(req.getParameter("id"));
		 * LoginVO vo = new LoginVO(); vo.setId(parmid.trim()); Integer checkPoint =
		 * service.checkId(vo); out.print(checkPoint); out.flush(); out.close(); } catch
		 * (Exception e) { e.printStackTrace(); out.print("1"); }
		 */
		
		
		
		}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
