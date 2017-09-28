package com.lunxuu.estore.service;

import com.lunxuu.estore.pojo.User;

public interface UserService {
	Integer register(User user);

	User toLogin(String username, String password);

	Integer iRegistered(User user);
}
