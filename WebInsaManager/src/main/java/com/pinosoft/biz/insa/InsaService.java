package com.pinosoft.biz.insa;

import java.util.List;

public interface InsaService {

	public void insertInsa(InsaVo vo);		// 등록
	public void deleteInsa(InsaVo vo);		// 삭제
	public void updateInsa(InsaVo vo);		// 수정
	public InsaVo getInsa(InsaVo vo);		// 조회
	public List<InsaVo> getInsaLIst(InsaVo vo);	// 목록 조회
	
}
