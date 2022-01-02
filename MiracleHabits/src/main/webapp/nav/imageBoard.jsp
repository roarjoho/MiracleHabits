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
<title>이미지 게시판</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">


<jsp:include page="../inc/top.jsp"></jsp:include>
	<div id="sub_img"></div>
	<nav id="sub_menu">
		<ul>
			<li><a href="notice.jsp">Notice</a></li>
			<li><a href="share.jsp">게시판</a></li>
			<li><a href="imageBoard.jsp">사진 게시판</a></li>
		</ul>
	</nav>
	
	<%
	BoardDAO boardDAO = new BoardDAO();
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
	    pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = startRow + pageSize-1;
	
	List<BoardDTO> imageList = boardDAO.getImageList(startRow,pageSize);
	
	int count = boardDAO.getImageCount();
	
	
	
	%>
	<article>
	<h1>사진 게시판</h1>
	<h3>Total: [<%=count %>]</h3>
	
	
	
	
	</article>
	
	
</div>



</body>
</html>