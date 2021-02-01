<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ include file="../top.jsp" %>

<section>
<div id="section_title">
	<h2>직원 상세 정보</h2>
</div>

<div align="center">
<form name="inputForm" action="/biz/insa/insaUpdateForm.do" method="post"
		id="inputForm" onsubmit="return checkInputForm()" enctype="multipart/form-data">
		
<table width="1300">
	<tr>
		<td colspan="8" align="right">
			<input type="button" id="insaUpdateAjax" value="수정">
			<input type="button" id="insaDeleteAjax" value="삭제">
			<input type="button" onclick="location.href='/biz/insa/insaListForm.do'" value="이전">
		</td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" align="center">			
			<c:if test="${insa.profile_image == null}">
				<img src="/biz/file/profile_empty.jpg" height="120">			
			</c:if>
			<c:if test="${insa.profile_image != null}">
				<img src="/biz/file/profile_img/${insa.profile_image }" height="120">
			</c:if>
			
		</td> 
		<td>사번</td>
		<td><input type="number" name="sabun" value="${insa.sabun }" readonly></td>
		<td>한글성명</td>
		<td><input type="text" name="name" value="${insa.name }"></td>
		<td>영문성명</td>
		<td><input type="text" name="eng_name" value="${insa.eng_name }"></td>
	</tr>
	<tr>	
		<td>아이디</td>
		<td><input type="text" id="precheck_id"  value="${insa.id }" readonly>
			<input type="hidden" name="id" id="id" value="${insa.id }"> 
			
		<td>패스워드</td>
		<td><input type="password" name="pwd"></td>
		<td>패스워드확인</td>
		<td><input type="password" name="pwd2"></td>
	</tr>
	<tr>	
		<td>전화번호</td>
		<td><input type="text" name="phone" id="phone" maxlength="13"
				oninput="phone_check(this)" value="${insa.phone }"></td>
		<td>핸드폰번호</td>
		<td><input type="text" name="hp" id="hp" maxlength="13"
				oninput="hp_check(this)" value="${insa.hp }"></td>
		<td>주민번호</td>
		<td><input type="text" name="reg_no1" id="reg_no1" value="${fn:substring(insa.reg_no, 0, 6) }"
				maxlength="6" size="5" oninput="reg_no_check(this)"> - 
			<input type="text" name="reg_no2" id="reg_no2" value="${fn:substring(insa.reg_no, 7, 8) }"
				maxlength="1" size="1" oninput="reg_no_check(this)">	
			<input type="password" name="reg_no3" id="reg_no3" value="${fn:substring(insa.reg_no, 8, 14) }"
				maxlength="6" size="5" oninput="reg_no_check(this)"></td>
	</tr>	
	<tr>

		<td>연령</td>
		<td><input type="text" name="age" id="age" maxlength="3"
				oninput="age_check(value)" value="${insa.age }" ></td>
				
		<td colspan="2">이메일
			<c:set var="index_email" value="${fn:indexOf(insa.email, '@') }"/>
			<c:set var="len_email" value="${fn:length(insa.email) }" />
			<input type="text" name="email_id" size="10" value="${fn:substring(insa.email, 0, index_email) }"> @ 
			<select name="email_domain1" id="email_domain1" style="width:110px">
				<option value=""></option>
				<c:forEach items="${email_domain1_list }" var="email_domain1">
					<option value="${email_domain1.name }">${email_domain1.name }</option>
				</c:forEach>				
				<option value="" selected>직접입력</option>				
			</select>
		<input type="text" name="email_domain2" id="email_domain2" 
				value="${fn:substring(insa.email, index_email+1, len_email) }" size="10"></td>
		<td colspan="2">
			직종 <select name="join_gbn_code" style="width:100px">
					<option value="${insa.join_gbn_code }">${insa.join_gbn_code }</option>
					<option value=""></option>
					<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
						<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
					</c:forEach>						
				</select>
			성별 <select id="sex" name="sex" style="width:100px">
					<option value="${insa.sex }">${insa.sex }</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">			
			<input type="hidden" name="profile_image" value="${insa.profile_image }">
			<c:if test="${insa.profile_image != null }">
				<p>[<a href="#profile_image_modal" rel="modal:open">사진 확인</a>]</p>			
			</c:if></td>
		<td>주소</td>
		<td  colspan="5">		
			<input type="text" id="sample4_postcode" placeholder="우편번호" name="zip" value="${insa.zip }">
			<input type="button" onclick="sample4_execDaumPostcode()" value="주소 검색">
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="40"  name="addr1" value="${insa.addr1 }" >
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="40">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="40"  name="addr2" value="${insa.addr2 }">
			<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
			<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" >			
		</td>
	</tr>
		
	<tr>		
		<td	colspan="2">
			
			<input type="file" name="upload_profile_image"></td>
		<td>직위</td>
		<td><select name="pos_gbn_code" style="width:165px">
				<option value="${insa.pos_gbn_code }">${insa.pos_gbn_code }</option>
				<option value=""></option>
				<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
					<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
				</c:forEach>		
			</select> 
		</td>
		
		<td>부서</td>
		<td>
			<select name="dept_code" style="width:165px">
				<option value="${insa.dept_code }">${insa.dept_code }</option>
				<option value=""></option>
				<c:forEach items="${dept_code_list }" var="dept_code">
					<option value="${dept_code.name }">${dept_code.name }</option>
				</c:forEach>	
			</select>
		</td>   
		<td>연봉</td>
		<td>
			<input type="text" style="text-align:right" name="salary_str"
			placeholder="(만원)" id="salary" maxlengt="2" value="${insa.salary }"
				oninput="salary_str_check(this)" >
		</td> 
	</tr>
	<tr>
		<td>입사구분</td>
		<td><select name="join_yn" style="width:165px">
				<option value="${insa.join_yn }">${insa.join_yn }</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
		<td>등급</td>
		<td><select name="gart_level" style="width:165px">
				<option value="${insa.gart_level }">${insa.gart_level }</option>
				<option value=""></option>
				<c:forEach items="${gart_level_list }" var="gart_level">
					<option value="${gart_level.name }">${gart_level.name }</option>
				</c:forEach>					
			</select></td>
		<td>투입여부</td>
		<td><select name="put_yn" style="width:165px">
				<option value="${insa.put_yn }">${insa.put_yn }</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
				
		<td>군필여부</td>
		<td><select id="mil_yn" name="mil_yn" style="width:165px">
				<option value="${insa.mil_yn }">${insa.mil_yn }</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
	</tr>
	<tr>
		<td>군별</td>
		<td><select id="mil_type" name="mil_type" style="width:165px">
				<option value="${insa.mil_type }">${insa.mil_type }</option>
				<option value=""></option>
				<c:forEach items="${mil_type_list }" var="mil_type">
					<option value="${mil_type.name }">${mil_type.name }</option>
				</c:forEach>	
			</select></td>
		<td>계급</td>
		<td><select id="mil_level" name="mil_level" style="width:165px">
				<option value="${insa.mil_level }">${insa.mil_level }</option>
				<option value=""></option>
				<c:forEach items="${mil_level_list }" var="mil_level">
					<option value="${mil_level.name }">${mil_level.name }</option>
				</c:forEach>			
			</select></td>
		<td>입영일자</td>
		<td><input type="text" id="mil_startdate" name="mil_startdate"
				value="${fn:substring(insa.mil_startdate, 0, 10) }" class="testDatepicker"></td>
		<td>전역일자</td>
		<td><input type="text" id="mil_enddate" name="mil_enddate"
				value="${fn:substring(insa.mil_enddate, 0, 10) }" class="testDatepicker"></td>
	</tr>

	<tr>
		<td>KOSA등록</td>
		<td><select name="kosa_reg_yn" id="kosa_reg_yn" style="width:165px">
				<option value="${insa.kosa_reg_yn }">${insa.kosa_reg_yn }</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
		<td>KOSA등급</td>
		<td><select name="kosa_class_code" id="kosa_class_code" style="width:165px">
				<option value="${insa.kosa_class_code }">${insa.kosa_class_code }</option>
				<option value=""></option>
				<c:forEach items="${kosa_class_code_list }" var="kosa_class_code">
					<option value="${kosa_class_code.name }">${kosa_class_code.name }</option>
				</c:forEach>	
			</select></td>
		<td>입사일자</td>
		<td><input type="text" name="join_day" id="join_day" 
					value="${fn:substring(insa.join_day, 0, 10) }" class="testDatepicker"></td>
		<td>퇴사일자</td>
		<td><input type="text" name="retire_day" id="retire_day"
					value="${fn:substring(insa.retire_day, 0, 10) }" class="testDatepicker"></td>
	</tr>	
	<tr>
		<td>사업자번호</td>
		<td><input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="11" 
					value="${insa.cmp_reg_no }"	oninput="cmp_reg_no_check(this)"></td>
		<td>업체명</td>
		<td><input type="text" name="crm_name" value="${insa.crm_name }"></td>
		
		<td>사업자등록증</td>
		<td><input type="file" name="upload_cmp_reg_image"></td>
		
		<td colspan ="2">
			<input type="hidden" name="cmp_reg_image" value="${insa.cmp_reg_image }">
			<c:if test="${insa.cmp_reg_image != null }">
				<p>[<a href="#cmp_reg_image_modal" rel="modal:open">사업자등록증 확인</a>]</p>
			</c:if>
			<!-- 
			<input type="button" onclick="location.href='#modal'" rel="modal:open" value="미리보기" style="width:90px">
			<input type="button" value="등록" style="width:90px">
			 -->
		</td>	 	
	</tr>	
	<tr>
		<td>자기소개</td>
		<td colspan="3">
			<textarea cols="60" rows="2" name="self_intro"
					 placeholder="100자 이내로 적으시오.">${insa.self_intro }</textarea>
		</td>		
		<td>이력서</td>
		<td><input type="file" name="upload_carrier_image"></td>
		<td colspan="2">
			<input type="hidden" name="carrier_image" value="${insa.carrier_image }">
			<c:if test="${insa.carrier_image != null }">
				<p>[<a href="#carrier_image_modal" rel="modal:open">이력서 확인</a>]</p>			
			</c:if>
			<!--  
			<input type="button" value="다운" style="width:90px">
			<input type="button" value="파일업로드" style="width:90px">
			-->
		</td>		
	</tr>
</table>
</form>
</div>

<div id="profile_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/profile_img/${insa.profile_image }" 
			height="600" width="400"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>


<div id="carrier_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/carrier_img/${insa.carrier_image }" 
			height="600"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>
 
 <div id="cmp_reg_image_modal" class="modal">
	<div align="center">
		<img src="/biz/file/cmp_reg_img/${insa.cmp_reg_image }" 
			height="600"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>

</section>
<%@ include file="../bottom.jsp" %>

