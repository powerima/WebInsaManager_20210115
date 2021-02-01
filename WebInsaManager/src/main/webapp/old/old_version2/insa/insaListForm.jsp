<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../top.jsp" %>
<section>
<div id="section_title">
	<h2>직원 리스트</h2>
</div><hr>
<div id="insa_list" align="center">
<form id="getInsaListForm" method="post" action="/biz/insa/insaListForm.do">
<table class="table table-hover">
	<tr>
		<td>사번</td>
		<td><input type="number" name="sabun"
				class="form-control form-control-sm"></td>
		<td>성명</td>
		<td><input type="text" name="name"
				class="form-control form-control-sm"></td>
		
	
		<td>입사구분</td>
		<td><select name="join_yn" class="form-control form-control-sm">
				<option value=""></option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
			
		<td>투입여부</td>
		<td><select name="put_yn" class="form-control form-control-sm">
				<option value=""></option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
			
	</tr>
	<tr>
		<td>직위</td>
		<td><select name="pos_gbn_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${pos_gbn_code_list }" var="pos_gbn_code">
					<option value="${pos_gbn_code.name }">${pos_gbn_code.name }</option>
				</c:forEach>		
			</select> </td>
		<td>입사일자</td>
		<td><div class="form-inline form-group" >
			<input type="text" name="join_day"
				class="testDatepicker form-control form-control-sm"></div></td>
		<td>퇴사일자</td>
		<td><div class="form-inline form-group" >
			<input type="text" name="retire_day"
			 class="testDatepicker form-control form-control-sm"></div></td>
		<td>직종분류</td>
		<td><select name="join_gbn_code" class="form-control form-control-sm">
				<option value=""></option>
				<c:forEach items="${join_gbn_code_list }" var="join_gbn_code">
					<option value="${join_gbn_code.name }">${join_gbn_code.name }</option>
				</c:forEach>						
			</select></td>
	</tr>
	<tr>
		<td colspan="8" align="right">
			<input type="submit" id="getInsaList_btn" value="검색"
					class="btn btn-primary btn-sm">
			<input type="reset" value="초기화"
					class="btn btn-primary btn-sm">
			<input type="button" onclick="location.href='/biz/index.jsp'" value="이전"
					class="btn btn-primary btn-sm">
		</td>
	</tr>
</table>
</form>
	
<div id="getInsaList">
<hr>
<table class="table table-hover">
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