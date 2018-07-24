package kr.co.hangOn.cloud.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.hangOn.cloud.service.CloudService;
import kr.co.hangOn.repository.domain.Cloud;
import kr.co.hangOn.repository.domain.FileVO;

@RestController
@RequestMapping("/room")
public class CloudController {
	
	@Autowired
	private CloudService service;
	
	
	@RequestMapping(value = "/{roomNo}/cloudDown.do", method = RequestMethod.GET)
    public void fileDown(Cloud cloud, HttpServletResponse response, HttpServletRequest req,Model model)throws Exception{
		service.fileDown(cloud, response, req, model);
	}

	
	@RequestMapping(value="/{roomNo}/cloudList.json")
	public Map<String,Object> cloudList(FileVO fileVO,HttpServletRequest req) throws Exception {
		return service.cloudList(fileVO, req);
	}
	
	@RequestMapping(value="/{roomNo}/cloudDelt.json")
	public Map<String,Object> cloudDelt(String filePath,String curPath,HttpServletRequest req) throws Exception {
		return service.cloudDelt(filePath, curPath, req);
	}
	
	@RequestMapping(value="/{roomNo}/newFolder.json")
	public Map<String,Object> newFolder(Cloud cloud,HttpServletRequest req) throws Exception {
		return service.newFolder(cloud, req);
	}
	@RequestMapping(value="/{roomNo}/upload.json")
	public Map<String,Object> fileUpload(FileVO fileVO,HttpServletRequest req,HttpSession session) throws Exception {
		return service.fileUpload(fileVO, req, session);
	}
	
		
	
}