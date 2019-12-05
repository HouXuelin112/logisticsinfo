package it.hxl.controller;

import it.hxl.po.Admin;
import it.hxl.po.LogisticsInfo;
import it.hxl.po.User;
import it.hxl.services.AdminService;
import it.hxl.services.LogisticsInfoService;
import it.hxl.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private LogisticsInfoService logisticsInfoService;
	
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
			Cookie crem = new Cookie("rem", rem);
			Cookie cUsername = new Cookie("username", user.getUsername());
			Cookie cPassword = new Cookie("password", user.getPassword());
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			crem.setPath("it/hxl/controller/UserController");
			crem.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(crem);
			response.addCookie(cPassword);
		}else{
			//否则将用户名名密码置空
			Cookie cUsername = new Cookie("username", "");
			Cookie cPassword = new Cookie("password", "");
			Cookie crem = new Cookie("rem", "");
			cPassword.setPath("it/hxl/controller/UserController");
			cPassword.setMaxAge(30 * 60 * 24);
			cUsername.setPath("it/hxl/controller/UserController");
			cUsername.setMaxAge(30 * 60 * 24);
			crem.setPath("it/hxl/controller/UserController");
			crem.setMaxAge(30 * 60 * 24);
			response.addCookie(cUsername);
			response.addCookie(cPassword);
			response.addCookie(crem);
		}

		List<Admin> admins = adminService.findAllAdmin();
		LogisticsInfo logisticsInfo1 = new LogisticsInfo();
		logisticsInfo1.setAdmin(new Admin());
		List<LogisticsInfo> logisticsInfos = logisticsInfoService.findAllLogisticsInfo(logisticsInfo1);
		session.setAttribute("admins", admins);
		for (LogisticsInfo logisticsInfo: logisticsInfos){
			System.out.println(logisticsInfo.getIssueDate());
		}
		session.setAttribute("logisticsInfos", logisticsInfos);
		session.setAttribute("user", user);
		return "user/main";
	}


	@RequestMapping("/detail")
	@ResponseBody
	public LogisticsInfo findDetail(@RequestBody LogisticsInfo logisticsInfo1){
		System.out.println(logisticsInfo1);
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo1).get(0);
	}

	@RequestMapping("/main")
	public String toMain(){
		return "user/main";
	}

	@RequestMapping("/car_info")
	public String toCar_info(){
		return "user/car_info";
	}

	@RequestMapping("/goods_info")
	public String toGoof_info(){
		return "user/goods_info";
	}

	@RequestMapping("/enterprise_info")
	public String toEnterprise_info(){
		return "user/enterprise_info";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "user/userLogin";
	}

	@RequestMapping("/findLogisticsInfos")
	@ResponseBody
	public List<LogisticsInfo> findLogisticsInfos(@RequestBody LogisticsInfo logisticsInfo){
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo);
	}

	@RequestMapping("/findAllLogis")
	@ResponseBody
	public List<LogisticsInfo> findAllLogis(){
		LogisticsInfo logisticsInfo1 = new LogisticsInfo();
		logisticsInfo1.setAdmin(new Admin());
		return logisticsInfoService.findAllLogisticsInfo(logisticsInfo1);
	}

}
