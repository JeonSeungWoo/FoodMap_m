package org.woo.test.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAOImpl implements TestDAO {

	@Inject 
	private SqlSession session;
	
	@Override
	public String time() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("test.time");
	}

}
