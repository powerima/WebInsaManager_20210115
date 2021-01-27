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
	
	// ��� �ִ밪 ��ȸ
	public int getMaxSabun() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.getMaxSabun");
	}
	
	// ���
	public void insertInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("InsaDao.insertInsa", vo);
	}

	// ����
	public void deleteInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ����
	public void updateInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ���̵� �ߺ� ��ȸ
	public InsaVo checkId(InsaVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("InsaDao.checkId", vo);
	}
	
	// ������� ��ȸ
	public InsaVo getInsa(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// ��� ��ȸ
	public List<InsaVo> getInsaLIst(InsaVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
