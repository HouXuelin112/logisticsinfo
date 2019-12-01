package it.hxl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistController {

	@RequestMapping("/regist")
	public String toRegist() {
		return "regist";
	}
}
