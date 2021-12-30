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
<title>content.jsp</title>
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
			<li><a href="share.jsp">Public Board</a></li>
		</ul>
	</nav>
	
<%
//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();

//request 내장객체에서 num가져오기
int num = Integer.parseInt(request.getParameter("num"));

//updateReadcount() 메서드 호출하여 조회수 클릭시마다 증가시키기
boardDAO.updateReadcount(num);

//getBoard() 호출하여 클릭한 글에 해당하는 정보 가져오기
BoardDTO boardDTO = boardDAO.getBoard(num);

// 날짜 포맷 변경 => 문자열
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<article>
	<h1>게시판 </h1>
	<table id="notice">
		<tr><td>No.</td><td><%=boardDTO.getNum() %></td>
		    <td>Date</td><td><%=dateFormat.format(boardDTO.getDate()) %></td></tr>
		<tr><td>Id</td><td><%=boardDTO.getName() %></td>
		    <td>Views</td><td><%=boardDTO.getReadcount() %></td></tr>
		<tr><td>Title</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
		<tr><td>File</td>
			<td colspan="3">
				<%
				if(boardDTO.getFile() == null){%>
					<img src="../upload/<%=boardDTO.getFile()%>" alt=" 첨부파일 없음"><%		    
				}else{%>
				    <img src="../upload/<%=boardDTO.getFile()%>" width="300" height="150"><%
				}
				%>
			</td>
		</tr>
		
		<tr><td>Content</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
	</table>
	<div id="table_search">
	<%//로그인&글쓴이가 일치할때만 글수정, 삭제버튼 보이기
	String id = (String)session.getAttribute("id");	
	if(id!=null){
	    if(id.equals(boardDTO.getName())){
	%>	<input type="button" value="글 수정" class="btn" 
		   onclick="location.href='updateForm.jsp?num=<%=boardDTO.getNum()%>'">
		<input type="button" value="글 삭제" class="btn" 
	   onclick="location.href='deleteForm.jsp?num=<%=boardDTO.getNum()%>'">
	<%
	    }
	}
	%>
		<input type="button" value="글 목록" class="btn"
		   onclick="location.href='share.jsp'">
	</div>
	
	<div class="clear"></div>
	<div id="page_control"></div>
</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>