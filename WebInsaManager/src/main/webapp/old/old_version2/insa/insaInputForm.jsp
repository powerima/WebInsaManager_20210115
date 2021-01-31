<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 
<%@ include file="../top.jsp" %>

<section>
<div class="mb-3" id="section_title">
	<h2>직원 상세 정보</h2>
</div>
<div align="center">
<form name="inputForm" action="/biz/insa/insaInputForm.do" method="post"
		id="inputForm" onsubmit="return checkInputForm()" enctype="multipart/form-data">
		
<table class="table table-hover">
	<tr>
		<td colspan="8" align="right">
			<input type="button" id="insaInputAjax" value="등록"
				class="btn btn-primary btn-sm">
			<input type="submit" value="전화면"
				class="btn btn-primary btn-sm">
			<input type="reset" value="초기화"
				class="btn btn-primary btn-sm">
		</td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" align="center">
			<img src="/biz/file/profile_empty.jpg" height="200">
		</td> 
		<td>사번</td>
		<td><input type="number" name="sabun" value="${sabun }" readonly
				class="form-control form-control-sm"></td>
		<td>한글성명</td>
		<td><input type="text" name="name"
				class="form-control form-control-sm"></td>
		<td>영문성명</td>
		<td><input type="text" name="eng_name"
				class="form-control form-control-sm"></td>
	</tr>
	<tr>	
		<td>아이디</td>
		<td><div class="form-inline form-group" >
				<input type="text" id="precheck_id" style="width:120px"
					class="form-control form-control-sm  me-2">
				<input type="hidden" name="id" id="id"> 				
				<input type="button" id="idcheck" value="중복확인"
					class="btn btn-primary btn-sm"></div></td>			
		<td>패스워드</td>
		<td><input type="password" name="pwd"
				class="form-control form-control-sm"></td>
		<td>패스워드확인</td>
		<td><input type="password" name="pwd2"
				class="form-control form-control-sm"></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><div class="form-inline form-group">				
				<input type="text" name="reg_no1" id="reg_no1" maxlength="6" 
					oninput="reg_no_check(this)" style="width:100px"
					class="form-control form-control-sm">
				<label>-</label>
				<input type="text" name="reg_no2" id="reg_no2" style="width:20px"
					maxlength="1" oninput="reg_no_check(this)"
					class="form-control form-control-sm">
				<input type="password" name="reg_no3" id="reg_no3" style="width:100px"
					maxlength="6" oninput="reg_no_check(this)"
					class="form-control form-control-sm"></div></td>
		<td>전화번호</td>
		<td><input type="text" name="phone" id="phone" maxlength="13"
				oninput="phone_check(this)" class="form-control form-control-sm"></td>
		<td>핸드폰번호</td>
		<td><input type="text" name="hp" id="hp" maxlength="13"
				oninput="hp_check(this)" class="form-control form-control-sm"></td>
	</tr>	
	<tr>
		<td>연령</td>
		<td><input type="text" name="age" id="age" maxlength="3"
				oninput="age_check(this)"  class="form-control form-control-sm"></td>
				
		<td>이메일</td>
		<td><div class="form-inline form-group">
			<input type="text" name="email_id"  style="width:80px"
					 class="form-control form-control-sm"> @ 
			<select name="email_domain1" id="email_domain1" style="width:100px"
					 class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${email_domain1_list }" var="email_domain1">
					<option value="${email_domain1.name }">${email_domain1.name }</option>
				</c:forEach>				
				<option value="">직접입력</option>				
			</select>
			<input type="text" name="email_domain2" id="email_domain2" disabled  style="width:90px"
					 class="form-control form-control-sm"></div></td>
		<td>성별</td>
		<td><select id="sex" name="sex" class="form-control form-control-sm">
				<option value="남자">남자</option>
				<option value="여자">여자</option>
			</select></td>
	</tr>
	<tr>	
		<td	colspan="2">
			<input type="file" name="upload_profile_image" class="form-control-file" ></td>
		<td>주소</td>
		<td  colspan="5">	
			<div class="form-inline form-group" >
				<input type="text" id="sample4_postcode" placeholder="우편번호" name="zip"
					 class="form-control form-control-sm col-sm-1">
				<div class="col-sm-1"><input type="button" onclick="sample4_execDaumPostcode()" 
						value="주소 검색" class="btn btn-primary btn-sm"></div>
				<div class="col-sm-4"><input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="40"  name="addr1" 
					 class="form-control form-control-sm">
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="40">
					<span id="guide" style="color:#999;display:none"></span></div>
				<div><input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="40"  name="addr2" 
					 class="form-control form-control-sm">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ></div>			
			</div>		
		</td>
	</tr>
		
	<tr>
		<td>직위</td>
		<td><select name="pos_gbn_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
					<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
				</c:forEach>		
			</select> 
		</td>
		
		<td>부서</td>
		<td><select name="dept_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${dept_code_list }" var="dept_code">
					<option value="${dept_code.name }">${dept_code.name }</option>
				</c:forEach>	
			</select></td>  
		<td>직종</td>
		<td><select name="join_gbn_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
					<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
				</c:forEach>						
			</select></td>
		<td>연봉</td>
		<td><input type="text" style="text-align:right" name="salary_str" placeholder="(만원)" 
				oninput="salary_str_check(this)" class="form-control form-control-sm"></td>
	  
	</tr>
	<tr>
		<td>입사구분</td>
		<td><select name="join_yn" class="form-control form-control-sm">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
		<td>등급</td>
		<td><select name="gart_level" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${gart_level_list }" var="gart_level">
					<option value="${gart_level.name }">${gart_level.name }</option>
				</c:forEach>					
			</select></td>
		<td>투입여부</td>
		<td><select name="put_yn" class="form-control form-control-sm">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
				
		<td>군필여부</td>
		<td><select id="mil_yn" name="mil_yn" class="form-control form-control-sm">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
	</tr>
	<tr>
		<td>군별</td>
		<td><select id="mil_type" name="mil_type" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${mil_type_list }" var="mil_type">
					<option value="${mil_type.name }">${mil_type.name }</option>
				</c:forEach>	
			</select></td>
		<td>계급</td>
		<td><select id="mil_level" name="mil_level" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${mil_level_list }" var="mil_level">
					<option value="${mil_level.name }">${mil_level.name }</option>
				</c:forEach>			
			</select></td>
		<td>입영일자</td>
		<td><div class="form-inline form-group">
			<input type="text" id="mil_startdate" name="mil_startdate" 
				class="testDatepicker form-control form-control-sm"></div></td>
		<td>전역일자</td>
		<td><div class="form-inline form-group">
			<input type="text" id="mil_enddate" name="mil_enddate" 
				class="testDatepicker form-control form-control-sm"></div></td>
	</tr>

	<tr>
		<td>KOSA등록</td>
		<td><select name="kosa_reg_yn" id="kosa_reg_yn" class="form-control form-control-sm">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
		<td>KOSA등급</td>
		<td><select name="kosa_class_code" id="kosa_class_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${kosa_class_code_list }" var="kosa_class_code">
					<option value="${kosa_class_code.name }">${kosa_class_code.name }</option>
				</c:forEach>	
			</select></td>
		<td>입사일자</td>
		<td><div class="form-inline form-group">
			<input type="text" name="join_day" id="join_day" 
			class="testDatepicker form-control form-control-sm"></div></td>
		<td>퇴사일자</td>
		<td><div class="form-inline form-group">
			<input type="text" name="retire_day" id="retire_day" 
			class="testDatepicker form-control form-control-sm"></div></td>
	</tr>	
	<tr>
		<td>사업자번호</td>
		<td><input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="11" 
				oninput="cmp_reg_no_check(this)"  class="form-control form-control-sm"></td>
		<td>업체명</td>
		<td><input type="text" name="crm_name"
				 class="form-control form-control-sm"></td>
		
		<td>사업자등록증</td>
		<td><input type="file" name="upload_cmp_reg_image"></td>
		
		<td colspan ="2" align="center">
			<!-- 
			<input type="button" onclick="location.href='#modal'" rel="modal:open" value="미리보기" style="width:90px">
			<input type="button" value="등록" style="width:90px">
			 -->
		</td>	 	
	</tr>	
	<tr>
		<td>자기소개</td>
		<td colspan="3">
			<textarea cols="60" rows="2" name="self_intro"  class="form-control" 
					 placeholder="100자 이내로 적으시오."></textarea>
		</td>		
		<td>이력서</td>
		<td><input type="file" name="upload_carrier_image"></td>
		<td colspan="2" align="center">
			<!--  
			<input type="button" value="다운" style="width:90px">
			<input type="button" value="파일업로드" style="width:90px">
			-->
		</td>		
	</tr>
</table>
</form>
</div> 

</section>
<%@ include file="../bottom.jsp" %>

