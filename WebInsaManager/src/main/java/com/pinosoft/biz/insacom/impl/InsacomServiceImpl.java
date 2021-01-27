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
	
	// 등록
	@Override
	public void insertInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		insacomDao.insertInsacom(vo);
	}

	// 수정
	@Override
	public void updateInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		
	}

	// 삭제
	@Override
	public void deleteInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		insacomDao.deleteInsacom(vo);
	}

	// 조회
	@Override
	public InsacomVo getInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 목록 조회
	@Override
	public List<InsacomVo> getInsacomList(InsacomVo vo) {
		// TODO Auto-generated method stub
		return insacomDao.getInsacomList(vo);
	}

	// 구분명으로 목록 조회
	@Override
	public List<InsacomVo> getGubunTypeList(String gubun) {
		return insacomDao.getGubunTypeList(gubun);
	}
	
	// 구분 목록 조회
	@Override
	public List<String> getGubunList() {
		// TODO Auto-generated method stub
		return insacomDao.getGubunList();
	}
	
}
