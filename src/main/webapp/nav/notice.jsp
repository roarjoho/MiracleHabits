<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
	<jsp:include page="../inc/top.jsp"></jsp:include>
	
	<div id="sub_img"></div>
	<!-- 메인이미지 -->
	
	<!-- 왼쪽메뉴 -->
	<nav id="sub_menu">
		<ul>
			<li><a href="notice.jsp">Notice</a></li>
			<li><a href="share.jsp">Public Board</a></li>
		</ul>
	</nav>

	<article>
		<h1>Notice Board</h1>
		<table id="notice">
			<tr><th class="tno">No.</th>
			    <th class="ttitle">Title</th>
			    <th class="twrite">작성자</th>
			    <th class="tdate">작성일</th>
			    <th class="tread">조회수</th></tr>
			
			<tr><td>7</td><td class="left">게시판 공지사항 7입니다.</td>
			    <td>관리자</td><td>2021.10.22</td><td>10</td></tr>
			<tr><td>6</td><td class="left">게시판 공지사항 6입니다.</td>
			    <td>관리자</td><td>2021.10.20</td><td>15</td></tr>
			<tr><td>5</td><td class="left">게시판 공지사항 5입니다.</td>
			    <td>관리자</td><td>2021.10.18</td><td>10</td></tr>
			<tr><td>4</td><td class="left">게시판 공지사항 4입니다.</td>
			    <td>관리자</td><td>2021.10.16</td><td>15</td></tr>
			<tr><td>3</td><td class="left">게시판 공지사항 3입니다.</td>
			    <td>관리자</td><td>2021.10.14</td><td>10</td></tr>
			<tr><td>2</td><td class="left">게시판 공지사항 2입니다.</td>
			    <td>관리자</td><td>2021.10.12</td><td>15</td></tr>
			<tr><td>1</td><td class="left">게시판 공지사항 1입니다.</td>
			    <td>관리자</td><td>2021.10.10</td><td>10</td></tr>      
		</table>
		
		<div id="table_search">
			<input type="text" name="search" class="input_box">
			<input type="button" value="search" class="btn">
		</div>
		
		<div class="clear"></div>
		
		<div id="page_control">
			<%
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null){
			    pageNum="1";
			}

			int currentPage = Integer.parseInt(pageNum);
			
			//한 페이지에 띄울 페이지 10개로 설정
			int pageBlock = 10;
			
			//시작 페이지 번호,끝나는 페이지 번호
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage = startPage+pageBlock-1;
			
//***수정필요! 공지사항데이터는 db에 생성하지 않으므로 전체 공지사항의 갯수를 7개로 하드코딩함.
			int count = 7;
			//전체 글 페이지 수 구하기
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage >  pageCount){
			//	끝나는페이지번호 =  전체글페이지수
				endPage=pageCount;
			}
			
			if(startPage > pageBlock){
				%>
				<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[Prev]</a>
				<%
			}
			for(int i=startPage;i<=endPage;i++){
				%>
				<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
				<%
			}
			if(endPage < pageCount){
				%>
				<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[Next]</a>
				<%
			}
			%>
		</div>
	</article>

	<div class="clear"></div>

	<jsp:include page="../inc/bottom.jsp"></jsp:include>

</div>
</body>
</html>