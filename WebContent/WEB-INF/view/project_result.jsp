<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"      %>
<%@ page import="model.UserInfoDto"      %>
<%@ page import="model.ProjectInfoDto"      %>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：project_menu.jsp■■■
概要：JSP
詳細：HTML文書（検索結果一覧画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
//セッションからユーザーデータを取得
UserInfoDto userInfoOnSession = (UserInfoDto)session.getAttribute("LOGIN_INFO");
String UserName  = userInfoOnSession.getUserName();
String UserId  = userInfoOnSession.getUserId();
//リクエストからプロジェクトデータを取得
List<ProjectInfoDto> list = (List<ProjectInfoDto>)request.getAttribute("PROJECT_LIST");
String menu_id = (String)request.getAttribute("MENU_ID");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
</head>
<body>
<h1>検索結果一覧画面</h1>

  <p><%= UserName %>さん　ようこそ
      <input type="hidden" name="UserName"  value="<%= UserName %>">
  </p>


  <% String LINK_URL = "";%>
  <% switch (menu_id) {
	case "1":
		break;
	case "999":
		//SLINK_URL = "InputAddParticipation";
		break;
	case "2":
		LINK_URL = "InputParticipation";
		break;
	case "3":
		LINK_URL = "InputParticipationStatus";
		break;
	} %>

	<%
	for(int i = 0; i < list.size(); i++) {
		ProjectInfoDto dto = list.get(i);
	%>
	 <a href = <%=LINK_URL%>?PRO_ID=<%=dto.getProjectId()%>&PRO_NAME=<%=dto.getProjectName()%>&ORI_ID=<%=dto.getOriginatorId()%>><%=dto.getProjectId()%> <%=dto.getProjectName() %></a>
	 <br>
	<%
	}
	%>

<%--forwardで遷移する
	<% request.setAttribute("test", "testtest"); %>
	<jsp:forward page="/InputAddParticipation">
	  <jsp:param name="pram" value="forward_testforward_testforward_testforward_test" />
	</jsp:forward>
--%>

	<p>
	<input type="hidden" name="UserId"  value="<%=UserId %>">
	</p>

	<%
	String msg = "";
	if(list.size()==0){
		msg = "案件が検索できません";
	}
	%>

	<p><%=msg%></p>
  <br>
  <a href="InputSelectProject">プロジェクト検索画面へ</a>
  <a href="InputLoginMenu">ログインメニュー画面へ</a>

</body>
</html>