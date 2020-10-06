<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
<a href="/" class="logo"><strong>Happy</strong> <span>House</span></a>

						<nav>
						<c:if test="${userinfo == null}">
							<a href="/mvjoin">Join</a>
							<a href="/mvlogin">Log In</a>
							&nbsp&nbsp&nbsp&nbsp
							</c:if>
							<c:if test="${userinfo != null}">
							<a href="${root}/mvuserinfo"><strong>${userinfo.name}</strong>님의 회원정보</a>
							<a href="${root}/logout">Log out</a>
							&nbsp&nbsp&nbsp&nbsp
							</c:if>
							<a href="#menu">Menu</a>
						</nav>
</body>
</html>