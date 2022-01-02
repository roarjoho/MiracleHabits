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
<title>writeForm.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>

<%
String id = (String)session.getAttribute("id");
%>

<body>
<div id="wrap">
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div id="sub_img"></div>
	<nav id="sub_menu">
		<ul>
			<li><a href="notice.jsp">Notice</a></li>
			<li><a href="#">Public Board</a></li>
		</ul>
	</nav>

<article>
	<h1>글 작성하기</h1>
	<form action="writePro.jsp" method="post" enctype="multipart/form-data">
		<table id="notice">	
			<tr><td>Id</td><td><input type="text" name="name" value=<%= id%> readonly></td></tr>
			<tr><td>Password</td><td><input type="password" name="pass"></td></tr>
			<tr><td>글 제목</td><td><input type="text" name="subject"></td></tr>
			<tr><td>파일 첨부</td><td><input type="file" name="file"></td></tr>
			<tr><td>글 내용</td>
				<td><textarea name="content" rows="10" cols="40"></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
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