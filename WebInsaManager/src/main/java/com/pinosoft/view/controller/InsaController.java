
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

import com.pinosoft.biz.CD;
import com.pinosoft.biz.FileUpload;
import com.pinosoft.biz.Page;
import com.pinosoft.biz.insa.InsaService;
import com.pinosoft.biz.insa.InsaVo;
import com.pinosoft.biz.insa.TestVo;
import com.pinosoft.biz.insa.impl.InsaDao;
import com.pinosoft.biz.insacom.InsacomService;
import com.pinosoft.biz.insacom.InsacomVo;

@Controller
@RequestMapping("/insa/")
public class InsaController {

	@Autowired
	private InsaService is;

	@Autowired
	private InsaDao dao;

	@Autowired
	private InsacomService ics;

	private final String CMP_REG_IMAGE_PATH = "/file/cmp_reg_img/";
	private final String CARRIER_IMAGE_PATH = "/file/carrier_img/";
	private final String PROFILE_IMAGE_PATH = "/file/profile_img/";

	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public void test(TestVo vo) {
		System.out.println(vo.getId());
		dao.insertTest(vo);
	}

	@RequestMapping(value = "/getTestList.do", method = RequestMethod.POST)
	public String getTestList(TestVo vo, Model model) {
		System.out.println(vo.getId());
		model.addAttribute("testList", dao.getTestList(vo));

		return "../test.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String index() {
		return "redirect:../index.jsp";
	}

	// 등록 화면으로 이동
	@RequestMapping(value = "/insaInputForm.do", method = RequestMethod.GET)
	public String insaInputFormView(Model model) {

		List<String> gubunList = ics.getGubunList(); // 공통 코드 구분 목록 조회

		for (String gubun : gubunList) { // 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}

		model.addAttribute("sabun", is.getMaxSabun());
		return "insaInputForm.jsp";
	}
	

	// 등록 - 화면 이동 없음
	@RequestMapping(value = "/insaInputAjax.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public void insaInputAjax(InsaVo vo, HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {

		// 주민등록 번호 설정
		vo.setReg_no(vo.getReg_no1() + '-' + vo.getReg_no2() + vo.getReg_no3());

		if (vo.getMil_type() == null)
			System.out.println("mil_type null");
		// if(vo.getMil_level() == null) vo.setMil_level("");

		// 이력서 이미지 설정 및 파일 업로드
		if (vo.getUpload_carrier_image() != null) {
			vo.setCarrier_image(FileUpload.uploadNewFile(request, CARRIER_IMAGE_PATH, vo.getUpload_carrier_image()));
		} else {
			vo.setCarrier_image("");
		}

		// 사업자 등록증 이미지 설정 및 파일 업로드
		if (vo.getUpload_cmp_reg_image() != null) {
			vo.setCmp_reg_image(FileUpload.uploadNewFile(request, CMP_REG_IMAGE_PATH, vo.getUpload_cmp_reg_image()));
		} else {
			vo.setCmp_reg_image("");
		}

		// 프로필 이미지 설정 및 파일 업로드
		if (vo.getUpload_profile_image() != null) {
			vo.setProfile_image(FileUpload.uploadNewFile(request, PROFILE_IMAGE_PATH, vo.getUpload_profile_image()));
		} else {
			vo.setProfile_image("");
		}

		// 이메일 설정
		if (vo.getEmail_id() != null) {
			if (vo.getEmail_domain1() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain1());
			} else if (vo.getEmail_domain2() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain2());
			}
		}

		// 연봉 금액 설정
		if (vo.getSalary_str() != null && !vo.getSalary_str().equals("")) {
			vo.setSalary(Integer.parseInt(vo.getSalary_str().replaceAll(",", "")));
		}

		is.insertInsa(vo);

