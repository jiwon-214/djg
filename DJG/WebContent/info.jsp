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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
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
				<li><a href="main.jsp">대장금</a></li>
				<li class="active"><a href="djg.jsp">장학금 찾기</a></li>
				<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp">성신여대</a></li>
				<li><a href="http://www.kosaf.go.kr/">한국장학재단</a></li>
				<li><a href="https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part">성신장학규정</a></li>
			</ul>
			<%	
				if(userID != null) {
			%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href = "modification.jsp">정보수정</a></li>
						<li><a href = "info.jsp">정보 확인</a></li>
						<li><a href = "logoutAction.jsp">로그아웃 </a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
		
		<div class="container">
		<div class="row">
			<table class="table table-striped"	style="text-align: center; border : 1px solid #dddddd">
				<%		
					UserDAO userDAO = new UserDAO();
					User user = new User();
					user = userDAO.djg(userID);
				%>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;"><%user.getUserName(); %>님의 정보 </th>
					</tr>
				</thead>
						
					
				<tbody>
				<th style="background-color: #eeeeee; text-align:center;">학번 </th>
						<td><%out.println(user.getUserID()); %></td>
						<th style="background-color: #eeeeee; text-align:center;">이름 </th>
						<th style="background-color: #eeeeee; text-align:center;">학년 </th>
						<th style="background-color: #eeeeee; text-align:center;">학점 </th>
						<th style="background-color: #eeeeee; text-align:center;">어학점수 </th>
						<th style="background-color: #eeeeee; text-align:center;">다자녀</th>
						<th style="background-color: #eeeeee; text-align:center;">소득분위 </th>
						<th style="background-color: #eeeeee; text-align:center;">봉사 </th>
						<th style="background-color: #eeeeee; text-align:center;">멘토링 </th>
						<th style="background-color: #eeeeee; text-align:center;">국가고시 </th>
					<tr>
						
						<td><%out.println(user.getUserName()); %></td>
						<td><%out.println(user.getUserYear()); %></td>
						<td><%out.println(user.getUserGrade()); %></td>
						<td><%out.println(user.getUserLgrade()); %></td>
						<td><%out.println(user.getUserMchild()); %></td>
						<td><%out.println(user.getUserIncome()); %></td>
						<td><%out.println(user.getUserVol()); %></td>
						<td><%out.println(user.getUserMentor()); %></td>
						<td><%out.println(user.getUserExam()); %></td>
				</tbody>
			</table>
		</div>
	</div>
		</p>
	</div>
</div>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>