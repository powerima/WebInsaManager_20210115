package com.pinosoft.biz.insa;

import java.util.List;

public interface InsaService {
	public int getMaxSabun();			// 사번 최대 값 조회
	public void insertInsa(InsaVo vo);		// 등록
	public void deleteInsa(InsaVo vo);		// 삭제
	public void updateInsa(InsaVo vo);		// 수정
	public InsaVo getInsa(InsaVo vo);		// 사번으로 조회
	public InsaVo checkId(InsaVo vo);			// 아이디 중복 조회
	public List<InsaVo> getInsaList(InsaVo vo);	// 목록 조회
	
}
