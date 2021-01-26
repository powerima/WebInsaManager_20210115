<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
<div id="section_title">
	<h2>직원 리스트</h2>
</div>
<div align="center">
<form action="" method="post">
<table width="1300">
	<tr>
		<td>사번</td>
		<td><input type="number" name="sabun"></td>
		<td>성명</td>
		<td><input type="text" name="name"></td>
		<td>입사구분</td>
		<td><select style="width:165px">
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
		<td>투입여부</td>
		<td><select name="put_yn" style="width:165px">
				<option value="1">Y</option>
				<option value="0">N</option>
			</select></td>
	</tr>
	<tr>
		<td>직위</td>
		<td><input type="text"></td>
		<td>입사일자</td>
		<td><input type="text" name="join_day" class="testDatepicker"></td>
		<td>퇴사일자</td>
		<td><input type="text" name="retire_day" class="testDatepicker"></td>
		<td>직종분류</td>
		<td><select name="job_type" style="width:165px">
				<option value="1">영업</option>
				<option value="2">개발</option>
				<option value="2">지원</option>
			</select></td>
	</tr>
	<tr>
		<td colspan="8" align="right">
			<input type="button" value="검색">
			<input type="reset" value="초기화">
			<input type="button" value="이전">
		</td>
	</tr>
</table>
</form>	
</div>
</section>
</body>
</html>