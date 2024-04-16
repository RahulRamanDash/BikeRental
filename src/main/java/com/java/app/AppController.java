package com.java.app;

public class AppController {
	
	private UsersDaoImpl userImpl;

	public UsersDaoImpl getUserImpl() {
		return userImpl;
	}
	public void setUserImpl(UsersDaoImpl userImpl) {
		this.userImpl = userImpl;
	}
	
	
	// main controled methods
	public String userLogin(Users user) {
		return userImpl.userLoginDao(user);
	}
	
	
	
}
