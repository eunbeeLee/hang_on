package kr.co.hangOn.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			session.setAttribute("userEmail", loginUser.getUserEmail());
			userService.stateCodeChanger(loginUser.getUserEmail());
			return "/main/login.do";
		}
		return msg;
	}
	
	@RequestMapping("/emailCheck.json")
	@ResponseBody
	public int emailCheck(HttpServletRequest request) throws Exception {
		String userEmail = request.getParameter("userEmail");
		int no = userService.emailCheck(userEmail);
		return no;
	}
	
	@RequestMapping(value = "/registerForm.do")
	public String registerForm(User user) {
		return "main/register";
	}
	
	@RequestMapping(value = "/register.do", method= {RequestMethod.POST})
	public String register(User user, RedirectAttributes attr) {
		userService.register(user);
		attr.addFlashAttribute("msg", "가입을 축하합니다.");
		return "redirect:login.do";
	}
	
	@RequestMapping("/forgotPassword.do")
	public String forgotPassword() {
		return "main/forgotPassword";
	}
	
	@RequestMapping("/customerService.do")
	public String customerService() {
		return "main/customerService";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}
}
