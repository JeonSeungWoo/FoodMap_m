package org.woo.web.login.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.woo.web.login.domain.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Inject
	private SqlSession session;

	@Override
	public void loginCreate(LoginVO vo) throws Exception {
		session.insert("login.loginCreate",vo);
	}

	@Override
	public Integer checkId(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("login.checkId",vo);
	}
	

}
