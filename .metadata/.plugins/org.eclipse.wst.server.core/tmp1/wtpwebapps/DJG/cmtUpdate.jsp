<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.util.ArrayList" %>
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
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("<script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
		
		int commentID = 0;
		if(request.getParameter("commentID") != null) {
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		
		Comment comment = new CommentDAO().getComment(commentID);
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
				<li><a href="djg.jsp">장학금 찾기</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>
				<li><a href="https://portal.sungshin.ac.kr/sso/login.jsp">성신여대</a></li>
				<li><a href="http://www.kosaf.go.kr/">한국장학재단</a></li>
				<li><a href="https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part">성신장학규정</a></li>
			</ul>
			<%
				//로그인이 되어있지 않은 사람들의 화면
				if(userID == null) {
			%>	
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href = "login.jsp">로그인 </a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%	
				} else { //로그인 되어있는 사람들의 화면
			%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href = "modification.jsp">정보수정</a></li>
						<li><a href = "info.jsp">정보 확인</a></li>
						<li><a href = "logoutAction.jsp">로그아웃</a></li>
						<li><a href = "withdraw.jsp">탈퇴하기</a></li>
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">제목</td>
					<td colspan="2"><%=board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%=board.getUserID() %></td>
				</tr>
				<tr>
					<td>작성날짜</td>
					<td colspan="2"><%=board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시 " + board.getBoardDate().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="height: 200px; text-align: left;"><%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")  %></td>
				</tr>
			</tbody>
			</table>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td align="left">댓글</td>
						</tr>
						<tr>
						<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList(boardID);
							for (int i = 0; i < list.size(); i++) {
								if(list.get(i).getCommentID() == commentID) {
						%>
									<div class="container">
										<div class="form-group">
										<form method="post" action="cmtUpdateAction.jsp?boardID=<%=boardID %>&commentID=<%=commentID %>">
											<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd; border-radius: 20%;">
												<tr>
													<td style="border-bottom:none;" valign="middle"><br><br><%=userID %></td>
													<td><textarea class="form-control" maxlength="256" style="height: 100px; resize:none;" name="commentContent"><%=comment.getCommentContent() %></textarea></td>
													<td><br><br><input type="submit" class="btn btn-primary pull-center" value="수정 완료"></td>
												</tr>
											</table>
										</form>
										</div>
									</div>
						<%		
								} else {
						%>
						<div class="container">
							<div class="row">
								<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
									<tbody>
										<tr>
											<td align="left"><%=list.get(i).getUserID() %>&nbsp; &nbsp; &nbsp; &nbsp;<%= list.get(i).getCommentDate().substring(0, 11) + list.get(i).getCommentDate().substring(11, 13) + "시" + list.get(i).getCommentDate().substring(14, 16) + "분" %> </td>
											<td colspan="2"></td>
											<td align="right">
											<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)) {
											%>
													<a href="cmtUpdate.jsp?boardID=<%=boardID %>&commentID=<%=list.get(i).getCommentID() %>" class="btn btn-primary">수정</a>
													<a href="cmtDeleteAction.jsp?boardID=<%=boardID %>&commentID=<%=list.get(i).getCommentID() %>" class="btn btn-primary">삭제</a>
											<%
												}
											%>
										</tr>
										<tr>
											<td colspan="5" align="left"><%=list.get(i).getCommentContent() %></td>
										</tr>
									</tbody>
								</table>
							</div>	
						</div>
						<%
							}
						}
						%>
					</tbody>
					</table> 
				</div>
			</div>
			<div class="container">
			<a href="board.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(board.getUserID())) {
			%>
					<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-primary">수정하기</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-primary">삭제하기</a>
			<%
				}
			%>
			</div>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>