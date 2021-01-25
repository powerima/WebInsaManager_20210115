<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
<h2>직원 상세 정보</h2>
<form action="insaInputForm.do" method="post">
<table border="1" width="700">
<tr>
	<td colspan="2" align="right">
		<input type="submit" value="등록">
		<input type="button" value="전화면">
		<input type="reset" value="초기화"></td>
</tr>
<tr>
	<td>사번</td>
	<td><input type="text" name="sabun"></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<td>주민등록번호</td>
	<td><input type="text" name="reg_no"></td>
</tr>
<tr>
	<td>휴대폰 번호</td>
	<td><input type="text" name="hp"></td>
</tr>
<tr>
	<td>아이디</td>
	<td><input type="text" name="id"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pwd"></td>	
</tr>
</table>
</form>
</section>
</body>
</html>