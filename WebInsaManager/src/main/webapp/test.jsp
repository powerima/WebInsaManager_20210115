<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/biz/insa/test.do" method="post">		
		<input type="text" name="id" disabled> 
		<input type="submit" value="보내기">
	</form>	
	<br><br>
	<form action="/biz/insa/getTestList.do" method="post">
		<table border="1" width="300">
			<tr>
				<td colspan="2" align="center">
					<input type="text" name="id">
					<input type="submit" value="검색">
				</td>			
			</tr>
		</table>
	</form>
	<table border="1" width="300">
		<tr>
			<td>id</td>
		</tr>
		<c:forEach items="${testList }" var="test">
		<tr>
			<td>${test.id }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>