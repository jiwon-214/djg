/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.11
 * Generated at: 2022-01-11 23:18:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import user.UserDAO;
import user.User;
import java.io.PrintWriter;
import java.sql.*;

public final class withdraw_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("user.User");
    _jspx_imports_classes.add("user.UserDAO");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name = \"viewport\" content = \"width=divice-width\", initial-scale = \"1\">\r\n");
      out.write("<link rel = \"stylesheet\" href = \"css/bootstrap.css\">\r\n");
      out.write("<link rel = \"stylesheet\" href = \"css/custom.css\">\r\n");
      out.write("<title>대장금</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

		//로그인 된 사람 정보 담을 수 있도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인되면 userID에 해당 이이디가 담기고 로그인 안되면 null
	
      out.write("\r\n");
      out.write("	<nav class =\"navbar navbar-default\">\r\n");
      out.write("		<div class = \"navbar-header\">\r\n");
      out.write("			<button type = \"button\" class = \"navbar-toggle collapsed\"\r\n");
      out.write("				data-toggle = \"collapse\" data-target = \"#bs-example-navbar-collapse-1\"\r\n");
      out.write("				aria-expanded=\"false\">\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("				<span class = \"icon-bar\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<a class=\"navbar-brand\" href = \"main.jsp\">대학생 장학금 찾아주기 : 대장금</a>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("			<ul class = \"nav navbar-nav\">\r\n");
      out.write("				<li class=\"active\"><a href=\"main.jsp\">대장금</a></li>\r\n");
      out.write("				<li><a href=\"djg.jsp\">장학금 찾기</a></li>\r\n");
      out.write("				<li><a href=\"https://portal.sungshin.ac.kr/sso/login.jsp\">성신여대</a></li>\r\n");
      out.write("				<li><a href=\"http://www.kosaf.go.kr/\">한국장학재단</a></li>\r\n");
      out.write("				<li><a href=\"https://rule.sungshin.ac.kr/service/law/lawView.do?seq=95&historySeq=0&gubun=cur&tree=part\">성신장학규정</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("			<li class=\"dropdown\">\r\n");
      out.write("				<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("					data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\"\r\n");
      out.write("					aria-expanded=\"false\">회원관리<span class=\"caret\"></span></a>\r\n");
      out.write("				<ul class=\"dropdown-menu\">\r\n");
      out.write("					<li><a href = \"info.jsp\">정보 확인</a></li>\r\n");
      out.write("					<li><a href = \"modification.jsp\">정보 수정</a></li>\r\n");
      out.write("					<li><a href = \"logoutAction.jsp\">로그아웃 </a></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</li>\r\n");
      out.write("			</ul>\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("      <div class=\"col-lg-4\"></div>\r\n");
      out.write("      <div class=\"col-lg-4\">\r\n");
      out.write("         <div class=\"jumbotron\" style=\"padding-top:20px;\">\r\n");
      out.write("            <form method=\"post\" action=\"withdrawAction.jsp\" onSubmit = \"return checkpw()\">\r\n");
      out.write("				<h3 style = \"text-align:center;\">회원 탈퇴</h3>\r\n");
      out.write("				<h4 style = \"text-align:center;\">탈퇴를 진행하시려면 <br> 비밀번호를 입력해주세요</h4>\r\n");
      out.write("				\r\n");
      out.write("               <div class=\"form-group\">\r\n");
      out.write("                  <input type=\"password\" class=\"form-control\" placeholder=\"비밀번호\" name=\"userPassword\" id=\"userPassword\" maxlength=\"20\" onchange=\"password()\">\r\n");
      out.write("               </div>\r\n");
      out.write("               <div class=\"form-group\">\r\n");
      out.write("                  <input type=\"password\" class=\"form-control\" placeholder=\"비밀번호 확인\" name=\"userPassword\" id=\"userPassword_again\" maxlength=\"20\" onchange=\"password()\">\r\n");
      out.write("               	  &nbsp;\r\n");
      out.write("               <span id=\"check\"></span>\r\n");
      out.write("               </div>           \r\n");
      out.write("               <input type=\"submit\" class=\"btn btn-primary form-control\" value=\"탈퇴하기\">\r\n");
      out.write("               <input type=\"button\" class=\"btn btn-primary form-control\" value=\"취소하기\" onClick=\"location.href='main.jsp'\">\r\n");
      out.write("            </form>\r\n");
      out.write("         </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"col-lg-4\"></div>\r\n");
      out.write("   </div>\r\n");
      out.write("		<div class=\"col-lg-4\"></div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<script>\r\n");
      out.write("	function password() {\r\n");
      out.write("    	var pw = document.getElementById('userPassword').value;\r\n");
      out.write("    	var pw2 = document.getElementById('userPassword_again').value;\r\n");
      out.write("    	\r\n");
      out.write("    	if(pw != pw2) {\r\n");
      out.write("    		document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';\r\n");
      out.write("    		document.getElementById('check').style.color = 'red';\r\n");
      out.write("    	} else {\r\n");
      out.write("    		document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';\r\n");
      out.write("    		document.getElementById('check').style.color = 'blue';\r\n");
      out.write("    	}\r\n");
      out.write("    }\r\n");
      out.write("	\r\n");
      out.write("	function checkpw() {\r\n");
      out.write("		if(document.getElementById('userPassword').value != document.getElementById('userPassword_again').value) {\r\n");
      out.write("			alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("	}\r\n");
      out.write("	</script>\r\n");
      out.write("	<script src = \"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("	<script src = \"js/bootstrap.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
