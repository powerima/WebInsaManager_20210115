/**
 * 
 */


	
	

$(document).ready(function() {
	// 이메일 체크 후 활성 - 비활성화
	$('#email_domain1').change(function(){
		if($('#email_domain1 option:selected').val() == '') {
			$('#email_domain2').attr('disabled', false);
		} else {
			$('#email_domain2').attr('disabled', true);
		}
	});
	
	
	// 군필 체크 검사 후 활성 - 비활성화
	$('#mil_yn').change(function(){			
		if($('#mil_yn option:selected').val() == 'N') {
			$('#mil_type').attr('disabled', true);
			$('#mil_level').attr('disabled', true);
			$('#mil_startdate').attr('disabled', true);
			$('#mil_enddate').attr('disabled', true);
			
			$('#mil_type').val(null).prop('selected', true);
			$('#mil_level').val(null).prop('selected', true);
			$('#mil_startdate').val(null).prop('selected', true);
			$('#mil_enddate').val(null).prop('selected', true);
		} else {
			$('#mil_type').attr('disabled', false);
			$('#mil_level').attr('disabled', false);
			$('#mil_startdate').attr('disabled', false);
			$('#mil_enddate').attr('disabled', false);
		}
	});	
	
	// KOSA 등록 검사 후 활성 - 비활성화
	$('#kosa_reg_yn').change(function(){		
		if($('#kosa_reg_yn option:selected').val() == 'N') {
			$('#kosa_class_code').attr('disabled', true);
			$('#kosa_class_code').val(null).prop('selected', true);
		} else {
			$('#kosa_class_code').attr('disabled', false);
		}
	});
	
	
	// 아이디 중복 체크
	$("#idcheck").click(function(){	
		$.ajax({
			type: "GET",
			url: "/biz/insa/checkId.do",
			data: {	id: $("#precheck_id").val() },
			success: function(data) {
				if(data != '') {
					alert('아이디 사용이 가능합니다.');
					$('#id').val(data);
				} else {
					alert('아이디가 사용중 입니다. 다른 아이디를 입력해 주세요');					
				}
			}
		});	
	});

	
	// 인사 등록 - 화면 이동 없음
	$('#insaInputAjax').click(function(){
		checkInputForm();

      	var formData = new FormData($('#inputForm')[0]);
	
		$.ajax({
			type: "POST",
			url: "/biz/insa/insaInputAjax.do",
			processData: false,	// 필수
			contentType: false,	// 필수
			data: formData,
			success: function(data) {
				alert('등록되었습니다.');
			}			
		});
	});
	
	// 인사 수정 - 화면 이동 없음
	$('#insaUpdateAjax').click(function(){
		checkInputForm();

      	var formData = new FormData($('#inputForm')[0]);
	
		$.ajax({
			type: "POST",
			url: "/biz/insa/insaUpdateAjax.do",
			processData: false,	// 필수
			contentType: false,	// 필수
			data: formData,
			success: function(data) {
				alert('수정되었습니다.');
			}			
		});
	});
	
	// 인사 삭제
	$('#insaDeleteAjax').click(function(){
		var query = {sabun: inputForm.sabun.value };
		
		$.ajax({
			type: "GET",
			url: "/biz/insa/insaDelete.do",
			data: query,
			success: function(data) {
				alert("삭제 되었습니다.");
				location.href="/biz/insa/insaListForm.do";
			}
		});
	});
	
	/*
	적용 안됨
	// 직원 테이블 조회 - 화면 이동 없음
	// $('#getInsaList').load("/biz/insa/insaListFormAjax.do");
	$('#getInsaList_btn').click(function(){
		var query = $('#getInsaListForm').serialize();
		
		$.ajax({
			type: "GET",
			url: "/biz/insa/insaListFormAjax.do",
			data: query,
			success: function(data) {
				alert('!!!!');
				//$('#getInsaList').load('/biz/insa/insaListFormAjax.do');
				//document.location.reload();
			}
		});			
	});
	*/
});


