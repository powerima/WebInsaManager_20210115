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

	// 최대 사번 값 얻어오기
	@Override
	public int getMaxSabun() {
		// TODO Auto-generated method stub
		return 0;
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
		
	}

	// 수정
	@Override
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// 아이디 중복 체크를 위한 아이디 검색
	@Override
	public InsaVo getId(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 조회	
	@Override
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 목록 조회
	@Override
	public List<InsaVo> getInsaLIst(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}


}
