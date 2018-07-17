package kr.co.hangOn.cloud.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hangOn.repository.domain.FileVO;
import kr.co.hangOn.repository.domain.RoomMember;

@RestController
@RequestMapping("/room")
public class CloudController {

	@Autowired
	ServletContext servletContext;
	 
	final String PATH= "c:/java-lec/upload/" ;
	final static String DELETE= "c:/java-lec/upload/delete/" ;
	
	@RequestMapping(value="/{roomNo}/upload.json")
	public Map<String,String> fileUpload(FileVO fileVO,HttpServletRequest req) throws Exception {
		String roomNo =req.getRequestURI().split("/")[3]+"/";
		System.out.println(roomNo);
		// 파일정보 가져오기
		String path=PATH+roomNo+fileVO.getPath();
		
		System.out.println("path:" + path);
		
		for (MultipartFile file : fileVO.getAttachFile()) {
			System.out.println(file.getOriginalFilename());
			
			file.transferTo(new File(path + file.getOriginalFilename()));
		}
		
		File dirFile=new File(path);
		dirFile.renameTo(new File(DELETE));
//		dirFile.isDirectory()
//		dirFile.listFiles().length == 0
		File []fileList=dirFile.listFiles();
		for(File tempFile : fileList) {
		  if(tempFile.isFile()) {
		    String tempPath=tempFile.getParent();
		    String tempFileName=tempFile.getName();
		    System.out.println("Path="+tempPath);
		    System.out.println("FileName="+tempFileName);
		    /*** Do something withd tempPath and temp FileName ^^; ***/
		  }
		}
		
		Map<String,String>result=new HashMap<>();
		result.put("result", "성공");
		
		return result;
	}
	
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public ModelAndView fileUpload(MultipartHttpServletRequest mRequest) throws Exception {
		
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload");
		System.out.println(uploadDir);

		ModelAndView mav = new ModelAndView("file/uploadResult");

		String id = mRequest.getParameter("id");
		System.out.println("id : " + id);
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			
			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				// 고유한 파일명 만들기	
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
			
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File("c:/java-lec/upload/" + saveFileName));
			} 
		} 
		return mav;
	}
}