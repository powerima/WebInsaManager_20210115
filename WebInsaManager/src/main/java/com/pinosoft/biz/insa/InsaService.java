package com.pinosoft.biz.insa;

import java.util.List;

public interface InsaService {

	public void insertInsa(InsaVo vo);		// ���
	public void deleteInsa(InsaVo vo);		// ����
	public void updateInsa(InsaVo vo);		// ����
	public InsaVo getInsa(InsaVo vo);		// ��ȸ
	public List<InsaVo> getInsaLIst(InsaVo vo);	// ��� ��ȸ
	
}
