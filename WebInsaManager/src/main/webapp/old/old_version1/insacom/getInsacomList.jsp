<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../top.jsp" %>
<section>
<h2>인사 공통 코드 목록 조회</h2>
<div align="center">
<hr>
<a href="/biz/old_version/insacom/insertInsacom.jsp">코드 등록 하기</a>
<form action="insertInsacom.do" method="get">
<table border="1" id="inputForm" class="line_table">
	<thead align="center">
		<tr>
			<td>구분</td>
			<td>코드</td>
			<td>이름</td>
			<td>설명</td>
		</tr>		
	</thead>
	<tbody>	
	<c:forEach items="${insacomList }" var="insacom">
		<tr align="center">
			<td>${insacom.gubun }</td>
			<td><a href="/biz/insacom/deleteInsacom.do?gubun=${insacom.gubun }&code=${insacom.code }">
				${insacom.code }</a></td>
			<td>${insacom.name }</td>
			<td>${insacom.note }</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" align="center">
				<a class="btn btn-primary btn-sm" 
					href="/biz/insacom/insertInsacom.do" role="button">코드 등록</a>
			</td>
		</tr>
	</tfoot>
</table>
</form>
<br>
<a href="/biz/old_version/insacom/insertInsacom.jsp">코드 등록 하기</a>
</div>
</section>
<%@ include file="../bottom.jsp" %>