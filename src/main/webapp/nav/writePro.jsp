<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writePro.jsp</title>
</head>
<body>
<%
//파일업로드 처리
String uploadPath = request.getRealPath("/upload");
int maxSize=10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// 업로드한 multi파라미터 값 가져오기 id pass subject content
	String name=multi.getParameter("name");
	String pass=multi.getParameter("pass");
	String subject=multi.getParameter("subject");
	String content=multi.getParameter("content");
	//upload폴더에 올라간 첨부파일의 이름
	String file = multi.getFilesystemName("file");
	// 조회수와 날짜설정(시스템 날짜 가져오기)
	int readcount=0;
	Timestamp date=new Timestamp(System.currentTimeMillis());

//BoardDAO,BoardDTO 객체생성, 
	BoardDAO boardDAO = new BoardDAO();
	BoardDTO boardDTO = new BoardDTO();
	
//Set메서드 호출 -> writeForm에서 가져온 파라미터 값을 데이터바구니에 저장하기
	boardDTO.setName(name);
	boardDTO.setPass(pass);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	boardDTO.setReadcount(readcount); 
	boardDTO.setDate(date); 
	boardDTO.setFile(file); 
//insertBoard() 호출
	boardDAO.insertBoard(boardDTO);

// 글목록 이동
response.sendRedirect("share.jsp");
%>
</body>
</html>


