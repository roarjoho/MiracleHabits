<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinPro.jsp</title>
</head>
<body>
<%
//회원가입창에서 submit버튼 클릭시 넘어오는 페이지.
request.setCharacterEncoding("utf-8");

//1. join.jsp파일에서 입력내용을 전달받아서 변수에 저장하기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String address_detail = request.getParameter("address_detail");
int postalNum = Integer.parseInt(request.getParameter("postalNum"));
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");
Timestamp date = new Timestamp(System.currentTimeMillis());

//2. memberDTO에 전달하여 저장하기
MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
memberDTO.setEmail(email);
memberDTO.setAddress(address);
memberDTO.setAddress_detail(address_detail);
memberDTO.setPostalNum(postalNum);
memberDTO.setPhone(phone);
memberDTO.setMobile(mobile);
memberDTO.setDate(date);

//3. memberDAO메서드 insertMember() 호출하여 데이터베이스에 회원정보 저장하기
MemberDAO memberDAO = new MemberDAO();
memberDAO.insertMember(memberDTO);
%>
<script type="text/javascript">
	alert("회원가입이 완료되었습니다.");
	location.href="login.jsp";
</script>
</body>
</html>