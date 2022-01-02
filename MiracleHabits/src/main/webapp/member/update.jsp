<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<%
//세션값을 활용하여 데이터베이스에서 자기 정보를 조회한다.
String id = (String)session.getAttribute("id");
String pass= (String)session.getAttribute("pass");
//로그인되지 않은 상황에서 페이지에 접근할 시 로그인페이지로 이동시킨다.
if(id==null && pass==null){
%>
    <script type="text/javascript">
    	alert("로그인이 필요한 작업입니다.");
    	location.href="login.jsp";
    </script>
<%
}else{
%>
</head>

<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
	<ul>
		<li><a href="update.jsp">Update Information</a></li>
		<li><a href="delete.jsp">Unregister Member</a></li>
		<li><a href="servicePolicy.jsp">Service Policy</a></li>
	</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<%
//MemberDTO getMember()메서드 호출 - 회원정보 수정 폼에 먼저 띄운상태로 만든다.
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(id);
%>

<h1>Update Information</h1>
<form action="updatePro.jsp" id="join" method="post">
	<fieldset>
		<legend>Basic Information</legend>
		
		<label>User ID</label>
		<input type="text" name="id" class="id" value="<%=id %>" readonly><br>
				
		<label>Password</label>
		<input type="password" name="pass" value="<%=memberDTO.getPass() %>" readonly><br>
				
		<label>Name</label>
		<input type="text" name="name" value="<%=memberDTO.getName() %>" ><br>
		
		<label>E-Mail</label>
		<input type="email" name="email" value="<%=memberDTO.getEmail() %>"><br>
	</fieldset>
	
	<fieldset>
		<legend>Optional Information</legend>
		
		<label>Postal Number</label>
		<input type="text" name="postalNum" id="postalNum" value="<%=memberDTO.getPostalNum() %>"   readonly>
		<input type="button" placeholder="우편번호 검색" value="우편번호 검색" class="dup" onclick="search()"><br>
		
		<label>Address</label>
		<input type="text" name="address" id="address" value="<%=memberDTO.getAddress() %>" readonly>
		<input type="text" name="address_detail" id="address_detail" value="<%=memberDTO.getAddress_detail() %>"><br>
		
		<label>Phone Number</label>
		<input type="text" name="phone" value="<%=memberDTO.getPhone() %>"><br>
		
		<label>Mobile Phone Number</label>
		<input type="text" name="mobile" value="<%=memberDTO.getMobile()%>"><br>
	</fieldset>
	
	<div class="clear"></div>
	
	<div id="buttons">
		<input type="submit" value="Submit" class="submit">
		<input type="reset" value="Cancel" class="cancel">
	</div>
</form>
</article>

<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
<%} %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
       function search(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address_detail").value = extraAddr;
                
                } else {
                    document.getElementById("address_detail").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postalNum').value = data.zonecode;
                document.getElementById('address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address_detail').focus();
            }
        }).open();
 }
</script>
</body>
</html>