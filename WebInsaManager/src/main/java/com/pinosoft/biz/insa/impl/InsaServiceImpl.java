package com.pinosoft.biz.insa.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinosoft.biz.insa.InsaService;
import com.pinosoft.biz.insa.InsaVo;

@Service
public class InsaServiceImpl implements InsaService {

	@Autowired
	private InsaDao insaDao;

	// ���
	@Override
	public void insertInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		insaDao.insertInsa(vo);
	}

	// ����
	@Override
	public void deleteInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ����
	@Override
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ��ȸ
	@Override
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// ��� ��ȸ
	@Override
	public List<InsaVo> getInsaLIst(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
