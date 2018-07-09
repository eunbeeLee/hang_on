package kr.co.hangOn.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class UserController {
	
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "register/register";
	}
	
	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword/forgotPassword";
	}
	
	@RequestMapping("/customerService.do")
	public String customerService() {
		return "customerService/customerService";
	}
	
}
