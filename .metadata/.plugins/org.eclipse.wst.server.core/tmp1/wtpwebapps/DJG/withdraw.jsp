<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=divice-width", initial-scale = "1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>대장금</title>
</head>
<body>
	<%
		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
	%>
	<nav class ="navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class="navbar-brand" href = "main.jsp">대학생 장학금 찾아주기 : 대장금</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li class="active"><a href="main.jsp">대장금</a></li>
				<li><a href="djg.jsp">장학금 찾기</a></li>
				<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp">성신여대</a></li>
				<li><a href="http://www.kosaf.go.kr/">한국장학재단</a></li>
				<li><a href="https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part">성신장학규정</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href = "info.jsp">정보 확인</a></li>
					<li><a href = "modification.jsp">정보 수정</a></li>
					<li><a href = "logoutAction.jsp">로그아웃 </a></li>
				</ul>
			</li>
			</ul>
		</div>
	</nav>
	<div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top:20px;">
            <form method="post" action="withdrawAction.jsp" onSubmit = "return checkpw()">
				<h3 style = "text-align:center;">회원 탈퇴</h3>
				<h4 style = "text-align:center;">탈퇴를 진행하시려면 <br> 비밀번호를 입력해주세요</h4>
				
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" id="userPassword" maxlength="20" onchange="password()">
               </div>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호 확인" name="userPassword" id="userPassword_again" maxlength="20" onchange="password()">
               	  &nbsp;
               <span id="check"></span>
               </div>           
               <input type="submit" class="btn btn-primary form-control" value="탈퇴하기">
               <input type="button" class="btn btn-primary form-control" value="취소하기" onClick="location.href='main.jsp'">
            </form>
         </div>
      </div>
      <div class="col-lg-4"></div>
   </div>
		<div class="col-lg-4"></div>
	</div>
	<script>
	function password() {
    	var pw = document.getElementById('userPassword').value;
    	var pw2 = document.getElementById('userPassword_again').value;
    	
    	if(pw != pw2) {
    		document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
    		document.getElementById('check').style.color = 'red';
    	} else {
    		document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';
    		document.getElementById('check').style.color = 'blue';
    	}
    }
	
	function checkpw() {
		if(document.getElementById('userPassword').value != document.getElementById('userPassword_again').value) {
			alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
			return false;
		}
	}
	</script>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>