
package com.pinosoft.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pinosoft.biz.insa.InsaService;
import com.pinosoft.biz.insa.InsaVo;
import com.pinosoft.biz.insacom.InsacomService;

@Controller
@RequestMapping("/insa/")
public class InsaController {

	@Autowired
	private InsaService is;
	
	@Autowired 
	private InsacomService ics;
	
	private final String CMP_REG_IMAGE_PATH = "../file/cmp_reg_image/";
	private final String CARRIER_IMAGE_PATH = "../file/carrier_image/";
	private final String PROFILE_IMAGE_PATH = "../file/profile_image/";
	
	
	@RequestMapping(value="index.do")
	public String index() {
		return "index.jsp";
	}
	
	// 등록 화면 이동
	@RequestMapping(value="insaInputForm.do", method=RequestMethod.GET)
	public String insaInputFormView(Model model) {
		
		List<String> gubunList = ics.getGubunList();	// 공통 코드 구분 목록 조회
		
		for(String gubun : gubunList) {					// 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}
		
		model.addAttribute("sabun", is.getMaxSabun());
		return "insaInputForm.jsp";
	}
	
	// 등록 - 메인 화면으로 이동
	@RequestMapping(value="insaInputForm.do", method=RequestMethod.POST)
	public String insaInputForm(InsaVo vo) {
		//vo.setSalary(Integer.parseInt(vo.getSalary_str().replaceAll(",", "")));
		//vo.setReg_no(vo.getReg_no1() + '-' + vo.getReg_no2() + vo.getReg_no3());
		//vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain());
		vo.setProfile_image(vo.getUpload_profile_image().getName());
		vo.setCarrier_image(vo.getUpload_carrier_image().getName());
		vo.setCmp_reg_image(vo.getUpload_cmp_reg_image().getName());
		
		System.out.println(vo);
		//is.insertInsa(vo);
		
		return "../index.jsp";
	}
	
	// 등록 - 화면 이동 없음
	@RequestMapping(value="insaInputAjax.do", method=RequestMethod.POST)
	public void insaInputAjax(InsaVo vo, HttpServletResponse response) {
				
		System.out.println(vo);
		is.insertInsa(vo);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("등록하였습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	// 목록 조회
	@RequestMapping(value="insaListForm.do")
	public String insaListForm() {
		return "insaListForm.jsp";
	}
	
	// 수정 화면 이동  
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
	
	// 아이디 중복 여부 확인
	@RequestMapping(value="checkId.do")
	public void checkId(InsaVo vo, HttpServletResponse response) {
		String id = vo.getId();
		InsaVo insa = is.checkId(vo);
		
		// 아이디 사용 불가
		if(insa != null && insa.getId().equals(id)) {
			id = "";
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.print(id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}