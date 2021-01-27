package com.pinosoft.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pinosoft.biz.insacom.InsacomService;
import com.pinosoft.biz.insacom.InsacomVo;

@Controller
@RequestMapping("/insacom/")
public class InsacomController {

	@Autowired
	private InsacomService ics;
	
	// ��� ȭ������ �̵�
	@RequestMapping(value="/insertInsacom.do", method=RequestMethod.GET)
	public String insertInsacomView() {		
		return "insertInsacom.jsp";
	}
	
	
	// ���
	@RequestMapping(value="/insertInsacom.do", method=RequestMethod.POST)
	public String insertInsacom(InsacomVo vo) {
		ics.insertInsacom(vo);
		return "insertInsacom.jsp";
	}
	
	
	// ����
	@RequestMapping(value="/deleteInsacom.do")
	public String deleteInsacom(InsacomVo vo) {
		ics.deleteInsacom(vo);
		return "getInsacomList.do";
	}
	
	
	// ��� ��ȸ
	@RequestMapping(value="/getInsacomList.do")
	public String getInsacomList(InsacomVo vo, Model model) {
		model.addAttribute("insacomList", ics.getInsacomList(vo));
		return "getInsacomList.jsp";
	}
}
