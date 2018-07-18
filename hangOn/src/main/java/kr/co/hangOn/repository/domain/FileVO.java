package kr.co.hangOn.repository.domain;
import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private String path;
	private String id;
	private MultipartFile[] attachFile;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MultipartFile[] getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(MultipartFile[] attachFile) {
		this.attachFile = attachFile;
	}
	
}
