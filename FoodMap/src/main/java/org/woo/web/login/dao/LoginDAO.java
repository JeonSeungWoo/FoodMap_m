package org.woo.web.login.dao;

import org.woo.web.login.domain.LoginVO;

public interface LoginDAO {
public void loginCreate(LoginVO vo)throws Exception;
public Integer checkId(LoginVO vo) throws Exception;
}
