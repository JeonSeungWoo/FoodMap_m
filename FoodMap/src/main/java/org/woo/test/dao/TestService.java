package org.woo.test.dao;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TestService {
	@Inject
	private TestDAO dao;
	
	public String time() throws Exception {
		// TODO Auto-generated method stub
		return dao.time();
	}
	
}
