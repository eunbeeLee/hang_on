package kr.co.hangOn.repository.domain;

public class Page {
	public static void main(String[] args) {
		Page p = new Page();
		p.setPageNo(3);
		System.out.println(p.getBegin());
		System.out.println(p.getEnd());
	}
	
	
	private int pageNo = 1;

	public int getBegin() {
		return (pageNo -1) * 11 + 1;
	}
	public int getEnd() {
		return pageNo * 11;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
