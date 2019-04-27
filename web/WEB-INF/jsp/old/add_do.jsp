<%@page import="com.hh.util.Sql_tool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>

<!-- JAVA 代码 -->
<%
    Statement stmt = Sql_tool.getCon().createStatement();
//ResultSet data_1 =  stmt.executeQuery("select * from u_f");
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String price = request.getParameter("price");
    stmt.executeUpdate("insert into book set name='" + name + "', author='" + author + "',price=" + price);
    response.sendRedirect("../u_f/index");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>hh`s title</title>
</head>
<body>
<h1>添加成功</h1>
</body>
</html>