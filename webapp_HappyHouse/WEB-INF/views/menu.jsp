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
		<noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
</head>
<body>
<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="/">Home</a></li>
							<li><a href="notice">Notice</a></li>
							<li><a href="/housedeallist">Search</a></li>
							<li><a href="/customsearch">맞춤검색</a></li>
							<li><a href="/qna">QnA</a></li>
							<li><a href="/zzim">관심 목록</a></li>
						</ul>				
						
						<ul class="actions stacked">		
						<c:if test="${userinfo == null}">				
							<li><a href="/mvjoin" class="button primary fit">Get Started</a></li>
							<li><a href="/mvlogin" class="button fit">Log In</a></li>	
							</c:if>				
						</ul>
						
						
					</nav>

</body>
</html>