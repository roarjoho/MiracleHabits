<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
<%
// 로그아웃시, 세션값 전체 삭제하고 메인페이지로 이동
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href="../nav/main.jsp";
</script>
</body>
</html>