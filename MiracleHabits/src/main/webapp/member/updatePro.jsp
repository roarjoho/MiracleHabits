<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lifull updatePro.jsp</title>
</head>
<body>
<% // update 폼에서 수정할 회원정보 입력 후 제출버튼누르면 넘어오는 페이지.
//parameter로 값을 저장하여 memberDTO 데이터를 수정해야한다.
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String address_detail = request.getParameter("address_detail");
int postalNum = Integer.parseInt(request.getParameter("postalNum"));
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

//memberDAO.getMember() 호출하여 업데이트 수행
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.checkMember(id,pass);

if(memberDTO!=null){//아이디 일치 == not null == DTO객체를 새로이 생성하여 업데이트할 정보로 받은 데이터를 저장한다.
	MemberDTO dtoUpdated = new MemberDTO();
	dtoUpdated.setId(id);
	dtoUpdated.setPass(pass);
	dtoUpdated.setName(name);
	dtoUpdated.setEmail(email);
	dtoUpdated.setAddress(address);
	dtoUpdated.setAddress_detail(address_detail);
	dtoUpdated.setPostalNum(postalNum);
	dtoUpdated.setPhone(phone);
	dtoUpdated.setMobile(mobile);
    
	//updateMember() 메서드 호출하여 dtoUpdated에 저장된 데이터를 데이터베이스에도 적용한다.
	memberDAO.updateMember(dtoUpdated);%>
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
		location.href="../nav/main.jsp"
	</script>
	<%
} else{//아이디 불일치
%><script type="text/javascript">
		alert("입력하신 정보가 틀립니다.");
		history.back();
	</script><%
}

%>
</body>
</html>