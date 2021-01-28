<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../top.jsp" %>
<section>
<div align="center">
<h2>인사 공통 코드 목록 조회</h2>
<hr>
<a href="/biz/insacom/insertInsacom.do">코드 등록 하기</a>
<form action="insertInsacom.do" method="get">
<table class="line_table" border="1" width="700">
	<tr>
		<td>구분</td>
		<td>코드</td>
		<td>이름</td>
		<td>설명</td>		
	</tr>
	<c:forEach items="${insacomList }" var="insacom">
	<tr>
		<td>${insacom.gubun }</td>
		<td><a href="/biz/insacom/deleteInsacom.do?gubun=${insacom.gubun }&code=${insacom.code }">
			${insacom.code }</a></td>
		<td>${insacom.name }</td>
		<td>${insacom.note }</td>
	</tr>	
	</c:forEach>
</table>
</form>
<br>
<a href="/biz/insacom/insertInsacom.do">코드 등록 하기</a>
</div>
</section>
</body>
</html>