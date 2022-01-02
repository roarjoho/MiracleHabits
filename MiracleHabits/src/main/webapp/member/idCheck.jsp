<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function ok() {
		//idCheck.jsp에서 결정한 사용할 최종아이디를 join.jsp의 아이디란에 넣음 (join.jsp는 opener임)
		var uId = $("input[id='uId']");
		opener.document.getElementById("uId").value = uId.val();
		//창을  닫음
		window.close();
	}

</script>
</head>
<body>
<%
String uId = request.getParameter("uId");
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(uId);

if(memberDTO!=null){//아이디 있음 == uId사용불가
    %>이미 사용중인 아이디입니다.<%
}else{//아이디 없음 == uId 사용가능.
    %>사용가능한 아이디입니다. <input type="button" value="아이디 사용하기" onclick="ok()"><br><%
}
%>
<form action="idCheck.jsp" method="get">
	아이디: <input type="text" name="id" id="uId" value="<%=uId%>">
	<input type="submit" value="중복확인">
</form>
</body>
</html>