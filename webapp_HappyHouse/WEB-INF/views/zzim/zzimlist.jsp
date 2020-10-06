<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<script type="text/javascript">
$(".hover").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );

</script>
<style>

@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css); 
@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800);
figure.snip1141 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 400px;
  max-width: 400px;
  max-height: 600px;
  width: 100%;
  background: #000000;
  color: #000000;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  display: inline-block;	
}

figure.snip1141 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.snip1141 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}

figure.snip1141 .circle {
  position: relative;
  height: 50px;
  width: 50px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50%;
  text-align: center;
}

figure.snip1141 .circle:before,
figure.snip1141 .circle:after {
  border: 2px solid white;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  
}

figure.snip1141 .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.snip1141 .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

figure.snip1141 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  display: block;
  width: 100%;
  overflow: hidden;
}

figure.snip1141 h3 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  letter-spacing: -1px;
  line-height: 55px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
  color: white;
}

figure.snip1141 .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}

figure.snip1141 i {
  color: white;
  font-size: 48px;
  line-height: 55px;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}

figure.snip1141:hover .circle,
figure.snip1141.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.snip1141:hover .circle:before,
figure.snip1141.hover .circle:before,
figure.snip1141:hover .circle:after,
figure.snip1141.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.snip1141:hover h3,
figure.snip1141.hover h3 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.snip1141:hover img,
figure.snip1141.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

figure.snip1141:hover i,
figure.snip1141.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
.card{
display: inline-block;
margin: 10px;

}

.card-title, .card-body,button {
	color: navy;
}

.card-img-top {
    width: 100%;
    height: 13vw;
    object-fit: cover;
}

.bt_del {
	margin : 0 auto;

}
#main{
width:65%;
	margin: 0 auto;
}

</style>
</head>

<body class="is-preload"  align="center">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<%@ include file="../header.jsp"%>
		</header>
		<%@ include file="../menu.jsp"%>

		<section id="banner" align="left">
			<div class="inner">
				<span class="image"> <img src="images/pic07.jpg" alt="" />
				</span>
				<header class="major">
					<h4>관심 목록</h4>
				</header>
			</div>
		</section>

		<div id="main"> 

		<c:forEach items="${zzims }" var="zzim">
			
			<div class="card" style="width: 425px">
			<figure class="snip1141">
						<c:if test="${zzim.img ne '' }">
							<img class="card-img-top" src="img/${zzim.img}" alt="Card image" height="150px">
						</c:if>
						<c:if test="${zzim.img eq '' }">
							<img class="card-img-top" src="img/aptDefault.jpg"
								alt="Card image" height="150px">
						</c:if>
						
				<figcaption>
					<div class="circle">
						<i class="ion-ios-plus-empty"> </i>
					</div>
					<h3>검색하러가기</h3>
				</figcaption>
				<a
					href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=${zzim.aptName }"></a>
			</figure>
						<div class="card-body">
							<h4 class="card-title">${zzim.aptName}</h4>
							<p class="card-text">${zzim.dong}</p>
							<input type="button" value="찜 취소" class="bt_del" onclick="location.href='${root}/deleteZzim?zzimNo=${zzim.zzimNo}'"
							style="color:navy; border: 0.2px solid navy;">

						</div>
					</div>
				
			</c:forEach>
		 </div> 



	</div>

</body>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</html>