package it.hxl.controller;

import it.hxl.po.User;
import it.hxl.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userLogin")
	public String toUserLogin() {
		return "user/userLogin";
	}

	@RequestMapping("/handleLogin")
	public String handleLogin(HttpSession session, HttpServletResponse response, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam(name="rem", required = false) String rem){
		if("".equals(username) || "".equals(password)){
			session.setAttribute("msg", "请输入完整的用户名或密码");
			return "redirect:userLogin";
		}
		User user = userService.findUser(username, password);
		if(user == null){
			session.setAttribute("msg", "用户名或密码错误");
			return "redirect:userLogin";
		}
		if("rem".equals(rem)){
			//如果勾选记住密码则将用户名密码放入cookie传到浏览器
			Cookie cUsername = new Cookie("username", user.getUsername());
			Cookie cPassword = new Cookie("password", user.getPassword());
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(cPassword);
		}else{
			//否则将用户名名密码置空
			Cookie cUsername = new Cookie("username", "");
			Cookie cPassword = new Cookie("password", "");
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(cPassword);
		}
		session.setAttribute("user", user);
		return "user/main";
	}
	
}
