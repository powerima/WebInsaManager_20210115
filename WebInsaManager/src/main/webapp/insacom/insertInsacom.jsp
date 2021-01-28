<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<section>
<div align="center">
<h2>인사 공통 코드 입력</h2>
<hr>
<form class="line_table" action="insertInsacom.do" method="post">
<table border="1">
	<tr>
		<td>구분</td>
		<td><input type="text" name="gubun"></td>
	</tr>
	<tr>
		<td>코드</td>
		<td><input type="text" name="code"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>설명</td>
		<td><input type="text" name="note"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="코드 등록">				  
		</td>
	</tr>
</table>
</form>

<br>
<a href="/biz/insacom/getInsacomList.do">등록된 코드 조회</a>
</div>
</section>
</body>
</html>