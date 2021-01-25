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
	<td><input type="text" name="id">&nbsp;<input type="button" value="중복확인"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pwd"></td>	
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td><input type="password" name="pwd2"></td>	
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
<tr>
	<td>군필여부</td>
	<td><select id="mill">
			<option value="1">군필</option>
			<option value="0">미필</option>
		</select>
		<select class="mill_op" id="mill_op1">
			<option value=null></option>
			<option>육군</option>
			<option>해군</option>
			<option>공군</option>
		</select>
		<input type="text" class="mill_op">
		<input type="text" class="mill_op">	
</tr>
</table>
</form>

<div id="modal" class="modal">
	<div align="center">
		<img src="https://cdn.pixabay.com/photo/2020/04/16/10/16/mountain-5050026__340.jpg" 
			height="600"/><br>
		<a href="#" rel="modal:close">닫기</a>
	</div>
</div>
 
<p><a href="#modal" rel="modal:open">모달창띄우기</a></p>


</section>
</body>
<script>
	$(document).ready(function() {
		$('#mill').change(function(){			
			if($('#mill option:selected').val() == '0') {
				$('.mill_op').attr('disabled', true);
				$('#mill_op1').val(null).prop('selected', true);
			} else {
				$('.mill_op').attr('disabled', false);
			}
		});	

	});

	// 입력 폼 값 유효성 검사
	function checkForm() {
		var date1 = new Date(joinForm.beforeDay.value);
		var date2 = new Date(joinForm.afterDay.value);
		
		// 아이디 입력 여부 확인
		if(joinForm.id.value == "") {
			alert("아이디를 입력해야 합니다.");
			return false;
		}
		
		// 비밀번호 입력 여부 확인
		if(joinForm.pwd.value == "") {
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
		
		// 비밀번호 재입력 확인
		if(joinForm.pwd.value != joinForm.pwd2.value) {
			alert("비밀번호가 같아야 합니다.");
			return false;
		}
		
		// 날짜 체크
		if(date1 > date2) {
			alert('마지막 날짜가 더 커야 합니다.');
			return false;
		}

		return false;
	}
	
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
