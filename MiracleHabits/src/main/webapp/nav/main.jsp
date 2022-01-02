<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div id="main_img"><img src="../images/company/sub_back.png" width="971" height="179"></div>
	<div class="clear"></div>
	
	<article id="front">
		<div id="solution">
			<div id="hosting">
				<h3>Plan Your Day</h3>
				<p>당신의 오늘 일정을 기록해보세요.<br><br>
					# Monthly Calendar<br>
					# Appointments<br>
					# To-Do List<br>
					# Time Tracker<br>
				</p>
			</div>
			
			<div id="security">
			<h3>For Your Life</h3>
			<p>당신의 일상을 기록해보세요.<br><br>
			   # Reading<br>
			   # Movie, Drama<br>
			   # Exercise<br>
			   # Water Tracker<br>
			</p>
			</div>
			
			<div id="payment">
			<h3>Share With Others</h3>
			<p>다른사람들과 공유하고 싶은 일이 있나요?<br>게시판에서 공유해보세요.<br></p>
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div id="sec_news">
			<h3><span class="orange">Weather</span></h3>
			<dl>
				<dt>Weather API ipnida....</dt>
				<dd>날씨 API 업데이트 예정</dd>
			</dl>
		</div>
		
		<div id="sec_news">
			<h3><span class="orange">News</span></h3>
			<table>
				<tr><td class="contxt"><a href="#">뉴스 api 업데이트 예정</a></td>
			    	<td>2021.11.03</td></tr>
			    </table>
		</div>
	</article>
	
<div class="clear"></div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>
