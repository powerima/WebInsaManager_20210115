package com.pinosoft.biz;

import com.pinosoft.biz.insa.InsaVo;

public class Page {	
	private int currentPage;	// 현재 페이지
	private int startPage;		// 시작 페이지
	private int endPage;		// 마지막 페이지
	private int pageBlock;		// 한번에 보여질 페이지 수
	private int recordBlock;	// 한번에 보여질 레코드 수
	private int pageCnt;		// 전체 페이지 수
	private int recordCnt;		// 전체 레코드 수 
	private int startRow;		// 시작 레코드 행 번호
	private int endRow;			// 마지막 레코드 행 번호
	private InsaVo insa;		// 서치를 위한 객체
	
	private static Page page = new Page();
	
	private Page() {}	
	
	public static Page getInstance(int currentPage, int recordCnt, int recordBlock, int pageBlock) {
		if(currentPage < 1) {
			currentPage = 1;
		}		
		page.setCurrentPage(currentPage);		
		page.setRecordCnt(recordCnt);
		page.setRecordBlock(recordBlock);
		page.setPageBlock(pageBlock);		
		page.setStartRow((currentPage - 1) * recordBlock + 1);
		page.setEndRow(currentPage * recordBlock);
		
		if(recordCnt > 0) {
			page.setPageCnt(recordCnt / recordBlock + (recordCnt % recordBlock == 0 ? 0 : 1));		
			page.setStartPage(1);
			
			if(currentPage % pageBlock != 0) { 
				page.setStartPage((int)(currentPage/pageBlock) * pageBlock + 1);
			} else {
				page.setStartPage((int)(currentPage/pageBlock - 1) * pageBlock + 1);
			}
			
			page.setEndPage(page.getStartPage() + pageBlock - 1);
			
			if(page.getEndPage() > page.getPageCnt()) {
				page.setEndPage(page.getPageCnt());
			}
		}
		return page;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPageBlock() {
		return pageBlock;
	}


	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}


	public int getRecordBlock() {
		return recordBlock;
	}


	public void setRecordBlock(int recordBlock) {
		this.recordBlock = recordBlock;
	}


	public int getPageCnt() {
		return pageCnt;
	}


	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}


	public int getRecordCnt() {
		return recordCnt;
	}


	public void setRecordCnt(int recordCnt) {
		this.recordCnt = recordCnt;
	}


	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	

	public InsaVo getInsa() {
		return insa;
	}

	public void setInsa(InsaVo insa) {
		this.insa = insa;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", startPage=" + startPage + ", endPage=" + endPage + ", pageBlock="
				+ pageBlock + ", recordBlock=" + recordBlock + ", pageCnt=" + pageCnt + ", recordCnt=" + recordCnt
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
}
