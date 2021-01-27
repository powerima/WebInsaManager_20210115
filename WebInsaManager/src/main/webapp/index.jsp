<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pino Soft InsaManager</title>
<link rel="stylesheet" href="/biz/css/style.css" type="text/css">
</head>
<body>
<header>
	<div>
		<div class="banner">
			<h2><a class="head" href="/biz/index.jsp">Pino Soft</a></h2>
		</div>
		<div class="nav">
			<a href="/biz/index.jsp">Home</a>&emsp;&emsp;
			<a href="/biz/insa/insaInputForm.do">Input</a>&emsp;&emsp;
			<a href="/biz/insa/insaListForm.do">Search</a>
		</div>		
	</div>
</header>
<section>
	<div align="center">
		<hr><br><br><br>
		<h2>인사관리 시스템</h2><br>
		<p>인사정보를 입력하겠습니다. <input type="button" value="입력" onclick="location.href='/biz/insa/insaInputForm.do'" /></p>
		<p>인사정보를 조회하겠습니다. <input type="button" value="조회" onclick="location.href='/biz/insa/insaListForm.do'"/></p>
	</div>
</section>
<footer>
	<div align="center">
		<p>서울시 금천구 디지털로9길 46, 306호 ( 이앤씨벤처드림타워 7차 ) / Tel. 02-6935-2288</p>
		<p>/ Fax. 02-852-1848 Copyrightⓒ 2021 Pino Soft All right reserved by pino4681@daum.net</p>
	</div> 
</footer>
</body>
</html>