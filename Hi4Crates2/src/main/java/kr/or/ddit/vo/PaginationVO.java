package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class PaginationVO<T> {
	private int totalRecord;		// 총 게시글 수
	private int totalPage;			// 총 페이지 수
	private int currentPage;		// 현재 페이지 (현재 내 페이지 위치(e.g. 4 -> startpage는 1, end는 5))
	private int screenSize = 10;	// 페이지 당 게시글 수 (목록 한 페이지 당 게시물 수)
	private int blockSize = 5;		// 페이지 블록 수 (페이징 블록 범위 (e.g. 5~10페이지씩 표시 등))
	private int startRow;			// 시작 row (목록 한 페이지에 10개라면 1부터 시작 (내 현재 위치에 따라 결정))
	private int endRow;				// 끝 row (목록 한 페이지에 10개라면 10번까지 (내 현재 위치에 따라 결정))
	private int startPage;			// 시작 페이지
	private int endPage;			// 끝 페이지
	private List<T> dataList;		// 결과를 넣을 데이터 리스트
	private String searchType;		// 검색 타입
	private String searchWord;		// 검색 단어
	
	public PaginationVO() {}
	
	public PaginationVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (int)Math.ceil(totalRecord / (double)screenSize);
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation'>"
				+ "<ul class='pagination pagination-mb-0'>");
		
		if(startPage > 1) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='"
					+ (startPage - blockSize) + "'>"
					+ "<span aria-hidden='true'><i class='bx bx-chevron-left'></i></span>"
					+ "</a></li>");
		}
		
		for(int i = startPage; i <= (endPage < totalPage ? endPage : totalPage); i++) {
			
			if(i == currentPage) {
				html.append("<li class='page-item active'><span class='page-link'>"
						+ i + "</span></li>");
			}else {
				html.append("<li class='page-item'><a href='' class='page-link' data-page='"
						+ i + "'>" + i + "</a></li>");
			}
		}
		
		if(endPage < totalPage) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='"
					+ (endPage + 1) + "'>"
					+ "<span aria-hidden='true'><i class='bx bx-chevron-right'></i></span>"
					+ "</a></li>");
		}
		html.append("</ul></nav>");
		return html.toString();
	}
}
