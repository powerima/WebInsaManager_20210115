package com.pinosoft.biz.insacom.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pinosoft.biz.insacom.InsacomVo;

@Repository
public class InsacomDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 등록
	public void insertInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("InsacomDao.insertInsacom", vo);
	}

	// 수정
	public void updateInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		
	}

	// 삭제
	public void deleteInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("InsacomDao.deleteInsacom", vo);
	}

	// 조회
	public InsacomVo getInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 목록 조회
	public List<InsacomVo> getInsacomList(InsacomVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("InsacomDao.getInsacomList", vo);
	}

	// 구분명으로 목록 조회
	public List<InsacomVo> getGubunTypeList(String gubun) {
		return mybatis.selectList("InsacomDao.getGubunTypeList", gubun);
	}
	
	// 구분 목록 조회
	public List<String> getGubunList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("InsacomDao.getGubunList");
	}
	
}
