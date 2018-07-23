package kr.co.hangOn.alter.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.repository.mapper.AlterMapper;

@Service("alterService")
public class AlterServiceImpl implements AlterService{

	@Autowired
	private AlterMapper mapper;

	@Override
	public void updateInfo(User user) {
		mapper.updateUserInfo(user);
	}

	@Override
	public String updateProfile(User user, HttpServletRequest request) throws Exception {
		ServletContext context = request.getServletContext();                    
		MultipartFile file = user.getFile();
		String oriName = file.getOriginalFilename();	                  
		String ext = "";                                                  
		int index = oriName.lastIndexOf(".");                               
		if (index != -1) { ext = oriName.substring(index); }               
		String systemName = UUID.randomUUID().toString() + ext;				
		
		String saveFolder = "/resources/userProfileImg/"+systemName;
		String realFolder = context.getRealPath(saveFolder);
		File fileFolder = new File(realFolder);
		if(!fileFolder.exists()) { fileFolder.mkdirs(); }
		file.transferTo(new File(realFolder));
		user.setUserProfilePath(saveFolder);
		mapper.updateUserInfo(user);
		return saveFolder;
	}
	

}
