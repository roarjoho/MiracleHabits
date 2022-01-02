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
<title>Update Board</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<div id="sub_img"></div>
	
<%
//세션값을 조회하여 로그인 정보가 없으면 login.jsp로 이동
String id = (String)session.getAttribute("id");
if(id==null){
    response.sendRedirect("../member/login.jsp");
}
int num = Integer.parseInt(request.getParameter("num"));

//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();

//getBoard() 호출하여 클릭한 글에 해당하는 정보 가져오기
BoardDTO boardDTO = boardDAO.getBoard(num);

// 날짜 포맷 변경 => 문자열
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<article>
	<h1>Edit Board</h1>
	<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
		<table id="notice">
			<tr><td>Id</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
			<tr><td>pass</td><td><input type="password" name="pass"></td></tr>
			<tr><td>제목</td><td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td></tr>
			<tr><td>첨부파일</td>
				<td><input type="file" name="file"><%=boardDTO.getFile()%>
					<input type="hidden" name="oldfile" value="<%=boardDTO.getFile()%>"></td></tr>
			<tr><td>글 내용</td>
				<td><textarea name="content" rows="10" cols="40"><%=boardDTO.getContent()%></textarea></td></tr>
		</table>
		
		<div id="table_search">
			<input type="submit" value="글수정" class="btn">
			<input type="button" value="글목록" class="btn"
		   onclick="location.href='share.jsp'">
	</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control"></div>
</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>