<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<body>
<%// 로그인버튼 누르고 전달되는 페이지. 입력한 id,pass를 db에서 검사해야함.
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");

//memberDAO.checkMember메서드 호출하여 db에서 검사하기.
MemberDAO memberDAO = new MemberDAO();
MemberDTO dtoChecked = memberDAO.checkMember(id, pass);
if(dtoChecked!=null){//저장된 값이 있다면
    session.setAttribute("id", id);
    %>  <script type="text/javascript">
    	alert("로그인되었습니다");
    	location.href="../nav/main.jsp";
    	</script><%
    } else{//id,pass가 일치하지 않아 null을 리턴받음 %>
        <script type="text/javascript">
        	alert("로그인정보가 일치하지 않습니다.");
        	history.back();
        </script>
    <%}%>

</body>
</html>