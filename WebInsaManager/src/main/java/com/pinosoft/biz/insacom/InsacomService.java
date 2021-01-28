package com.pinosoft.biz.insacom;

import java.util.List;

public interface InsacomService {
	public void insertInsacom(InsacomVo vo);				// 등록
	public void updateInsacom(InsacomVo vo);				// 수정
	public void deleteInsacom(InsacomVo vo);				// 삭제
	public InsacomVo getInsacom(InsacomVo vo);				// 조회	
	public List<InsacomVo> getInsacomList(InsacomVo vo);	// 목록 조회
	public List<String> getGubunList();						// 구분 목록 조회
	public List<InsacomVo> getGubunTypeList(String gubun) ;	// 구분명으로 목록 조회
}