		response.getWriter().print("등록하였습니다.");

	}

	// 목록 조회 화면으로 이동
	@RequestMapping(value = "/insaListForm.do", method = RequestMethod.GET)
	public String insaListFormView(InsaVo vo, Model model) {
		List<String> gubunList = ics.getGubunList(); // 공통 코드 구분 목록 조회

		for (String gubun : gubunList) { // 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}

		if (vo.getSabun() != null) {

			Page page = Page.getInstance(vo.getPage(), is.getInsaListCnt(vo), 10, 10);

			page.setInsa(new InsaVo(vo.getSabun(), vo.getJoin_day(), vo.getRetire_day(), vo.getJoin_yn(),
					vo.getPut_yn(), vo.getName(), vo.getPos_gbn_code(), vo.getJoin_gbn_code()));

			vo.setStartRow(page.getStartRow());
			vo.setEndRow(page.getEndRow());

			model.addAttribute("page", page);
			model.addAttribute("insaList", is.getInsaList(vo));
		}

		return "insaListForm.jsp";
	}

	// 수정 화면으로 이동
	@RequestMapping(value = "/insaUpdateForm.do", method = RequestMethod.GET)
	public String insaUpdateFormView(InsaVo vo, Model model) {
		List<String> gubunList = ics.getGubunList(); // 공통 코드 구분 목록 조회

		for (String gubun : gubunList) { // 공통 코드 목록 파라미터 등록
			model.addAttribute(gubun + "_list", ics.getGubunTypeList(gubun));
		}

		model.addAttribute("insa", is.getInsa(vo));

		return "insaUpdateForm.jsp";
	}

	// 수정 - 화면 이동 없음
	@RequestMapping(value = "/insaUpdateAjax.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public void insaUpdateAjax(InsaVo vo, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("insaUpdateAjax: " + vo);
		// 주민등록 번호 설정
		vo.setReg_no(vo.getReg_no1() + '-' + vo.getReg_no2() + vo.getReg_no3());

		/* 이력서 이미지 설정 및 파일 업로드 및 기존 파일 삭제 */
		// 기존 업로드된 파일이 없을 경우	
		if (!vo.getUpload_carrier_image().getOriginalFilename().equals("") && 
				vo.getProfile_image().equals("")) { 		
			// 새로운 파일 업로드
			vo.setCarrier_image(FileUpload.uploadNewFile(request, CARRIER_IMAGE_PATH, vo.getUpload_carrier_image())); 

		// 기존 업로드된 파일이 있을 경우
		} else if (!vo.getUpload_carrier_image().getOriginalFilename().equals("")) { 
			vo.setCarrier_image(FileUpload.updateFile(request, CARRIER_IMAGE_PATH, vo.getCarrier_image(),
					vo.getUpload_carrier_image())); // 파일 업데이트
		}

		/* 사업자 등록증 이미지 설정 및 파일 업로드 */
		// 기존 업로드된 파일이 없을 경우
		if (!vo.getUpload_cmp_reg_image().getOriginalFilename().equals("") && vo.getProfile_image().equals("")) { 
			// 새로운 파일 업로드
			vo.setCmp_reg_image(FileUpload.uploadNewFile(request, CMP_REG_IMAGE_PATH, vo.getUpload_cmp_reg_image())); 
			
			// 기존 업로드된 파일이 있을 경우
		} else if (!vo.getUpload_cmp_reg_image().getOriginalFilename().equals("")) { 
			// 파일 업데이트
			vo.setCmp_reg_image(FileUpload.updateFile(request, CMP_REG_IMAGE_PATH, vo.getCmp_reg_image(),
					vo.getUpload_cmp_reg_image())); 
		}

		/* 프로필 이미지 설정 및 파일 업로드 */
		// 기존 업로드된 파일이 없을 경우
		if (!vo.getUpload_profile_image().getOriginalFilename().equals("") && vo.getProfile_image().equals("")) {
			 // 새로운 파일 업로드
			vo.setProfile_image(FileUpload.uploadNewFile(request, PROFILE_IMAGE_PATH, vo.getUpload_profile_image()));
		// 기존 업로드된 파일이 있을 경우
		} else if (!vo.getUpload_profile_image().getOriginalFilename().equals("")) { 
			// 파일 업데이트
			vo.setProfile_image(FileUpload.updateFile(request, PROFILE_IMAGE_PATH, vo.getProfile_image(), vo.getUpload_profile_image())); 
		}

		// 이메일 설정
		if (vo.getEmail_id() != null) {

			if (vo.getEmail_domain1() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain1());
			} else if (vo.getEmail_domain2() != null) {
				vo.setEmail(vo.getEmail_id() + '@' + vo.getEmail_domain2());
			}
		}

		// 연봉 금액 설정
		if (vo.getSalary_str() != null && !vo.getSalary_str().equals("")) {
			vo.setSalary(Integer.parseInt(vo.getSalary_str().replaceAll(",", "")));
		}

		is.updateInsa(vo);

		response.getWriter().print("수정하였습니다.");
	}

	// 수정
	@RequestMapping(value = "/insaUpdateForm.do", method = RequestMethod.POST)
	public String insaUpdateForm() {
		return "insaUpdateForm.jsp";
	}

	// 삭제
	@RequestMapping(value = "/insaDelete.do")
	public String insaDelete(InsaVo vo) {
		is.deleteInsa(vo);
		return "redirect:index.do";
	}
	
	// 삭제 Ajax
	@RequestMapping(value = "/insaDeleteAjax.do")
	public void insaDeleteAjax(InsaVo vo, HttpServletResponse response) {		
		System.out.println(vo);
		try {
			PrintWriter out = response.getWriter();
			is.deleteInsa(vo);
			out.print(vo.getSabun() + " delete success!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	// 아이디 중복 여부 확인
	@RequestMapping(value = "/checkId.do")
	public void checkId(InsaVo vo, HttpServletResponse response) {
		String id = vo.getId();
		InsaVo insa = is.checkId(vo);

		System.out.println("checkId : " + vo.getId());

		// 아이디 사용 불가
		if (insa != null && insa.getId().equals(id)) {
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

	// 테스트를 위한 대량의 데이터 등록
	@RequestMapping(value = "/insertBigTestData.do")
	public void insertBigTestData() {
		List<InsacomVo> posList = ics.getGubunTypeList("pos_gbn_code");
		List<InsacomVo> joinList = ics.getGubunTypeList("join_gbn_code");
				
		
		for (int i = 1; i < 246; i++) {
			InsaVo vo = new InsaVo();

			vo.setName(CD.getName());
			vo.setId("member2");
			vo.setPwd("1234");
			vo.setReg_no(CD.getRegNo());
			vo.setHp(CD.getPhone());
			vo.setZip(CD.getPost());
			vo.setAddr1(CD.getAddress(1));
			vo.setAddr2(CD.getAddress(2));
			vo.setSalary(CD.getRandom(25000000, 70000000));
			vo.setPos_gbn_code(posList.get(CD.getRandom(0, posList.size() - 1)).getName());
			vo.setJoin_gbn_code(joinList.get(CD.getRandom(0, joinList.size() - 1)).getName());
			
			
			String str = "";
			
			String join_day = CD.getDate();
			String retire_day = CD.getDate();
		
			if(Integer.parseInt(join_day) > Integer.parseInt(retire_day)) {
				String temp = join_day;
				join_day = retire_day;
				retire_day = temp;
			}
			
			join_day = join_day.substring(0,4) + "-" + join_day.substring(4, 6) +  "-" + join_day.substring(6, 8);
			retire_day = retire_day.substring(0,4) + "-" + retire_day.substring(4, 6) +  "-" + retire_day.substring(6, 8);
			vo.setJoin_day(join_day);
			vo.setRetire_day(retire_day);
			
			if (CD.getRandom(0, 1) == 0)
				vo.setJoin_yn("Y");
			else
				vo.setJoin_yn("N");
								
			
			if (CD.getRandom(0, 1) == 0)
				vo.setPut_yn("Y");
			else
				vo.setPut_yn("N");
			
			System.out.println(vo);
			is.insertBigTestData(vo);

		}
		 
	}
}
