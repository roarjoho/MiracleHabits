<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>about.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
 
</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"></jsp:include>

<div id="sub_img"></div>
	<nav id="sub_menu">
		<ul>
			<li><a href="about.jsp">About Service</a></li>
			<li><a href="#developer">Developer</a></li>
		</ul>
	</nav>
	
<article>
	<h1>About Miracle Habits</h1>
	<p>
	Miracle Habits 웹사이트는 '미라클 모닝'에서 영감을 받아 제작되었습니다.<br>
	'미라클 모닝'이란 새벽에 일찍일어나 생산적인 하루를 보내는 습관을 의미합니다.<br>
	Miracle Habits는 미라클 모닝을 실천하는 하루를 기록한다는 아이디어에서 시작했습니다.
	</p>
	<p>
	[PLAN] - 생산적인 하루를 보내기 위한 서비스를 제공합니다. 캘린더, 약속, 투두리스트, 타임트랙커 기능으로 하루를 알차게 보내보세요.<br>
	[LIFE] - 삶을 더욱 풍부하게 하는 작은 습관들을 만들고 기록해보세요. 책, 영화 & 드라마, 운동, 물마시기 기능을 제공합니다.<br>
	[SHARE] - 알차게 보낸 하루를 다른 이용자들과 공유해보세요.
	</p>
</article>

<article id="developer">
	<h1>Developer</h1>
	<figure class="ceo"><img src="../images/profile.jpg" width="196" height="226" 
	alt="CEO"><figcaption>Jihee Min</figcaption>
	</figure>
	<p>
	Miracle Habits 서비스 개발자를 소개합니다.<br><br>
	<a href="https://its-joho.tistory.com/">[개발기록]</a> 공부내용과 프로젝트 내용을 정리합니다.<br>
	<a href="https://github.com/roarjoho">[GitHub]</a> 프로젝트 파일을 업로드합니다.<br>
	</p>
</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>

</div>
</body>
</html>
