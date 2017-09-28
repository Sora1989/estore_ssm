package com.lunxuu.estore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunxuu.estore.dao.UserDao;
import com.lunxuu.estore.pojo.User;
import com.lunxuu.estore.service.UserService;
import com.lunxuu.estore.utils.MD5Utils;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Integer register(User user) {
		String password = user.getPassword();
		user.setPassword(MD5Utils.str2MD5(password));
		Integer result = userDao.register(user);
		return result;
	}

	@Override
	public User toLogin(String username, String password) {
		password = MD5Utils.str2MD5(password);
			return userDao.toLogin(username, password);
	}

	@Override
	public Integer iRegistered(User user) {
		return userDao.isRegistered(user.getUsername());
	}

}
