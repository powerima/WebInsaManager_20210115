
package com.pinosoft.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pinosoft.biz.insa.InsaService;
import com.pinosoft.biz.insa.InsaVo;

@Controller
public class InsaController {

	@Autowired
	private InsaService is;
	
	@RequestMapping(value="index.do")
	public String index() {
		return "index.jsp";
	}
	
	// 등록 화면 이동
	@RequestMapping(value="insaInputForm.do", method=RequestMethod.GET)
	public String insaInputFormView() {
		return "insaInputForm.jsp";
	}
	
	// 등록
	@RequestMapping(value="insaInputForm.do", method=RequestMethod.POST)
	public String insaInputForm(InsaVo vo) {
		System.out.println(vo);
		is.insertInsa(vo);
		return "index.jsp";
	}
	
	// 목록 조회 폼
	@RequestMapping(value="insaListForm.do")
	public String insaListForm() {
		return "insaListForm.jsp";
	}
	
	// 직원 수정 화면 이동 
	@RequestMapping(value="insaUpdateForm.do", method=RequestMethod.GET)
	public String insaUpdateFormView() {
		return "insaUpdateForm.jsp";
	}
	
	// 수정
	@RequestMapping(value="insaUpdateForm.do", method=RequestMethod.POST)
	public String insaUpdateForm() {
		return "insaUpdateForm.jsp";
	}
	
	// 삭제
	@RequestMapping(value="insaDelete.do")
	public String insaDelete() {
		return "redirect:insaListForm.do";
	}
	
}
