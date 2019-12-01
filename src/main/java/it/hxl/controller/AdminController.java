package it.hxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/adminLogin")
	public String toAdminLogin() {
		return "admin/adminLogin";
	}

	@RequestMapping("/handleLogin")
	public String handleLogin(){
		return "";
	}
}
