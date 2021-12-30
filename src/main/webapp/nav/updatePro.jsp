<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro.jsp</title>

</head>
<body>
<%
//파일업로드 처리
String uploadPath = request.getRealPath("/upload");
int maxSize=10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//request 파라미터로 가져오기
int num = Integer.parseInt(multi.getParameter("num"));
String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String file = multi.getFilesystemName("file");
//첨부파일 없는 경우 - 기존파일의 이름을 가져와서 저장한다
if(file==null){
    file = multi.getParameter("oldfile");
}

//수정이 되어야할 정보를 BoardDTO에 저장함
BoardDTO boardDTO = new BoardDTO();
boardDTO.setNum(num);
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setFile(file);

//BoardDAO객체생성
BoardDAO boardDAO = new BoardDAO();
//BoardDAO의 메서드 정의 
	//1. BoardDTO numCheck(int num,String pass): 글을 수정하기 이전에 글 작성자를 확인하는 절차.
	BoardDTO dtoChecked = boardDAO.numCheck(num, pass);
	if(dtoChecked!=null){
	    //updateBoard()메서드 호출하여 업데이트 실행
	    boardDAO.fileUpdateBoard(boardDTO);
	    response.sendRedirect("share.jsp");
	} else{ //null, 뒤로이동함.
%><script type="text/javascript">
	   	alert("입력하신 정보를 확인하세요.");
	   	history.back();
	   </script>
	<%}
	%>
</body>
</html>