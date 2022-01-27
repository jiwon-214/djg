<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %> 
<%@ page import = "java.io.PrintWriter" %> <%--자바 스크립트 문장 작성 위해 사용 --%>
<% request.setCharacterEncoding("UTF-8"); %> <%--건너오는 모든 데이터를 UTF-8으로 받을수있도록 --%>
<jsp:useBean id="board" class="board.Board" scope="page" /> <%--현재의 페이지에서만 빈즈 사용 --%>
<jsp:setProperty name="board" property="boardTitle" /> <%--로그인 페이지에서 넘겨준 userID를 받아서 넣어줌--%>
<jsp:setProperty name="board" property="boardContent" />


<%-- 넘어온 userID와 Password가 담기게된다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대장금</title>
</head>
<body>
	<%
	//로그인 한 아이디는 로그인, 회원가입 페이지 접근하지 못하도록
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //세션아이디 담을 수 있도록
		}
		if (userID == null) { //이미 로그인이 된 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다!')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		else {
			if (board.getBoardTitle() == null || board.getBoardContent() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()"); //이전의 페이지로 돌려보내는 것
					script.println("</script>");
				}
					
			else {
					BoardDAO boardDAO = new BoardDAO(); 
					int result = boardDAO.write(board.getBoardTitle(), userID, board.getBoardContent()); //넘어온 아이디, 패스워드를 가지고 실행
					if (result == -1) { 
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('게시글 작성에 실패했습니다.')");
						script.println("history.back()"); //이전의 페이지로 돌려보내는 것
						script.println("</script>");
					}
				
					else { //글 작성 완료되면 바로 메인페이지로
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('게시글 작성이 완료되었습니다.')");
						script.println("location.href = 'board.jsp'");
						script.println("</script>");
					}
				}	
		}
		
	%>
</body>
</html>