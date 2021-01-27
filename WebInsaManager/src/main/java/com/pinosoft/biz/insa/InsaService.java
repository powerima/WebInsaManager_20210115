package com.pinosoft.biz.insa;

import java.util.List;

public interface InsaService {
	public int getMaxSabun();			// ��� �ִ� �� ��ȸ
	public void insertInsa(InsaVo vo);		// ���
	public void deleteInsa(InsaVo vo);		// ����
	public void updateInsa(InsaVo vo);		// ����
	public InsaVo getInsa(InsaVo vo);		// ������� ��ȸ
	public InsaVo checkId(InsaVo vo);			// ���̵� �ߺ� ��ȸ
	public List<InsaVo> getInsaList(InsaVo vo);	// ��� ��ȸ
	
}
