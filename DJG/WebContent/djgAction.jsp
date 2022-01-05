<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %> <%--UserDAO를 가져와줌 --%>
<%@ page import = "java.io.PrintWriter" %> <%--자바 스크립트 문장 작성 위해 사용 --%>
<% request.setCharacterEncoding("UTF-8"); %> <%--건너오는 모든 데이터를 UTF-8으로 받을수있도록 --%>
<jsp:useBean id="user" class="user.User" scope="page" /> <%--현재의 페이지에서만 빈즈 사용 --%>
<jsp:setProperty name="user" property="userID" /> <%--로그인 페이지에서 넘겨준 userID를 받아서 넣어줌--%>
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" /> 
<jsp:setProperty name="user" property="userMajor" />
<jsp:setProperty name="user" property="userYear" /> 
<jsp:setProperty name="user" property="userGrade" />
<jsp:setProperty name="user" property="userLgrade" /> 
<jsp:setProperty name="user" property="userMchild" />
<jsp:setProperty name="user" property="userIncome" /> 
<jsp:setProperty name="user" property="userVol" />
<jsp:setProperty name="user" property="userMentor" /> 
<jsp:setProperty name="user" property="userExam" />


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
		if (userID != null) { //이미 로그인이 된 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserMajor() == null || user.getUserYear() == null || user.getUserGrade() == null
			|| user.getUserLgrade() ==  null || user.getUserMchild() == null || user.getUserIncome() == null
			|| user.getUserVol() == null || user.getUserMentor() == null || user.getUserExam() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //이전의 페이지(로그인)로 돌려보내는 것
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO(); 
			int result = userDAO.join(user); //넘어온 아이디, 패스워드를 가지고 실행
			if (result == -1) { //동일한 학번 입력하면 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 학번입니다.')");
				script.println("history.back()"); //이전의 페이지(로그인)로 돌려보내는 것
				script.println("</script>");
			}
		
			else { //회원가입 되면 바로 메인페이지로
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>