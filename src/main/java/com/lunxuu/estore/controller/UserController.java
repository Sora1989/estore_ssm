package com.lunxuu.estore.controller;

import com.lunxuu.estore.service.impl.UserServiceImpl;
import com.sun.deploy.net.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lunxuu.estore.pojo.User;
import com.lunxuu.estore.service.UserService;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;

@Controller
@RequestMapping("user")
public class
UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("toLogin")
		public String toLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		// 1. 获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 2. 调用service查询用户
		User user = userService.toLogin(username, password);
		//3. 判断user是否为null
		if (user == null) {
			String msg = "用户名或密码错误！";
			//msg = new String(msg.getBytes("ISO-8859-1"), "UTF-8");
			request.setAttribute("msg",msg);
			return "login";
		}
		//4. 将用户对象保存到session中
		request.getSession().setAttribute("loginUser",user);

		//5. 记住用户
		String remember = request.getParameter("remember");
		if (remember != null) {
			//对用户名进行编码，解决中文编码问题
			username = URLEncoder.encode(username,"UTF-8");
			Cookie c = new Cookie("username", username);
			c.setPath("/");
			c.setMaxAge(9999999);
			response.addCookie(c);
		}else{
			//删除cookie
			//对用户进行编码
			Cookie c = new Cookie("username",null);
			c.setPath("/");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		return "index";
	}

	@RequestMapping("register")
	public String register(@RequestBody User user){
		if (!userService.iRegistered(user)) {
			Integer result = userService.register(user);
			if (result == 1){
				return "login";
			}else{
				return "register";
			}
		} else {
			return "";
		}
	}

}
