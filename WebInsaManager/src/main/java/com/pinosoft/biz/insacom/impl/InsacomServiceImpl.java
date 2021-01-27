package com.pinosoft.biz.insacom.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinosoft.biz.insacom.InsacomService;
import com.pinosoft.biz.insacom.InsacomVo;

@Service
public class InsacomServiceImpl implements InsacomService {

	@Autowired
	private InsacomDao insacomDao;
	
	// ���
	@Override
	public void insertInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		insacomDao.insertInsacom(vo);
	}

	// ����
	@Override
	public void updateInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ����
	@Override
	public void deleteInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		insacomDao.deleteInsacom(vo);
	}

	// ��ȸ
	@Override
	public InsacomVo getInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// ��� ��ȸ
	@Override
	public List<InsacomVo> getInsacomList(InsacomVo vo) {
		// TODO Auto-generated method stub
		return insacomDao.getInsacomList(vo);
	}

	// ���и����� ��� ��ȸ
	@Override
	public List<InsacomVo> getGubunTypeList(String gubun) {
		return insacomDao.getGubunTypeList(gubun);
	}
	
	// ���� ��� ��ȸ
	@Override
	public List<String> getGubunList() {
		// TODO Auto-generated method stub
		return insacomDao.getGubunList();
	}
	
}
