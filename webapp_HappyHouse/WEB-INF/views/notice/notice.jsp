<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//function showUpForm(noticeNo) {
		/* console.log(noticeNo);
		$('#form').hide();
		$('#list').hide();
		$('#upform').show();
		$.ajax({
			type : 'GET',
			url : '${root}api/notice/' + noticeNo,
			dataType : 'json',
			success : function(data) {
				var htmlTxt = '<table border="1px"><tr><td>번호</td><td>'
						+ data.noticeNo + '</td></tr>' + '<tr><td>제목</td><td>'
						+ data.noticeTitle + '</td></tr>'
						+ '<tr><td>작성자</td><td>' + data.noticeUserid
						+ '</td></tr>' + '<tr><td>내용</td><td>'
						+ data.noticeContent + '</td></tr>'
						+ '<tr><td>작성시간</td><td>' + data.noticeDatetime
						+ '</td></tr>';
				htmlTxt += '</table>'
				$('#detailform').html(htmlTxt);
				console.log(data);

			}
		}); */
		function showUpForm(noticeNo) {
			console.log(noticeNo);
			$('#form').hide();
			$('#list').hide();
			$('#updateform').show();
			$.ajax({
				type : 'GET',
				url : '${root}api/notice/' + noticeNo,
				dataType : 'json',
				success : function(data) {
					console.log(data);
					$("#updateform input[name=noticeNo]").val(data.noticeNo);
					$("#updateform input[name=noticeTitle]").val(data.noticeTitle);
					$("#updateform input[name=noticeUserid]").val(data.noticeUserid);
					$("#updateform input[name=noticeContent]").val(data.noticeContent);
	
				}
			});
		}//수정폼 보이기
	//}//수정폼 보이기

	function listPrint() {
		$
				.ajax({
					type : 'GET',
					url : '${root}api/notice',
					dataType : 'json',
					success : function(data) {
						var htmlTxt = '<table border="1px"><tr><th>게시글 번호 </th><th>게시글 제목</th><th>작성자</th><th>작성시간</th></tr>';
						$.each(data, function(index, value) {
							htmlTxt += '<tr><td>' + value.noticeNo
									+ '</td><td>'
									+ '<a href="javascript:showUpForm('
									+ value.noticeNo + ')">'
									+ value.noticeTitle + '</td><td>'
									+ value.noticeUserid + '</td><td>'
									+ value.noticeDatetime;
						});
						htmlTxt += '</table>'
						$('#inputlist').html(htmlTxt);
					}
				});
	}//목록보기

	$(document)
			.ready(
					function() {
						$('#showList').click(function() {
							$('#list').show();
							$('#form').hide();
							listPrint();
						});//목록보기

						$('#showForm').click(function() {
							$('#upform').hide();
							$('#list').hide();
							$('#form').show();
						});//입력폼보기

						$('#bt_insert')
								.click(
										function() {
											$
													.ajax({
														type : 'POST',
														headers : {
															"Content-Type" : "application/json"
														},
														url : '${root}api/notice',
														data : JSON
																.stringify({
																	noticeNo : $(
																			"#form input[name=noticeNo]")
																			.val(),
																	noticeTitle : $(
																			"#form input[name=noticeTitle]")
																			.val(),
																	noticeContent : $(
																			"#form input[name=noticeContent]")
																			.val(),
																	noticeUserid : $(
																			"#form input[name=noticeUserid]")
																			.val(),
																	noticeDatetime : $(
																			"#form input[name=noticeDatetime]")
																			.val()
																}),
														success : function(data) {
															$('#form').hide();
															$('#list').show();
															listPrint();
															alert("공지사항이 등록되었습니다.");
														}
													});
										});//입력요청

						$('#bt_update')
								.click(
										function() {

											$
													.ajax({
														type : 'PUT',
														url : "${root}api/notice/"
															+ $("#updateform input[name=noticeNo]")
																	.val(),
														headers : {
															"Content-Type" : "application/json"
														},
														data : JSON
																.stringify({
																	noticeNo : $(
																			"#updateform input[name=noticeNo]")
																			.val(),
																	noticeTitle : $(
																			"#updateform input[name=noticeTitle]")
																			.val(),
																	noticeContent : $(
																			"#updateform input[name=noticeContent]")
																			.val(),
																	noticeUserid : $(
																			"#updateform input[name=noticeUserid]")
																			.val(),									
																}),
														success : function(data) {
															alert("수정이 완료되었습니다.");
															$('#updateform').hide();
															$('#list').show();
															listPrint();
														}
													});
										});//수정요청

						$('#bt_delete').click(
								function() {
									$.ajax({
										type : "DELETE",
										url : "${root}api/notice/"
												+ $("#updateform input[name=noticeNo]")
														.val(),
										success : function(result) {
											//if (result.status) {
												alert("삭제가 완료되었습니다.");
												$('#list').show();
												$('#updateform').hide();
												listPrint();
										//	}

										}
									});
								});//삭제요청
						
						$('.bt_list').click(function() {
							$('#list').show();
							$('#form').hide();
							$('#updateform').hide();
							listPrint();
						});
						$('#bt_mvinsert').click(function() {
							$('#list').hide();
							$('#form').show();
							$('#upform').hide();
						});//등록요청

						listPrint();
					});//ready
</script>
</head>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper" class="container">
		<!-- Header -->
		<header id="header" class="alt">
			<%@ include file="../header.jsp"%>
		</header>
		<%@ include file="../menu.jsp"%>
		<section id="banner">
			<div class="inner">
				<span class="image"> <img src="images/pic07.jpg" alt="" />
				</span>
				<header class="major">
					<h4>공지사항</h4>
				</header>
			</div>
		</section>

		<div id="list">
			<div id="inputlist"></div>
			<c:if test="${userinfo.id eq 'admin'}">
				<input type="button" value="등록" id="bt_mvinsert">
			</c:if>
		</div>
		<div id="form" style="display: none">
			<table border="1">
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="noticeUserid" value="${userinfo.id }" readonly></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="noticeContent"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="button" value="입력" id="bt_insert">
						 <input type="button" value="목록" id="bt_list"></td>
				</tr>
			</table>
		</div>
		<div id="updateform" style="display: none">
				<table border="1">
					<tr>
						<td>번호</td>
						<td><input type="text" name="noticeNo" readonly></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="noticeTitle"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="noticeUserid" readonly></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><input type="text" name="noticeContent"></td>
					</tr>
					<tr>
						<td colspan="2">
						<c:if test="${userinfo.id eq 'admin'}">
							<input type="button" value="수정" id="bt_update"> 
							<input type="button" value="삭제" id="bt_delete">
						</c:if>
							<input type="button" value="목록" class="bt_list">
						</td>
					</tr>
				</table>
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
