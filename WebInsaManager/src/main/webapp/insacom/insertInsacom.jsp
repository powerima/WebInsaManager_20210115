<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<section>
<h2>인사 공통 코드 입력</h2>
<div align="center">
<hr>
<form action="insertInsacom.do" method="post" 
		name="inputForm" onsubmit="return checkInputForm()">
<table border="1" class="line_table">
	<tr>
		<td align="center">구분</td>
		<td><input type="text" name="gubun" 
				class="form-control form-control-sm"></td>
	</tr>
	<tr>
		<td align="center">코드</td>
		<td><input type="text" name="code"
				class="form-control form-control-sm"></td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td><input type="text" name="name" 
				class="form-control form-control-sm"></td>
	</tr>
	<tr>
		<td align="center">설명</td>
		<td><input type="text" name="note" 
				class="form-control form-control-sm"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="코드 등록" 
					class="btn btn-primary btn-sm">				  
		</td>
	</tr>
</table>
</form>

<br>
<a href="/biz/insacom/getInsacomList.jsp">등록된 코드 조회</a>
</div>
</section>
<%@ include file="../bottom.jsp" %>