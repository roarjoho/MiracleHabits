<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Form</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div id="sub_img"></div>
	
<%
int num = Integer.parseInt(request.getParameter("num"));
%>
<article>
	<h1>비밀번호를 입력하세요</h1>
	<form action="deletePro.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<table id="notice">
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="글 삭제"></td></tr>
		</table>
	</form>

	<div class="clear"></div>
	<div id="page_control"></div>
</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>