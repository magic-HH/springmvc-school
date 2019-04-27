<%@page import="com.hh.util.Sql_tool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>

<!-- JAVA 代码 -->
<%
    Statement stmt = Sql_tool.getCon().createStatement();
    String id = request.getParameter("id");
    stmt.executeUpdate("DELETE FROM book where id = " + id);
    response.sendRedirect("../back/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>hh`s title</title>
</head>
<body>
<h1>删除成功</h1>
</body>
</html>