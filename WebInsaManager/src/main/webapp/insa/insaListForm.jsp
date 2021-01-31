<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../top.jsp" %>
<section>

<div class="m-5 bt-5">
	<div class="mb-3">
		<h3>인사 정보 입력</h3>
	</div>
	
	<form class="row pb-3" id="getInsaListForm" action="/biz/insa/insaListForm.do" method="post">
		<div class="row border m-3 pb-3">
			<div class="col-md-3">
				<label for="sabun">사번</label> 
				<input type="number" class="form-control form-control-sm" name="sabun"
						 id="sabun"	placeholder="사번">				 	
			</div>
			<div class="form-group col-md-3">
				<label for="name">한글성명</label> 
				<input type="text" class="form-control form-control-sm " 
					name="name" id="name" oninput="name_check(this)" placeholder="한글이름">				
			</div>
			<div class="col-md-3">
				<label for="join_yn">입사구분</label> 
				<select name="join_yn" id="join_yn" class="form-control form-control-sm">
					<option selected>선택</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select> 
			</div>
			<div class="col-md-3">
				<label for="put_yn">투입여부</label>
				<select name="put_yn" id="put_yn" class="form-control form-control-sm">
					<option selected>선택</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>													
			</div>			
		</div>
		<div class="row border m-3 pb-3">
			<div class="col-md-3">
				<label for="pos_gbn_code">직위</label>
				<select name="pos_gbn_code" id="pos_gbn_code" class="form-control form-control-sm">
					<option selected>선택</option>
					<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
						<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
					</c:forEach>		
				</select>					
			</div>
			<div class="col-md-3">
				<label for="join_day">입사일자</label>
				<div class="form-inline form-group"> 
					<input type="text" id="join_day" name="join_day" 
					class="testDatepicker form-control form-control-sm">
				</div>
			</div>
			<div class="col-md-3">
				<label for="retire_day">퇴사일자</label> 
				<div class="form-inline form-group">
					<input type="text" id="retire_day" name="retire_day" 
						class="testDatepicker form-control form-control-sm">
				</div>					
			</div>
			<div class="col-md-3">
				<label for="join_gbn_code">직종</label>
				<select name="join_gbn_code" id="join_gbn_code" 
					class="form-control form-control-sm">
					<option selected>선택</option>
					<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
						<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
					</c:forEach>						
				</select>									
			</div>
		</div>
		<div class="row border m-3">
			<div class="col-md-12">			
				<button type="button" class="btn btn-primary btn-sm float-end m-1"
					 onclick="location.href='/biz/index.jsp'">이전</button>
				<button type="reset" class="btn btn-primary btn-sm float-end m-1">초기화</button>					
				<button type="submit" class="btn btn-primary btn-sm float-end m-1" id="getInsaList_btn">검색</button>
			</div>
		</div>
	</form>
	<div id="getInsaList m-4">	
		<table class="table table-hover table-sm col-md-5">
			<tr align="center">
				<td>사번</td>
				<td>성명</td>
				<td>주민번호</td>
				<td>핸드폰번호</td>
				<td>직위</td>
				<td>입사일자</td>
				<td>퇴사일자</td>
				<td>투입여부</td>
				<td>연봉</td>		
			</tr>
			<c:if test="${recordCnt == 0 }">
			<tr>
				<td colspan="9" align="center">
					검색된 데이터가 없습니다.
				</td>
			</tr>
			</c:if>
			<c:forEach items="${insaList }" var="insa">
			<tr align="center">
				<td><a href="/biz/insa/insaUpdateForm.do?sabun=${insa.sabun }">
							${insa.sabun }</a></td>
				<td>${insa.name }</td>
				<td>${insa.reg_no }</td>
				<td>${insa.hp }</td>
				<td>${insa.pos_gbn_code }</td>
				<td>${fn:substring(insa.join_day, 0 ,10) }</td>
				<td>${fn:substring(insa.retire_day, 0 ,10) }</td>		
				<td>${insa.put_yn }</td>
				<td align="right"><fmt:formatNumber value="${insa.salary }"
						pattern="#,###" /></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>				
</section>
<%@ include file="../bottom.jsp" %>