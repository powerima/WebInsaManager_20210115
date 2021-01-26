package com.pinosoft.biz.insa.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pinosoft.biz.insa.InsaVo;

@Repository
public class InsaDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 최대 사번 값 얻어오기
	public int getMaxSabun() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 등록
	public void insertInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("InsaDao.insertInsa", vo);
	}

	// 삭제
	public void deleteInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// 수정
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// 아이디 중복 체크를 위한 아이디 검색
	public InsaVo getId(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 조회
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 목록 조회
	public List<InsaVo> getInsaLIst(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
