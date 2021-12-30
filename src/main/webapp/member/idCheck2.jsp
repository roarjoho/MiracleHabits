<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uId = request.getParameter("uId");
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(uId);

if(memberDTO!=null){//아이디 있음 == uId사용불가
    %>이미 사용중인 아이디입니다.<%
}else{//아이디 없음 == uId 사용가능.
    %>사용가능한 아이디입니다.<br><%
}
%>
</body>
</html>