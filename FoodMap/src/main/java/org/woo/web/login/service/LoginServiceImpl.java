package org.woo.web.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.woo.web.login.dao.LoginDAO;
import org.woo.web.login.domain.LoginVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override
	public void loginCreate(LoginVO vo) throws Exception {
	
		dao.loginCreate(vo);
	}

	@Override
	public Integer checkId(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkId(vo);
	}

	@Override
	public LoginVO login(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

}
