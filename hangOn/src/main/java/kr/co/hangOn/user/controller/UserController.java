package kr.co.hangOn.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.user.service.UserService;

@Controller
@RequestMapping("/main")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do") // 메인페이지
	public String main() {
		return "main/login";
	}
	
	@RequestMapping("/filter.do")
	public String filter(String msg, HttpSession session, RedirectAttributes attr) {
		String filter = (String) session.getAttribute("filter");
		if(filter != "") {
			session.removeAttribute("filter");
			attr.addFlashAttribute("msg", "filter");
		}
		return "redirect:login.do";
	}
	
	@RequestMapping("/loginPost.json") // 로그인
	@ResponseBody
	public String login(User user, HttpSession session) throws Exception {
		User loginUser = userService.login(user.getUserEmail());
		String msg = "2"; // 비번 틀림
		if (loginUser == null) {
			msg = "1"; // 없는 이메일 입력시
		}	
		// parameter로 받은 평문과 DB에 저장된 암호화값 비교
		else if (BCrypt.checkpw(user.getUserPw(), loginUser.getUserPw())) {
                session.setAttribute("user", loginUser);
                session.setAttribute("userEmail", loginUser.getUserEmail());
                session.setAttribute("userName", loginUser.getUserName());
                session.setAttribute("userNo", loginUser.getUserNo());
                session.removeAttribute("msg");
                userService.stateCodeChanger(loginUser);
                return "/lobby/view.do";
        }
		return msg;
	}
		
	@RequestMapping("/emailCheck.json") // 회원가입시 이메일 사용 가능한지..
	@ResponseBody
	public int emailCheck(HttpServletRequest request) throws Exception {
		String userEmail = request.getParameter("userEmail");
		int no = userService.emailCheck(userEmail);
		if (userEmail == "") {
			no = 2;
		}
		return no;
	}
	
	@RequestMapping(value = "/registerForm.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String registerForm(User user) {
		return "main/register";
	}
	
	@RequestMapping(value = "/register.do", method= {RequestMethod.POST})
	public String register(User user, RedirectAttributes attr) throws Exception {
		
		// DB 저장 전 Bcrypt를 이용한 비밀번호의 암호화
		String hashPassword = BCrypt.hashpw(user.getUserPw(), BCrypt.gensalt());
	    user.setUserPw(hashPassword);
		
		userService.register(user);
		attr.addFlashAttribute("msg", "congratulations");
		return "redirect:login.do";
	}
	
	@RequestMapping("/googleLogin.json") // 구글로 로그인했을때 db에 이메일이 있나 확인
	@ResponseBody
	public int googleLogin(User user, RedirectAttributes attr) throws Exception {
		String userEmail = user.getUserEmail();
		System.out.println(userEmail);
		int no = userService.emailCheck(userEmail);
		return no;
	}
	
	@RequestMapping("/googleRegister.json") // 이메일이 없을때 회원가입시킨다
	@ResponseBody
	public void googleRegister(User user, RedirectAttributes attr) throws Exception {
		// DB 저장 전 Bcrypt를 이용한 비밀번호의 암호화
		String hashPassword = BCrypt.hashpw(user.getUserPw(), BCrypt.gensalt());
	    user.setUserPw(hashPassword);
		userService.register(user);
	}
	
	@RequestMapping("/forgotPassword.do")
	public String forgotPassword() {
		return "main/forgotPassword";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		if (session.getAttribute("userEmail") == "") {
			return "main/login.do";
		}
		else {
			User loginUser = (User) session.getAttribute("user");
			System.out.println(loginUser.getUserName());
			loginUser.setUserStateCode("aa02");  // 현재 로그인 상태일 경우
			userService.stateCodeChanger(loginUser);
			System.out.println(loginUser.getUserEmail());
			session.invalidate();
		}
		return "redirect:login.do";
	}
	
	@RequestMapping("/leave.do")
	public String leave(String userEmail) {
		userService.leaveUser(userEmail);
		return "main/login.do";
	}
}
