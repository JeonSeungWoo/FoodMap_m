package org.woo.web.login.service;

import org.woo.web.login.domain.LoginVO;

public interface LoginService {
	public void loginCreate(LoginVO vo)throws Exception;
	public Integer checkId(LoginVO vo) throws Exception;
	public LoginVO login(LoginVO vo)throws Exception;
}
