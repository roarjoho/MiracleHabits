<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro.jsp</title>
</head>

<body>
<%
//request num pass 파라미터 가저오기
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

//BoardDAO객체생성
BoardDAO boardDAO = new BoardDAO();
//numCheck(int num,String pass): 글을 삭제하기 이전에 글 작성자를 확인하는 절차.
BoardDTO dtoChecked = boardDAO.numCheck(num,pass);

if(dtoChecked!=null){//deleteBoard()메서드 호출하여 삭제실행
    boardDAO.deleteBoard(num);
%><script type="text/javascript">
   	alert("글 삭제가 완료되었습니다.");
   	location.href="share.jsp";
   </script>
<% }else { //null, 뒤로이동함.
%><script type="text/javascript">
   	alert("입력하신 정보를 확인하세요.");
   	history.back();
   </script>
<%}%>
</body>
</html>