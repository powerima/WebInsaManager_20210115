<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../top.jsp" %>
<section>

<div class="m-5">
	<div class="mb-3">
		<h4>인사 공통 코드 목록</h4>
	</div>
	<div class="container">
		<div class="justify-content-center">
			<div class= "col-md-6 form-control-sm">
				<form action="insertInsacom.do" method="get">
				<table class="table table-hover table-sm col-md-5">
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
				</table>
				</form>
			</div>
		</div>
	</div>
</div>

</section>
<%@ include file="../bottom.jsp" %>