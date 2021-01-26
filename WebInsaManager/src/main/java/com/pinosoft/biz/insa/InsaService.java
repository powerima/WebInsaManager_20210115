package com.pinosoft.biz.insa;

import java.util.List;

public interface InsaService {
	public int getMaxSabun();			// 새로운 사번 값 얻어오기	
	public void insertInsa(InsaVo vo);		// 등록
	public void deleteInsa(InsaVo vo);		// 삭제
	public void updateInsa(InsaVo vo);		// 수정
	public InsaVo getInsa(InsaVo vo);		// 조회
	public InsaVo getId(InsaVo vo);		// 아이디 중복여부 체크
	public List<InsaVo> getInsaLIst(InsaVo vo);	// 목록 조회
	
}
