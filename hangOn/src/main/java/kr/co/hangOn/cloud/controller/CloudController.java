package kr.co.hangOn.cloud.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hangOn.repository.domain.Cloud;
import kr.co.hangOn.repository.domain.FileVO;

@RestController
@RequestMapping("/room")
public class CloudController {

	@Autowired
	ServletContext servletContext;
	 
	private static final String PATH= "c:/java-lec/upload/" ;
	private static final String DELETE= "c:/java-lec/upload/delete/" ;
	private static final String[] SI_UNITS = { "B", "kB", "MB", "GB", "TB", "PB", "EB" };
	private static final String[] BINARY_UNITS = { "B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB" };
	
	@RequestMapping(value = "/{roomNo}/cloudDown.do", method = RequestMethod.GET)
    public void fileDown(Cloud cloud, HttpServletResponse response, HttpServletRequest req,Model model)throws Exception{
		
		String dName = cloud.getFileName();
		String path = PATH+req.getRequestURI().split("/")[3]+"/";
		if(!cloud.getFilePath().equals("")) {
			path+=cloud.getFilePath()+"/";
		}
		File f = new File(path +dName);
		if(dName == null){
			response.setHeader("content-Type", "image/jpg");
		}
		else{
			response.setHeader("content-Type", "application/octet-stream");
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			response.setHeader("content-Disposition", "attachment;filename="+dName);
		}
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while(true){
			int ch = bis.read();
			if (ch == -1) break;
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}


	
	@RequestMapping(value="/{roomNo}/cloudList.json")
	public Map<String,Object> cloudList(FileVO fileVO,HttpServletRequest req) throws Exception {
		Map<String, Object>result=new HashMap<>();
		
		String roomNo =req.getRequestURI().split("/")[3]+"/";
		// 파일정보 가져오기
		String path=PATH+roomNo;
		if(fileVO.getPath()!=null) {
			path+=fileVO.getPath();
		}
		File targetDir = new File(path);  
		if(!targetDir.exists()) {    //디렉토리 없으면 생성.
			targetDir.mkdirs();
		}
		result.put("list", cloudList(path));
		
		return result;
	}
	
	@RequestMapping(value="/{roomNo}/cloudDelt.json")
	public Map<String,Object> cloudDelt(String filePath,String curPath,HttpServletRequest req) throws Exception {
		Map<String, Object>result=new HashMap<>();
		String roomNo =req.getRequestURI().split("/")[3]+"/";
		String path=PATH+roomNo;
		String delPath=DELETE+roomNo;
		String dirPath=path;
		if(filePath!=null) {
			path+=filePath;
			delPath+=filePath;
		}
		if(curPath!=null) {
			dirPath+=curPath;
		}
		File targetDir = new File(delPath);  
		if(!targetDir.exists()) {    //디렉토리 없으면 생성.
			targetDir.mkdirs();
		}
		Path file = Paths.get(path);
		Path movePath = Paths.get(delPath);
		Files.move(file , movePath .resolve(file .getFileName()));
		
		result.put("result", "성공");
		
		result.put("list", cloudList(dirPath));
		
		return result;
	}
	@RequestMapping(value="/{roomNo}/newFolder.json")
	public Map<String,Object> newFolder(Cloud cloud,HttpServletRequest req) throws Exception {
		Map<String, Object>result=new HashMap<>();
		
		String roomNo =req.getRequestURI().split("/")[3]+"/";
		// 파일정보 가져오기
		String path=PATH+roomNo+cloud.getFilePath();
		
		File targetDir = new File(path+"/"+cloud.getFileName());  
		if(!targetDir.exists()) {    //디렉토리 없으면 생성.
			targetDir.mkdirs();
		}
		result.put("result", "성공");
		
		result.put("list", cloudList(path));
		
		return result;
	}
	@RequestMapping(value="/{roomNo}/upload.json")
	public Map<String,Object> fileUpload(FileVO fileVO,HttpServletRequest req) throws Exception {
		Map<String, Object>result=new HashMap<>();
		
		String roomNo =req.getRequestURI().split("/")[3]+"/";
		// 파일정보 가져오기
		String path=PATH+roomNo+fileVO.getPath();
		
		File targetDir = new File(path);  
        if(!targetDir.exists()) {    //디렉토리 없으면 생성.
        	targetDir.mkdirs();
        }
		for (MultipartFile file : fileVO.getAttachFile()) {
			file.transferTo(new File(path +"\\"+ file.getOriginalFilename()));
		}
		result.put("result", "성공");
		
		result.put("list", cloudList(path));
		
		return result;
	}
	
	private ArrayList<Cloud> cloudList(String path) throws Exception {
		ArrayList<Cloud> cloudArr = new ArrayList<>();
		
		File dirFile=new File(path);
		File []fileList=dirFile.listFiles();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		Cloud cl = null;
		
		for(File tempFile : fileList) {
			cl = new Cloud();
		  if(tempFile.isFile()) {
		    String tempPath=tempFile.getParent().replaceAll(PATH, "");
		    String tempFileName=tempFile.getName();
		    int Idx = tempFileName.lastIndexOf(".");
		    String extension = tempFileName.substring( Idx +1 );
			String disp=humanReadableByteCount(tempFile.length(), true, null);
			cl.setFilePath(tempPath).setFileName(tempFileName).setExtension(extension)
			.setUpdtDate(sdf.format(new Date(tempFile.lastModified()))).setFileSize(disp);
		  }else {
			  String tempPath=tempFile.getParent().replaceAll(PATH, "");
			  String tempFileName=tempFile.getName();
			  String disp=humanReadableByteCount(FileUtils.sizeOfDirectory(tempFile), true, null);
			  cl.setFilePath(tempPath).setFileName(tempFileName)
			  .setUpdtDate(sdf.format(new Date(tempFile.lastModified()))).setFileSize(disp);
		  }
		  cloudArr.add(cl);
		}
		cl= new Cloud();
		
		String tempPath=dirFile.getParent().replaceAll(PATH, "");
		String tempFileName=dirFile.getName();
		String disp=humanReadableByteCount(FileUtils.sizeOfDirectory(dirFile), true, null);
		cl.setFilePath(tempPath+"\\"+tempFileName).setFileName(tempFileName)
		.setUpdtDate(sdf.format(new Date(dirFile.lastModified()))).setFileSize(disp);
		
		cloudArr.add(cl);
		return cloudArr;
	}
	public static String humanReadableByteCount(final long bytes, final boolean useSIUnits, final Locale locale)
	{
	    final String[] units = useSIUnits ? SI_UNITS : BINARY_UNITS;
	    final int base = useSIUnits ? 1000 : 1024;

	    // When using the smallest unit no decimal point is needed, because it's the exact number.
	    if (bytes < base) {
	        return bytes + units[0];
	    }

	    final int exponent = (int) (Math.log(bytes) / Math.log(base));
	    final String unit = units[exponent];
	    return String.format(locale, "%.1f%s", bytes / Math.pow(base, exponent), unit);
	}
	
	
	
}