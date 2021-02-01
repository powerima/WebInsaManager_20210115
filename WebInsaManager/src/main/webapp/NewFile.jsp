<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<section>

<div class="border m-5 bt-5 ">
	<form>
		<!-- 1 ~ 9 시작 -->
		<div class="d-grid gap-9 m-5">
			<!-- 1. 등록 버튼 -->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="p-1 bg-light border col-sm-0.5">
					<button type="submit" class="btn btn-primary btn-sm">등록</button>
				</div>
				<div class="p-1 bg-light border col-sm-0.5">				
					<button type="submit" class="btn btn-primary btn-sm">전화면</button>
				</div>
				<div class="p-1 bg-light border col-sm-0.5">
					<button type="reset" class="btn btn-primary btn-sm">리셋</button>
				</div>
			</div>	
		
			<!-- 2. 이미지 사진과 파일 업르도 -->
			<div class="d-grid p-2 bg-light border mb-3">
				<div class="p-2 bg-light border col-md-3">
		 			<img src="file/profile_empty.jpg" alt="Generic placeholder image" />
		 		</div>
		 		<div class="p-1 bg-light border col-md-3">
					<div class="custom-file">
						<input type="file" class="custom-file-input form-control-sm" id="profile_image"
							name="upload_profile_image" aria-describedby="inputGroupFileAddon01"> 
						<label class="custom-file-label col-form-label-sm" for="profile_image">파일 선택</label>
					</div>
				</div>				
			</div>		
		
			<!-- 3. 사번, 아이디, 비밀번호 -->
			<div class="form-row p-2 bg-light border mb-3">
				
				<div class="form-group col-md-3">
					<label for="sabun">사번</label> 
					<input type="number" class="form-control form-control-sm" name="sabun"
							 id="sabun"	placeholder="사번" readonly>				 	
				</div>
				<div class="form-group col-md-3">
					<label for="id" class="form-label">아이디</label> 
					<input type="text" class="form-control form-control-sm is-invalid"
						id="id" oninput="id_check(this)" required>					
					<div class="valid-feedback">사용할 수 있는 아이디 입니다.</div>
					<div id="div_id_invalid" class="invalid-feedback">아이디를 입력해 주세요.</div>
					<div id="div_id"></div>
				</div>
				<div class="form-group col-md-3">
					<label for="pwd">비밀번호</label> 
					<input type="password" class="form-control form-control-sm is-invalid" 
						name="pwd" id="pwd" placeholder="비밀번호" oninput="pwd_check(this)" required>					
					<div id="div_pwd_invalid" class="invalid-feedback">비밀번호를 입력해주세요.</div>
					<div id="div_pwd"></div>
				</div>
				<div class="form-group col-md-3">
					<label for="pwd2">비밀번호 확인</label> 
					<input type="password" class="form-control form-control-sm is-invalid" 
						name="pwd2" id="pwd2" oninput="pwd2_check(this)" placeholder="비밀번호 확인">
					<div class="valid-feedback">비밀번호가 확인 되었습니다.</div>
					<div id="div_pwd2_invalid" class="invalid-feedback"></div>
					<div id="div_pwd2"></div>
				</div>			
			</div>
			
			
			<!-- 4. 이름 주민등록번호 성별 연령-->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-3">
					<label for="name">한글성명</label> 
					<input type="text" class="form-control form-control-sm is-invalid" 
						name="name" id="name" oninput="name_check(this)" placeholder="한글이름" required>					
					<div class="invalid-feedback">이름을 입력해주세요.</div>
				</div>
				<div class="form-group col-md-3">
					<label for="eng_name">영문성명</label> 
					<input type="password" class="form-control form-control-sm" name="eng_name"
						id="eng_name" placeholder="영문성명">
				</div>	
				<div class="form-group col-md-4">
					<label for="reg_no" class="form-label">주민등록번호</label>
					<div class="input-group is-invalid" id="reg_no">									
						<input type="text" name="reg_no1" id="reg_no1" maxlength="6" 
							oninput="reg_no_check(this)" 
							class="form-control form-control-sm is-invalid">												
						<div class="input-group-prepend">
							<span class="input-group-text form-control-sm">-</span>
						</div>
						<input type="text" name="reg_no2" id="reg_no2" 
							maxlength="1" oninput="reg_no_check(this)"
							class="form-control form-control-sm col-md-1 is-invalid">						
						<input type="password" name="reg_no3" id="reg_no3"
							maxlength="6" oninput="reg_no_check(this)"
							class="form-control form-control-sm is-invalid">
						<div class="invalid-feedback">주민등록번호를 입력해주세요.</div>
					</div>											
				</div>
				<div class="form-group col-md-1">					
					<label for="age" class="form-label">연령</label> 
					<input type="text" name="age" id="age" oninput="age_check(this)"
						class="form-control form-control-sm">				
				</div>
				<div class="form-group col-md-1">
					<label for="sex" class="form-label">성별</label> 
					<select id="sex" name="sex" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</div>						
			</div>
							
		
			<!-- 5. 핸드폰 번호, 전화번호, 이메일 등급 입력  -->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-3">
					<label for="hp">핸드폰 번호</label> 
					<input type="text" name="hp" id="hp" maxlength="13" placeholder="핸드폰 번호"
						oninput="hp_check(this)" class="form-control form-control-sm is-invalid">
					<div class="invalid-feedback">핸드폰 번호를 입력해주세요.</div> 
				</div>
				<div class="form-group col-md-3">
					<label for="phone">전화 번호</label> 
					<input type="text" name="phone" id="phone" maxlength="13" placeholder="전화번호"
						oninput="phone_check(this)" class="form-control form-control-sm" >
				</div>
				<div class="form-group col-md-4">
					<label for="input-group-email">Email</label> 
					<div class="input-group" id="input-group-email">
						<input type="text" name="email_id"
							class="form-control form-control-sm">
						<div class="input-group-prepend">
							<span class="input-group-text form-control-sm">@</span>
						</div>
						<select class="form-control form-control-sm" id="inputGroupSelect01">
							<option selected>선택</option>
							<c:forEach items="${email_domain1_list }" var="email_domain1">
								<option value="${email_domain1.name }">${email_domain1.name }</option>
							</c:forEach>
							<option value="naver.com">naver.com</option>
							<option value="">직접입력</option>	
						</select> 
						<input type="text" disabled	class="form-control form-control-sm">
					</div>
				</div>	
				<div class="form-group col-md-2">
					<label for="gart_level">등급</label> 
					<select name="gart_level" id="gart_level" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${gart_level_list }" var="gart_level">
							<option value="${gart_level.name }">${gart_level.name }</option>
						</c:forEach>					
					</select>
				</div>	
			</div>
			
			<!-- 6. 주소 우편번호 찾기  -->
			<div class="form-row p-2 bg-light border">
				<div class="form-group col-md-3">
					<label for="inputZip">우편 번호</label>
					<div class="input-group">
						<input type="text" name="zip" class="form-control form-control-sm"
							id="sample4_postcode" placeholder="우편 번호">
						<div class="input-group-append">
							<input type="button" class="btn btn-primary btn-sm" 
								onclick="sample4_execDaumPostcode()" value="주소 검색" />							
						</div>
					</div>
				</div>
				<div class="form-group col-md-3">
					<label for="inputAddress1">도로명 주소</label>
					<input type="text" class="form-control form-control-sm" 
						id="sample4_roadAddress" placeholder="도로명 주소">
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="40">
					<span id="guide" style="color:#999;display:none"></span>					
				</div>
				<div class="form-group col-md-3">
					<label for="inputAddress2">상세 주소</label> 
					<input type="text" class="form-control form-control-sm" 
						id="sample4_detailAddress"	placeholder="상세 주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="60" >
				</div>
				<div class="form-group col-md-3">
					<label for="hp">입사구분</label> 
					<select name="join_yn" id="join_yn" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
			</div>	
				
			<!-- 7. 직종분류 등 -->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-2">
					<label for="pos_gbn_code">직위</label>
					<select name="pos_gbn_code" id="pos_gbn_code"
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
							<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
						</c:forEach>		
					</select>					
				</div>
				<div class="form-group col-md-2">
					<label for="dept_code">부서</label>
					<select name="dept_code" id="dept_code" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${dept_code_list }" var="dept_code">
							<option value="${dept_code.name }">${dept_code.name }</option>
						</c:forEach>	
					</select>				
				</div>
				<div class="form-group col-md-2">
					<label for="join_gbn_code">직종</label>
					<select name="join_gbn_code" id="join_gbn_code" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
							<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
						</c:forEach>						
					</select>									
				</div>
				<div class="form-group col-md-2">
					<label for="put_yn">투입여부</label>
					<select name="put_yn" id="put_yn"
						class="form-control form-control-sm">
						<option selected>선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>													
				</div>
				<div class="form-group col-md-4">
					<label for="salary">연봉</label>
					<input type="text" name="salary_str" placeholder="(만원)" id="salary" 
						 oninput="salary_str_check(this)" style="text-align:right"
						 class="form-control form-control-sm">																
				</div>				
			</div>
			
			
			<!-- 8. 군 입대 사항 -->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-2">
					<label for="mil_yn">군필 여부</label> 
					<select name="mil_yn" id="mil_yn" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
				<div class="form-group col-md-2">
					<label for="mil_type">군별</label> 
					<select id="mil_type" name="mil_type"
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${mil_type_list }" var="mil_type">
							<option value="${mil_type.name }">${mil_type.name }</option>
						</c:forEach>	
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="mil_level">계급</label> 
					<select id="mil_level" name="mil_level" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${mil_level_list }" var="mil_level">
							<option value="${mil_level.name }">${mil_level.name }</option>
						</c:forEach>			
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="mil_startdate">입영일자</label>
					<div class="form-inline form-group"> 
						<input type="text" id="mil_startdate" name="mil_startdate" 
						class="testDatepicker form-control form-control-sm">
					</div>
				</div>
				<div class="form-group col-md-3">
					<label for="mil_enddate">전역일자</label> 
					<div class="form-inline form-group">
						<input type="text" id="mil_enddate" name="mil_enddate" 
							class="testDatepicker form-control form-control-sm">
					</div>					
				</div>						
			</div>
			
			<!-- 9. KOSA, 입사, 퇴사일자 -->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-3">
					<label for="kosa_reg_yn">KOSA 등록</label> 
					<select name="kosa_reg_yn" id="kosa_reg_yn" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select> 
				</div>
				<div class="form-group col-md-3">
					<label for="kosa_class_code">KOSA 등급</label> 
					<select name="kosa_class_code" id="kosa_class_code" 
						class="form-control form-control-sm">
						<option selected>선택</option>
						<c:forEach items="${kosa_class_code_list }" var="kosa_class_code">
							<option value="${kosa_class_code.name }">${kosa_class_code.name }</option>
						</c:forEach>	
					</select>					
				</div>
				<div class="form-group col-md-3">
					<label for="join_day">입사일자</label>
					<div class="form-inline form-group"> 
						<input type="text" id="join_day" name="join_day" 
						class="testDatepicker form-control form-control-sm">
					</div>
				</div>
				<div class="form-group col-md-3">
					<label for="retire_day">퇴사일자</label> 
					<div class="form-inline form-group">
						<input type="text" id="retire_day" name="retire_day" 
							class="testDatepicker form-control form-control-sm">
					</div>					
				</div>						
			</div>
							
			<!-- 10. 자기소개, 사업자 번호, 업체명, 파일등록-->
			<div class="form-row p-2 bg-light border mb-3">
				<div class="form-group col-md-2">
					<label for="kosa_class_code">사업자 번호</label> 
					<input type="text" name="cmp_reg_no" id="cmp_reg_no" maxlength="11" 
						oninput="cmp_reg_no_check(this)"  class="form-control form-control-sm">										
				</div>
				<div class="form-group col-md-2">
					<label for="kosa_class_code">업체명</label> 
					<input type="text" name="crm_name" class="form-control form-control-sm">										
				</div>		
				<div class="form-group col-md-2">
					<label for="upload_cmp_reg_image">사업자등록증</label>
					<div class="custom-file">					
						<input type="file" class="custom-file-input form-control-sm" id="upload_cmp_reg_image"
							name="upload_cmp_reg_image" aria-describedby="upload_cmp_reg_image"> 
						<label class="custom-file-label col-form-label-sm" for="upload_cmp_reg_image">파일 선택</label>
					</div>
				</div>
				<div class="form-group col-md-2">
					<label for="upload_carrier_image">이력서</label>
					<div class="custom-file">
						<input type="file" class="custom-file-input form-control-sm" id="upload_carrier_image"
							name="upload_carrier_image" aria-describedby="upload_carrier_image"> 
						<label class="custom-file-label col-form-label-sm" for="upload_carrier_image">파일 선택</label>
					</div>
				</div>
				<div class="form-group col-md-4">
					<label for="kosa_reg_yn">자기소개</label> 
					<textarea name="self_intro" class="form-control form-control-sm" 
						aria-label="With textarea"></textarea>
				</div>			
			</div>
		</div>		
		<!-- 1 ~ 10 종료 -->
	</form>
</div>
</section>	
</body>
</html>