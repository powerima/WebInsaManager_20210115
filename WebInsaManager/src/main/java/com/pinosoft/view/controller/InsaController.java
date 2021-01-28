
package com.pinosoft.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pinosoft.biz.FileUpload;
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
	
	private final String CMP_REG_IMAGE_PATH = "/file/cmp_reg_img/";
	private final String CARRIER_IMAGE_PATH = "/file/carrier_img/";
	private final String PROFILE_IMAGE_PATH = "/file/profile_img/";
	
	
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
	public String insaInputForm(InsaVo vo, HttpServletRequest request) throws IllegalStateException, IOException {

		// 주민등록 번호 설정
		vo.setReg_no(vo.getReg_no1() + '-' + vo.getReg_no2() + vo.getReg_no3());

		// 이력서 이미지 설정 및 파일 업로드
		if(vo.getUpload_carrier_image() != null) {
			vo.setCarrier_image(FileUpload.uploadNewFile
					(request, CARRIER_IMAGE_PATH, vo.getUpload_carrier_image()));
		} else {
			vo.setCarrier_image("");
		}
		
		
		
		// 사업자 등록증 이미지 설정 및 파일 업로드
		if(vo.getUpload_cmp_reg_image() != null) {
			vo.setCmp_reg_image(FileUpload.uploadNewFile
					(request, CMP_REG_IMAGE_PATH, vo.getUpload_cmp_reg_image()));
		} else {
			vo.setCmp_reg_image("");
		}
	
		
		// 프로필 이미지 설정 및 파일 업로드
		if(vo.getUpload_profile_image() != null) {
			vo.setProfile_image(FileUpload.uploadNewFile
					(request, PROFILE_IMAGE_PATH, vo.getUpload_profile_image()));
		} else {
			vo.setProfile_image("");
		}		
	
		
		// 이메일 설정
		if(vo.getEmail_id() != null) {
			if(vo.getEmail_domain1() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain1());
			} else if(vo.getEmail_domain2() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain2());
			}
		}
		

		// 연봉 금액 설정
		if(vo.getSalary_str() != null && !vo.getSalary_str().equals("")) {
			vo.setSalary(Integer.parseInt(vo.getSalary_str().replaceAll(",", "")));
		}		

		
		System.out.println(vo);
		is.insertInsa(vo);
		
		return "../index.jsp";
	}
	
	// 등록 - 화면 이동 없음
	@RequestMapping(value="insaInputAjax.do", method=RequestMethod.POST)
	public void insaInputAjax(InsaVo vo, HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		System.out.println("!!!");		
		System.out.println(vo);
		
		// 주민등록 번호 설정
		vo.setReg_no(vo.getReg_no1() + '-' + vo.getReg_no2() + vo.getReg_no3());

		// 이력서 이미지 설정 및 파일 업로드
		if(vo.getUpload_carrier_image() != null) {
			vo.setCarrier_image(FileUpload.uploadNewFile
					(request, CARRIER_IMAGE_PATH, vo.getUpload_carrier_image()));
		} else {
			vo.setCarrier_image("");
		}
		
		
		
		// 사업자 등록증 이미지 설정 및 파일 업로드
		if(vo.getUpload_cmp_reg_image() != null) {
			vo.setCmp_reg_image(FileUpload.uploadNewFile
					(request, CMP_REG_IMAGE_PATH, vo.getUpload_cmp_reg_image()));
		} else {
			vo.setCmp_reg_image("");
		}
	
		
		// 프로필 이미지 설정 및 파일 업로드
		if(vo.getUpload_profile_image() != null) {
			vo.setProfile_image(FileUpload.uploadNewFile
					(request, PROFILE_IMAGE_PATH, vo.getUpload_profile_image()));
		} else {
			vo.setProfile_image("");
		}		
	
		
		// 이메일 설정
		if(vo.getEmail_id() != null) {
			if(vo.getEmail_domain1() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain1());
			} else if(vo.getEmail_domain2() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain2());
			}
		}
		

		// 연봉 금액 설정
		if(vo.getSalary_str() != null && !vo.getSalary_str().equals("")) {
			vo.setSalary(Integer.parseInt(vo.getSalary_str().replaceAll(",", "")));
		}		
		
		System.out.println(vo);
		is.insertInsa(vo);
		
		response.getWriter().print("등록하였습니다.");
		
	}	
	
	
	// 목록 조회 화면 이동
	@RequestMapping(value="insaListForm.do", method=RequestMethod.GET)
	public String insaListFormView(Model model) {
		List<String> gubunList = ics.getGubunList();	// 공통 코드 구분 목록 조회
		
		for(String gubun : gubunList) {					// 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}
		
		return "insaListForm.jsp";
	}
	
	
	// 목록 조회
	@RequestMapping(value="insaListFormAjax.do", method=RequestMethod.GET)
	public String insaListFormAjax(InsaVo vo, Model model) {
		System.out.println(vo);
		
		model.addAttribute("recordCnt", 0);
		
		return "getInsaList.jsp";
	}
	
	// 수정 화면 이동  
	@RequestMapping(value="insaUpdateForm.do", method=RequestMethod.GET)
	public String insaUpdateFormView(Model model) {
		List<String> gubunList = ics.getGubunList();	// 공통 코드 구분 목록 조회
		
		for(String gubun : gubunList) {					// 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}
		
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