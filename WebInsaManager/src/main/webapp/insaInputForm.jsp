<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
<h2>직원 상세 정보</h2>
<form name="joinForm" action="insaInputForm.do" method="post"
		onsubmit="return checkForm();">
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
<tr>
	<td>날짜</td>
	<td><input type="text" class="testDatepicker" name="beforeDay">
		<input type="text" class="testDatepicker" name="afterDay"></td>	
</tr>
<tr>
	<td>연봉</td>
	<td><input type="text" style="text-align:right" name="salary"
			placeholder="원" id="money" onkeyup="numberWithCommas(this.value)" ></td>
</tr>
</table>
</form>
</section>
</body>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	
	// 입력 폼 값 유효성 검사
	function checkForm() {
		var date1 = new Date(joinForm.beforeDay.value);
		var date2 = new Date(joinForm.afterDay.value);
		
		if(date1 > date2) {
			alert('마지막 날짜가 더 커야 합니다.');
		}
		return false;
	}

	function password
	
	// 3자리 수 마다 콤마, 숫자만 입력
	function numberWithCommas(x) {
		x = x.replace(/[^0-9]/g,'');
		x = x.replace(/,/g,'');
		$("#money").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}

	// 달력 
	$(function(){
		$(".testDatepicker").datepicker({
			showOn: "both",
			buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dateFormat: "yy-mm-dd"
		});
	});	
	
</script>
</html>