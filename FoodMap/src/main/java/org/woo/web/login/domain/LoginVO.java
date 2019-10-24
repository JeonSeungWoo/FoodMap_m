package org.woo.web.login.domain;

public class LoginVO {

	private String id;
	private String usernm;
	private String nickname;
	private String gender;
	private String birthday;
	
	//어떤 방식의 로그인인지 확인.
	private int loginconf;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsernm() {
		return usernm;
	}

	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getLoginConf() {
		return loginconf;
	}

	public void setLoginConf(int loginConf) {
		this.loginconf = loginConf;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", usernm=" + usernm + ", nickname=" + nickname + ", gender=" + gender
				+ ", birthday=" + birthday + ", loginConf=" + loginconf + "]";
	}
	
	
	
	
	
	
	
}
