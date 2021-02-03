package com.pinosoft.biz.insa.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pinosoft.biz.insa.InsaVo;
import com.pinosoft.biz.insa.TestVo;

@Repository
public class InsaDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 사번 최대값 조회
	public int getMaxSabun() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.getMaxSabun");
	}
	
	// 등록
	public void insertInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("InsaDao.insertInsa", vo);
	}

	// 삭제
	public void deleteInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("InsaDao.deleteInsa", vo);
	}

	// 수정
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		mybatis.update("InsaDao.updateInsa", vo);
	}

	// 아이디 중복 조회
	public InsaVo checkId(InsaVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.checkId", vo);
	}
	
	// 사번으로 조회
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.getInsa", vo);
	}

	// 목록 레코드 수 조회
	public int getInsaListCnt(InsaVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.getInsaListCnt", vo);
	}
	
	// 목록 조회
	public List<InsaVo> getInsaList(InsaVo vo) {
		// TODO Auto-generated method stub		
		return mybatis.selectList("InsaDao.getInsaList", vo);
	}
	
	
	
	public void insertTest(String id) {
		mybatis.insert("InsaDao.insertTest", id);
	}
	
	// 테스트를 위한 대량의 데이터 등록
	public void insertBigTestData(InsaVo vo) {
		mybatis.insert("InsaDao.insertBigTestData", vo);
	}
	
	// 테스트 목록 조회
	public List<TestVo> getTestList(TestVo vo) {
		return mybatis.selectList("InsaDao.getTestList", vo);
	}
	
	// 테스트 등록
	public void insertTest(TestVo vo) {
		mybatis.insert("InsaDao.insertTest", vo);
	}
			
}