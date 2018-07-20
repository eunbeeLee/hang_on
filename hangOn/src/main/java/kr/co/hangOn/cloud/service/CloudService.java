package kr.co.hangOn.cloud.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import kr.co.hangOn.repository.domain.Cloud;
import kr.co.hangOn.repository.domain.FileVO;

public interface CloudService {
	
	public void fileDown(Cloud cloud, HttpServletResponse response, HttpServletRequest req,Model model) throws Exception;
	
	public Map<String,Object> cloudList(FileVO fileVO,HttpServletRequest req) throws Exception;
	
	public Map<String,Object> cloudDelt(String filePath,String curPath,HttpServletRequest req) throws Exception;
	
	public Map<String,Object> newFolder(Cloud cloud,HttpServletRequest req) throws Exception;
	
	public Map<String,Object> fileUpload(FileVO fileVO,HttpServletRequest req) throws Exception;
	
	
}
