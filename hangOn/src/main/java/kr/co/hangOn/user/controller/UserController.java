package kr.co.hangOn.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.user.service.UserService;

@Controller
@RequestMapping("/main")
@SessionAttributes({"UserName", "UserEmail"})
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("/loginPost.json")
	@ResponseBody
	public String login(User user, Model model) throws Exception {
		System.out.println("들어오나요");
		User loginUser = userService.login(user.getUserEmail());
		
		System.out.println(user.getUserEmail());
		String msg = "";
		
		if (loginUser == null) {
			msg = "이메일이 잘못됐습니다";
		} else if (!loginUser.getUserPw().equals(user.getUserPw())) {
			msg = "비밀번호가 잘못됐습니다";
		} else {
			model.addAttribute("UserEmail", loginUser.getUserEmail());
			model.addAttribute("UserName", loginUser.getUserName());
			return "/main/main.do";
		}
		return msg;
	}
	
	@RequestMapping("/register.do")
	public String register() {
		return "register/register";
	}
	
	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword/forgotPassword";
	}

	
}
