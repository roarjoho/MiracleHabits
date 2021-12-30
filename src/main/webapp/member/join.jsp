<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Miracle Habits</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function checkId() {
		var uId = $("input[id='uId']");
		if(uId.val()==""){
			alert("아이디를 입력해주세요.");
			uId.focus();
			return false;
		}
		//아이디를 db에서 비교하는 작업을 수행하기 위한 창을 띄운다.
		window.open("idCheck.jsp?uId="+uId.val(),"아이디 중복확인","width=300, height=150");
	}

	//<input type="button" value="중복확인" class="dup"> 클릭시, 문서가 실행되면 동작시키기
	$(document).ready(function(){
		$('.dup').click(function () {
			//'중복확인'버튼 클릭 -> idCheck2.jsp로 이동(아이디를 들고 감) -> 아이디 중복체크 
			$.ajax('idCheck2.jsp',{
				data:{uId:$('#uId').val()},
				success:function(rdata){
					$("#dupdiv").html(rdata);
				}
			});
		});
	});
	
</script>
</head>

<body>
<div id="wrap">

	<jsp:include page="../inc/top.jsp"></jsp:include>
	
	<div id="sub_img_member"></div>
	
	<nav id="sub_menu">
		<ul>
			<li><a href="#">Join us</a></li>
			<li><a href="#">Privacy policy</a></li>
		</ul>
	</nav>
	
	<article>
		<h1>Join Us</h1>
		<form action="joinPro.jsp" id="join" method="post">
			<fieldset>
				<legend>Basic Information</legend>
				
				<label>User ID</label>
				<input type="text" name="id" id="uId" class="uId">
				<!--<input type="button" value="중복확인" class="dup" onclick="checkId()"><br> -->
				<input type="button" value="중복확인" class="dup"><br>
				<div id="dupdiv"></div><br>
				
				<label>Password</label>
				<input type="password" name="pass"><br>
				<label>Retype Password</label>
				<input type="password" name="pass2"><br>
				
				<label>Name</label>
				<input type="text" name="name"><br>
				
				<label>E-Mail</label>
				<input type="email" name="email"><br>
				<label>Retype E-Mail</label>
				<input type="email" name="email2"><br>
			</fieldset>
			
			<fieldset>
				<legend>Optional Information</legend>
				
				<label>Postal Number</label>
				<input type="text" name="postalNum" id="postalNum" placeholder="우편번호" readonly>
				<input type="button" placeholder="우편번호 검색" value="우편번호 검색" class="dup" onclick="search()"><br>
				
				<label>Address</label>
				<input type="text" name="address" id="address" placeholder="주소" readonly>
				<input type="text" name="address_detail" id="address_detail" placeholder="상세주소"><br>
						
				<label>Phone Number</label>
				<input type="text" name="phone"><br>
				
				<label>Mobile Phone Number</label>
				<input type="text" name="mobile"><br>
			</fieldset>
			
			<div class="clear"></div>
			
			<div id="buttons">
				<input type="submit" value="Submit" class="submit">
				<input type="reset" value="Cancel" class="cancel">
			</div>
		</form>
	</article>
	
	<div class="clear"></div>
	<jsp:include page="../inc/bottom.jsp"></jsp:include>

</div>

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