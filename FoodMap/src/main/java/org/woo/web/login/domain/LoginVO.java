package org.woo.web.login.domain;

public class LoginVO {

	private String id;
	//어떤 방식의 로그인인지 확인.(PW 같은 역활)
	private String loginconf;
	
	private String usernm;
	private String gender;
	private String birthday;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginconf() {
		return loginconf;
	}
	public void setLoginconf(String loginconf) {
		this.loginconf = loginconf;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", loginconf=" + loginconf + ", usernm=" + usernm + ", gender=" + gender
				+ ", birthday=" + birthday + "]";
	}
	
	
	
	
	
	
	
}
