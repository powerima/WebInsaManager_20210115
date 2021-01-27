package com.pinosoft.biz.insacom;

import java.util.List;

public interface InsacomService {
	public void insertInsacom(InsacomVo vo);		// ���
	public void updateInsacom(InsacomVo vo);		// ����
	public void deleteInsacom(InsacomVo vo);		// ����
	public InsacomVo getInsacom(InsacomVo vo);		// ��ȸ	
	public List<InsacomVo> getInsacomList(InsacomVo vo);	// ��� ��ȸ
	public List<String> getGubunList();						// ���� ��� ��ȸ
	public List<InsacomVo> getGubunTypeList(String gubun) ;	// ���и����� ��� ��ȸ
}
