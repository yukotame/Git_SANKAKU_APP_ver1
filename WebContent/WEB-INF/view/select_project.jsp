<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
//リクエストからユーザーデータを取得
String menu_id = (String)request.getAttribute("MENU_ID");

%>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：select_project.jsp■■■
概要：JSP
詳細：HTML文書（プロジェクト検索画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<html>
<head>
  <title>プロジェクト検索画面</title>
</head>
<body>
 <h1>プロジェクト検索画面</h1>



  <form action="InputProjectMenu" method="get">
  	<input type="hidden" name="MENU_ID" value =<%=menu_id %>>
    <p>プロジェクトID：<br>
      <input type="text" name="PROJECT_ID" maxlength="20" id="ID_PROJECT_ID">
    </p>

    <input type="submit" value="検索" id="ID_SERCH">
  </form>
  <br>
  <a href="InputLoginMenu">ログインメニュー画面へ</a>
  <script type="text/javascript" src="js/select-menu-check.js"></script>
</body>
</html>
