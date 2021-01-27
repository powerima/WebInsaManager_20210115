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
	
	// ���
	public void insertInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("InsacomDao.insertInsacom", vo);
	}

	// ����
	public void updateInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		
	}

	// ����
	public void deleteInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		mybatis.delete("InsacomDao.deleteInsacom", vo);
	}

	// ��ȸ
	public InsacomVo getInsacom(InsacomVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// ��� ��ȸ
	public List<InsacomVo> getInsacomList(InsacomVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("InsacomDao.getInsacomList", vo);
	}

	// ���и����� ��� ��ȸ
	public List<InsacomVo> getGubunTypeList(String gubun) {
		return mybatis.selectList("InsacomDao.getGubunTypeList", gubun);
	}
	
	// ���� ��� ��ȸ
	public List<String> getGubunList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("InsacomDao.getGubunList");
	}
	
}
