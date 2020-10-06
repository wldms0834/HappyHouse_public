<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
	Forty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Happy House</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url(img.jpg) center center fixed no-repeat;
}

#wrapper {
	opacity: 0.6;
	margin-top: 2.5%;
}

video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}
</style>

</head>
<body class="is-preload">
	<div id="">
		<video muted autoplay loop>
			<source src="img/background.mp4" type="video/mp4">
		</video>

		<!-- Wrapper -->

		<!-- Header -->
		<header id="header" class="alt">
			<%@ include file="header.jsp"%>
		</header>
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
				<li><a href="/mvjoin" class="button primary fit">Get
						Started</a></li>
				<li><a href="/mvlogin" class="button fit">Log In</a></li>
			</ul>
		</nav>
		<div id="wrapper">
			<!-- Banner -->
			<section id="banner" class="major">
				<div class="inner">
					<header class="major">
						<h1>
							<span style="color: #87c5a4">나만의 </span> 집, <span
								style="color: #e7b788;">나만의 </span>공간
						</h1>
					</header>
					<div class="content">
						<h2>
							<span style="color: #8ea9e8">어떤 환경, 어떤 동네 </span>에서 살고 싶으신가요 ?
						</h2>
						<ul class="actions">
							<li><a href="/housedeallist" class="button next scrolly">집
									찾으러 가기</a></li>
						</ul>
					</div>
				</div>
			</section>



			<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="icons">
						<li><a href="#" class="icon brands alt fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands alt fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands alt fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands alt fa-github"><span
								class="label">GitHub</span></a></li>
						<li><a href="#" class="icon brands alt fa-linkedin-in"><span
								class="label">LinkedIn</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Happy House</li>
						<li>Design: <a href="#">전선진,허지은</a></li>
					</ul>
				</div>
			</footer>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>