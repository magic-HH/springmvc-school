<%@page import="com.hh.util.Sql_tool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>
<!-- JAVA 代码 -->
<%
    Statement stmt = Sql_tool.getCon().createStatement();
    String id = request.getParameter("id");
    ResultSet data_1 = stmt.executeQuery("select * from book where id = " + id);
    data_1.next();
    double price = data_1.getDouble("price");
    String name = data_1.getString("name");
    String author = data_1.getString("author");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap3/css/bootstrap.css">
    <title>hh`s title</title>
</head>
<body>
<div class="container">
    <table class="table table-bordered table-hover">
        <form action="change_do">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="form-group">
                <tr>
                    <td>book:<input type="text" name="name" value="<%= name%>" class="form-control"></td>
                </tr>
            </div>
            <div class="form-group">
                <tr>
                    <td>author:<input type="text" name="author" value="<%= author%>" class="form-control"></td>
                </tr>
            </div>
            <div class="form-group">
                <tr>
                    <td>price:<input type="text" name="price" value="<%= price%>" class="form-control"></td>
                </tr>
            </div>

            <tr>
                <td><input type="submit" value="修改数据" class="btn btn-success"></td>
            </tr>

        </form>
    </table>
</div>
</body>
</html>