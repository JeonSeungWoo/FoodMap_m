package org.woo.web.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.woo.web.login.domain.LoginVO;

@Controller
@RequestMapping("/main/*")
public class MainController {

	
	

	@RequestMapping(value = "/insertPage", method = RequestMethod.GET)
	public String insertPage(Model model, LoginVO vo) throws Exception {

		return "main/insertPage";

	}
}
