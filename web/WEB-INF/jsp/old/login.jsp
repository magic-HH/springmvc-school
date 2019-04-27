<%@page import="com.hh.util.Sql_tool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>
<%
    Statement stmt = Sql_tool.getCon().createStatement();
    ResultSet data_1 = stmt.executeQuery("select * from book");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap3/css/bootstrap.css">
    <title>hh`s title</title>
</head>
<body>
<link rel="stylesheet" href="/first_java_web/css/bootstrap3/css/bootstrap.css">
<script src="/first_java_web/js/jquery-3.3.1.js"></script>
<script src="/first_java_web/css/bootstrap3/js/bootstrap.js"></script>
<% while (data_1.next()) {
    int id = data_1.getInt("id");
    double price = data_1.getDouble("price");
    String name = data_1.getString("name");
}%>
<div class="container">
    <div style="text-align: center">
    <img src="img/test_img.jpg" width="80" style="border-radius: 50%;">
    </div>
    <form action="do_login.jsp">
        <div class="form-group">
            <lable for="name">用户名:</lable>
            <input id="name" type="text" name="name" class="form-control">
        </div>
        <div class="form-group">
            <lable for="password">密码:</lable>
            <input id="password" type="password" name="password" class="form-control">
        </div>
        <input class="btn btn-success" type="submit" vuale="登录">

    </form>
</div>
</body>
</html>