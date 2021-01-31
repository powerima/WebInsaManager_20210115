<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div align="center">
		<br><br>		
		<h2>인사관리 시스템</h2>
		<hr>
		<p>인사정보를 입력하겠습니다. 
			<input type="button" value="입력" class="btn btn-primary btn-sm"
			onclick="location.href='insa/insaInputForm.jsp'" /></p>
		<p>인사정보를 조회하겠습니다. 
			<input type="button" value="조회" class="btn btn-primary btn-sm"
			 onclick="location.href='insa/insaListForm.jsp'"/></p>
	</div>
</section>
<%@ include file="bottom.jsp" %>