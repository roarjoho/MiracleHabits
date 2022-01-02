<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unregister Form</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<%
//세션값을 활용하여 데이터베이스에서 자기 정보를 조회한다.
String id = (String)session.getAttribute("id");
String pass= (String)session.getAttribute("pass");

//로그인되지 않은 상황에서 페이지에 접근할 시 로그인페이지로 이동시킨다.
if(id==null && pass==null){
%>
    <script type="text/javascript">
    	alert("로그인이 필요한 작업입니다.");
    	location.href="login.jsp";
    </script>
<%
}else{
%>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
	<nav id="sub_menu">
		<ul>
			<li><a href="update.jsp">Update Information</a></li>
			<li><a href="delete.jsp">Unregister Member</a></li>
			<li><a href="servicePolicy.jsp">Service Policy</a></li>
		</ul>
	</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원탈퇴</h1>
<form action="deletePro.jsp" id="join" method="post">
	<fieldset>
		<legend>아이디와 비밀번호를 입력하세요</legend>
		<label>User ID</label>
		<input type="text" name="id"><br>
		<label>Password</label>
		<input type="password" name="pass"><br>
	</fieldset>
	
	<div class="clear"></div>
	
	<div id="buttons">
		<input type="submit" value="Submit" class="submit">
		<input type="reset" value="Cancel" class="cancel">
	</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
<%} %>
</body>
</html>