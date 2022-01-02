<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>

<%
//로그인 성공 == 세션이 할당되어있음
String id = (String)session.getAttribute("id");

if(id==null){//세션값 null -> 로그인 안된 상태
	%><div id="login"><a href="../member/login.jsp">Login</a> | <a href="../member/join.jsp">Join</a></div><%
} else{//세션값=!null -> 로그인 한 상태
	%><div id="login"><%=id%>님 | <a href="../member/logout.jsp">Logout</a> | <a href="../member/myPage.jsp">My Page</a></div><%
}%>
<div class="clear"></div>

<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.png" width="160px" alt="Miracle Habits"></div>
<!-- 로고들어가는 곳 -->
  
<nav id="top_menu">
	<ul>
		<li><a href="../index.html">MAIN</a></li>
		<li><a href="../nav/plan.jsp">PLAN</a></li>
		<li><a href="../nav/life.jsp">LIFE</a></li>
		<li><a href="../nav/share.jsp">SHARE</a></li>
		<li><a href="../nav/about.jsp">ABOUT</a></li>
	
	</ul>
</nav>
</header>