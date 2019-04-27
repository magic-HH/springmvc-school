<%--
  User: HH
  Date: 2019/4/21
  Time: 19:39
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.hh.util.Sql_tool" %>

<%@page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    Statement stmt = Sql_tool.getCon().createStatement();
    ResultSet data_1 = stmt.executeQuery("select * from user where user.name='"+name+"' and user.password ='"+password+"'");
    if(data_1.next())
    {
        session.setAttribute("user",name);
        response.sendRedirect("back/index.jsp");
    }else{
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>logining...</title>
</head>
<body>

</body>
</html>
