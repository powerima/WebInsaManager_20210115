<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
<style>
	body{
		margin:0;
		padding0;
	}
	
	header {
		padding:5px;
		padding-bottom:25px;
		background:lightgrey;
	}
	section {
		padding:10px;
	}
	
	.topleft {
		float: left;
		padding-left:50px;
	}
	
	.topright {
		float: right;
		padding-right:30px;
	}
	
	A:link{ color:#555555; text-decoration:none;}
	A:visited{ color: #555555; text-decoration:none;}
	A:active{ color: #555555; text-decoration:none;}
	A:hover{ color: #000000; text-decoration:underline;}
		
</style>
</head>
<body>
<header>
	<div class="topleft">
		<a href="index.do">PinoSoft</a>		
	</div>
	<div class="topright">
		<a href="insaInputForm.do">입력하기</a>&emsp;
		<a href="insaListForm.do">조회하기</a>
	</div>
</header>