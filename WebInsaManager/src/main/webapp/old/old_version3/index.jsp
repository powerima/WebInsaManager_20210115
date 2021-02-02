<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div class="pt-5" align="center">
		<h2 class="m-3">인사관리 시스템</h2>
		<p class="m-5">인사정보를 입력하겠습니다. 
			<input type="button" value="입력" class="btn btn-primary btn-sm"
			onclick="location.href='/biz/insa/insaInputForm.do'" /></p>
		<p class="m-3">인사정보를 조회하겠습니다. 
			<input type="button" value="조회" class="btn btn-primary btn-sm"
			 onclick="location.href='/biz/insa/insaListForm.do'"/></p>
	</div>
</section>
<%@ include file="bottom.jsp" %>