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

	// 사번 최대값 조회
	@Override
	public int getMaxSabun() {
		// TODO Auto-generated method stub
		return insaDao.getMaxSabun();
	}
	
	// 등록
	@Override
	public void insertInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		insaDao.insertInsa(vo);
	}

	// 삭제
	@Override
	public void deleteInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		insaDao.deleteInsa(vo);
	}

	// 수정
	@Override
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		insaDao.updateInsa(vo);
	}

	// 아이디 중복 여부 확인
	@Override
	public InsaVo checkId(InsaVo vo) {
		// TODO Auto-generated method stub
		return insaDao.checkId(vo);
	}
	
	// 사번으로 조회
	@Override
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return insaDao.getInsa(vo);
	}

	// 목록 조회
	@Override
	public List<InsaVo> getInsaList(InsaVo vo) {
		// TODO Auto-generated method stub
		return insaDao.getInsaList(vo);
	}

	// 목록 레코드 수 조회
	@Override
	public int getInsaListCnt(InsaVo vo) {
		// TODO Auto-generated method stub
		return insaDao.getInsaListCnt(vo);
	}


}
