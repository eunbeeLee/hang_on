package kr.co.hangOn.alter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.hangOn.alter.service.AlterService;
import kr.co.hangOn.repository.domain.User;

@Controller
@RequestMapping("/alter")
public class AlterController {
	
	@Autowired
	private AlterService alterService;
	
	@RequestMapping("/updateInfo.json")
	@ResponseBody
	public void updateInfo(User user, HttpSession session) throws Exception {
		alterService.updateInfo(user);
		User updateUser = (User) session.getAttribute("user");
		if(user.getUserName() != null) updateUser.setUserName(user.getUserName());
		if(user.getUserPw() != null) updateUser.setUserPw(user.getUserPw());
		if(user.getUserProfilePath() != null) updateUser.setUserProfilePath(user.getUserProfilePath());
		session.setAttribute("user",updateUser);
	}
	
	@RequestMapping(value="/profile.json", method=RequestMethod.POST)  
	@ResponseBody
	public void updateProfile(User user,HttpServletRequest request, HttpSession session) throws Exception{
		User updateUser = (User) session.getAttribute("user");
		updateUser.setUserProfilePath(alterService.updateProfile(user, request));
		session.setAttribute("user",updateUser);
	}
	
	@RequestMapping(value="/retrievePass.json", method=RequestMethod.POST)  
	@ResponseBody
	public String retrievePass(User user) throws Exception{
		if(alterService.retrievePassword(user)) return "success";
		else return "err";
	}

	@RequestMapping("/exist.do")
	public String exist(int userNo, HttpSession session) throws Exception {
		User user = new User();
		user.setUserNo(userNo);
		user.setUserExistCode("aa12");
		alterService.updateInfo(user);
		session.removeAttribute("user");
		session.removeAttribute("userEmail");
		return "redirect:/main/login.do";
	}
	
}
