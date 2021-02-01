<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 조회 리스트 테이블</title>
</head>
<body>
<div id="insaList m-3">
<table class="table table-hover table-sm" 
			id="insaListTable">
	<thead>
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
	</thead>
	<tbody>
	<c:if test="${recordCnt == 0 }">
		<tr>
			<td colspan="9" align="center">
				검색된 데이터가 없습니다.
			</td>
		</tr>
		</c:if>
		<c:forEach items="${insaList }" var="insa">
		<tr>
			<td>${insa.sabun }</td>
			<td>${insa.name }</td>
			<td>${insa.reg_no }</td>
			<td>${insa.hp }</td>
			<td>${insa.pos_gbn_code }</td>
			<td><fmt:parseDate value="${insa.join_day }"
					pattern="yyyy-MM-dd" /></td>
			<td><fmt:parseDate value="${insa.retire_day }"
					pattern="yyyy-MM-dd" /></td>		
			<td>${insa.put_yn }</td>
			<td><fmt:formatNumber value="${insa.salary }"
					pattern="#,###" /></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<%@ include file="../bottom.jsp" %>