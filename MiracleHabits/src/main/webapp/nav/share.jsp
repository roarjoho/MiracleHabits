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
<title>share.jsp</title>
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
//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();

//한 화면에 띄울 글 갯수 10개
int pageSize = 10;
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
    pageNum="1";
}

//시작, 끝나는 행번호 구하기
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize+1;
int endRow = startRow+pageSize-1;

//게시판 목록을 불러오는 getBoardList()메서드 호출
List<BoardDTO> boardList = boardDAO.getBoardList(startRow,pageSize);

//getBoardCount()호출하여 게시판 전체 글의 갯수 세기
int count = boardDAO.getBoardCount();
%>
	<article>
	<h1>일반 게시판</h1>
	<h3>Total: [<%=count %>]</h3>
	
	<table id="notice">
		<tr><th class="tno">No.</th>
		    <th class="ttitle">Title</th>
		    <th class="twrite">Id</th>
		    <th class="tdate">Date</th>
		    <th class="tread">Views</th></tr>
<%
    // 날짜 포맷 변경 => 문자열
    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
    
    for(int i=0;i<boardList.size();i++){
    	BoardDTO boardDTO=boardList.get(i);
   	%>
		<tr onclick="location.href='content.jsp?num=<%=boardDTO.getNum()%>'">
			<td><%=boardDTO.getNum() %></td>
		    <td class="left"><%=boardDTO.getSubject() %></td>
		    <td><%=boardDTO.getName() %></td>
		    <td><%=dateFormat.format(boardDTO.getDate()) %></td>
		    <td><%=boardDTO.getReadcount() %></td>
		</tr>    	
   	<%
    }
    %></table>
<%
//로그인함 == 세션값 있음 -> 글쓰기버튼 보임
String id = (String)session.getAttribute("id");
if(id!=null){%>
	<div id="table_search">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='writeForm.jsp'">
	</div>	
<%}%>

	<div id="table_search">
		<form action="shareSearch.jsp" method="get">
			<input type="text" name="search" class="input_box">
			<input type="submit" value="search" class="btn">
		</form>
	</div>

	<div class="clear"></div>	
		
	<div id="page_control">
			<%
			//한 페이지에 띄울 페이지 10개로 설정
			int pageBlock = 10;
			
			//시작 페이지 번호,끝나는 페이지 번호
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage = startPage+pageBlock-1;
			
			//전체 글 페이지 수 구하기
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage >  pageCount){
			//	끝나는페이지번호 =  전체글페이지수
				endPage=pageCount;
			}
			
			if(startPage > pageBlock){
				%>
				<a href="share.jsp?pageNum=<%=startPage-pageBlock%>">[Prev]</a>
				<%
			}
			for(int i=startPage;i<=endPage;i++){
				%>
				<a href="share.jsp?pageNum=<%=i%>"><%=i %></a>
				<%
			}
			if(endPage < pageCount){
				%>
				<a href="share.jsp?pageNum=<%=startPage+pageBlock%>">[Next]</a>
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