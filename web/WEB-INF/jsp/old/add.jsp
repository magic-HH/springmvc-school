<%@page import="com.hh.util.Sql_tool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>
<!-- JAVA 代码 -->
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
<% while (data_1.next()) {
    int id = data_1.getInt("id");
    double price = data_1.getDouble("price");
    String name = data_1.getString("name");
}%>
<div class="container">
    <form action="add_do">
        <div class="form-group">
            <lable for="name">书名:</lable>
            <input id="name" type="text" name="name" class="form-control">
        </div>
        <div class="form-group">
            <lable for="author">作者:</lable>
            <input id="author" type="text" name="author" class="form-control">
        </div>
        <div class="form-group">
            <lable for="price">价格:</lable>
            <input id="price" type="text" name="price" class="form-control">
        </div>
        <input class="btn btn-success" type="submit" vuale="添加 ">

    </form>
</div>
</body>
</html>