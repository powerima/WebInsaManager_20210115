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
<img id="profile_thumbnail" src=
	<c:if test="${insa.profile_image == null}">					
		"/biz/file/profile_empty.jpg" 			
	</c:if>
	<c:if test="${insa.profile_image != null}">					
		"/biz/file/profile_img/${insa.profile_image }" 
	</c:if>
width="100" height="120">
</body>
</html>