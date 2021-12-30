<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro.jsp</title>
</head>
<body>
<%//회원탈퇴를 하기 위하여 id,pass 입력하고 제출하면 넘어가는 사이트. 
// checkMember(id,pass)메서드 호출하여 입력값이 db에 있는지 확인 후 deleteMember메서드 사용하여 회원정보 삭제
// ? - 달력과 투두리스트 등 다른 카테고리에 있는 모든 데이터들도 같이 삭제는 어떻게 하나?

request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDAO memberDAO = new MemberDAO();
MemberDTO dtoChecked = memberDAO.checkMember(id, pass);
if(dtoChecked==null){
    %><script type="text/javascript">
    alert("아이디와 비밀번호를 확인해주세요");
    history.back();
    </script><%
}else{//id,pass 일치하는 경우 deleteMember() 메서드 실행하고 알림창 띄움
    memberDAO.deleteMember(dtoChecked);
    session.invalidate();%>
    <script type="text/javascript">
    alert("회원탈퇴가 완료되었습니다.");
    location.href="../nav/main.jsp"
    </script>
    <%
}


%>
</body>
</html>