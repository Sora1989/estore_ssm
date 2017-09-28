package com.lunxuu.estore.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lunxuu.estore.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao{
	Integer register(User user);

	User toLogin(@Param("username") String username,
			@Param("password") String password);

	Integer isRegistered(String username);
}