// 주민등록 번호 값 체크
function reg_no_check(x, obj) {	
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/(\..*)\./g, '$1');	
	
	var reg1_len = $('#reg_no1').val().length;
	var reg2_len = $('#reg_no2').val().length;
	
	// 생년월일 추출
	if((obj.id == 'reg_no2' || obj.id == 'reg_no1')
			 && (reg1_len == 6 && reg2_len == 1)) {
			 
		var thisDate = new Date();
		var birthYear = $('#reg_no1').val().substring(0, 2);
		var sex = $('#reg_no2').val();
		var age = 0;			
		
		if(sex == '0' || sex == '9') {
			age = thisDate.getFullYear() - (1800 + Number(birthYear)) + 1;
			
			if(age > 130 ) {
				alert('생년월일을 다시 확인해 주세요');
				$('#reg_no1').val('');
				return;
			}
		}
		
		else if(sex == '1' || sex == '2' || sex == '5' || sex == '6') {
			age = thisDate.getFullYear() - (1900 + Number(birthYear)) + 1;
		}
		
		else if(sex == '3' || sex == '4' || sex == '7' || sex == '8') {
			age = thisDate.getFullYear() - (2000 + Number(birthYear)) + 1;
			
			if(age < 1) {
				alert('생년월일을 다시 확인해 주세요');
				$('#reg_no1').val('');
				return;
			}
		}
		
		$('#age').val(age);
		
	}
	
	
	// 남녀 구분 코드로 성별 추출
	if(obj.id == 'reg_no2') {
		switch(x) {
			case '1':	case '3':
			case '5':	case '7':
			case '9':
				$('#sex').val('남자');
				break;
			default:
				$('#sex').val('여자');
		}
	}
		
	$('#' + obj.id).val(x);
}

// 사업자 번호 체크
function cmp_reg_no_check(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/(\..*)\./g, '$1');
	$('#cmp_reg_no').val(x.replace(/(\d{3})(\d{2})(\d{4})/, '$1-$2-$3'));
}

// 나이 체크
function age_check(x) {
	x = x.replace(/[^0-9]/g,'');
	$('#age').val(x.replace(/(\..*)\./g, '$1'));
}

// 핸드폰 번호 체크
function hp_check(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/(\..*)\./g, '$1');
	if(x.length == 11) {
		x = x.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	} else if(x.length == 10) {
		x = x.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	}
	
	$('#hp').val(x);
}

// 전화 번호 체크
function phone_check(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/(\..*)\./g, '$1');
	if(x.indexOf('02') == 0) {
		if(x.length == 9) {
			x = x.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
		} else if(x.length == 10) {
			x = x.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
		}			
	} else {
		if(x.length == 11) {
			x = x.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		} else if(x.length == 10) { 
			x = x.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
		}
	}	
	$('#phone').val(x);
}


// 입력 폼 값 유효성 검사
function checkInputForm() {	
	var date1 = new Date(inputForm.mil_startdate.value);
	var date2 = new Date(inputForm.mil_enddate.value);
	var day1 = new Date(inputForm.join_day.value);
	var day2 = new Date(inputForm.retire_day.value);
	
	
	// 이름 입력 여부 확인
	if(inputForm.name.value == "") {
		alert('이름을 입력해야 합니다.');
		return false;
	}
		
	// 아이디 중복 여부 확인
	if(inputForm.id.value != inputForm.precheck_id.value) {
		alert('아이디 중복을 확인해 주세요.');
		return false;
	}

	// 아이디 입력 여부 확인
	if(inputForm.id.value == "") {
		alert('아이디를 입력해야 합니다.');
		return false;
	}
	
	// 비밀번호 입력 여부 확인
	if(inputForm.pwd.value == "") {
		alert('비밀번호를 입력해야 합니다.');
		return false;
	}
	
	// 비밀번호 재입력 확인
	if(inputForm.pwd.value != inputForm.pwd2.value) {
		alert('비밀번호를 확인해 주세요.');
		return false;
	}
	
	// 핸드폰 번호 입력 확인
	if(inputForm.hp.value.length < 10 ) {
		alert('핸드폰 번호를 입력해 주세요.');
		return false;
	}
	
	// 주민등록번호 입력 확인
	if(inputForm.reg_no1.value.length != 6) {
		alert('주민등록번호를 입력해 주세요.');
		return false;
	}
	
	if(inputForm.reg_no2.value.length != 1) {
		alert('주민등록번호를 입력해 주세요');
		return false;
	}
	
	if(inputForm.reg_no3.value.length != 6) {
		alert('주민등록번호를 입력해 주세요');
		return false;
	}
	
	// 입대 - 전역 날짜 체크
	if(date1 > date2) {
		alert('전역날짜가 입대 날짜보다 더 커야 합니다.');
		return false;
	}
	
	// 입사 - 퇴사 날짜 체크
	if(day1 > day2) {
		alert('퇴사일이 입사일 보다 더 커야 합니다.');
		return false;
	}
}



// 3자리 수 마다 콤마, 숫자만 입력
function numberWithCommas(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/,/g,'');
	$("#salary").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

// 달력 DatePicker
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
	
	
	
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
     
            document.getElementById("sample4_engAddress").value = data.addressEnglish;
                   
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
