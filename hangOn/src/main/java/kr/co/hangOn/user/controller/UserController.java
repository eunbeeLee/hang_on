package kr.co.hangOn.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.user.service.UserService;

@Controller
@RequestMapping("/main")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String main() {
		return "main/login";
	}
	
	@RequestMapping("/loginPost.json")
	@ResponseBody
	public String login(User user, HttpSession session) throws Exception {
		User loginUser = userService.login(user.getUserEmail());
		String msg = "";
		
		if (loginUser == null) {
			msg = "이메일이 잘못됐습니다";
		} else if (!loginUser.getUserPw().equals(user.getUserPw())) {
			msg = "비밀번호가 잘못됐습니다";
		} else {
			session.setAttribute("user", loginUser);
			return "/main/login.do";
		}
		return msg;
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "main/register";
	}
	
	@RequestMapping("/forgotPassword.do")
	public String forgotPassword() {
		return "main/forgotPassword";
	}
	
	@RequestMapping("/customerService.do")
	public String customerService() {
		return "main/customerService";
	}
}
