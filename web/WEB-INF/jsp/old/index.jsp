<%@page import="com.hh.model.u_f" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@page import="com.hh.util.Sql_tool" %>
<!-- JAVA 代码 -->
<%
    //Statement stmt =  Sql_tool.getCon().createStatement();
//ResultSet data_1 =  stmt.executeQuery("select * from u_f");
//ResultSet data_1 = (ResultSet)request.getAttribute("data_1");
    ArrayList<u_f> books = (ArrayList<u_f>) request.getAttribute("books");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>hh`s title</title>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div class="container">
    <table class="table table-bordered table-hover">
        <tr>
            <th>Id</th>
            <th>价格</th>
            <th>名称</th>
            <th>作者</th>
            <th><a class="btn btn-success" href="./add">添加</a></th>
        </tr>
        <% for (u_f b : books) {
        %>
        <tr>
            <td><%= b.getId() %>
            </td>
            <td><%= b.getPrice() %>
            </td>
            <td><%= b.getName() %>
            </td>
            <td><%= b.getAuthor() %>
            </td>
            <td><a class="btn btn-primary" href="change?id=<%= b.getId() %>">修改</a>
                <a onclick="del(<%=b.getId() %>)" class="btn btn-info" href="javascript:;">删除</a>
                <button class="btn btn-success" onclick="edit(<%=b.getId() %>)">ajax</button>
            </td>

        </tr>
        <%} %>
    </table>
</div>
<script type="text/javascript">
    function del(id) {
        if (confirm("你确定删除吗？" + id)) {
            location.href = "./del?id=" + id;
            //window.navigate("delete.jsp?id="+id);
        } else {
        }
    }
    function edit(id) {
        $.ajax({
            dataType:"json",
            url:"edit_ajax",
            data:{
                'id':id
            },
            success:function (data) {
                // alert(data.name);
                $("#putId").attr("value",data.id);

                $("#putName").attr("value",data.name);

                $("#putAuthor").attr("value",data.author);

                $("#putPrice").attr("value",data.price);
            }
        });
        $('#myModal').modal('show');
    }

</script>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改数据</h4>
            </div>
            <div class="modal-body">
                <form action="change_do">
                    <div class="form-group">
                        <label>ID</label>
                        <input id="putId" type="text" name="id"  class="form-control" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>书名</label>
                        <input id="putName" type="text" name="name"  class="form-control">
                    </div>
                    <div class="form-group">
                        <label>作者</label>
                        <input id="putAuthor" type="text" name="author"  class="form-control">
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input id="putPrice" type="text" name="price"  class="form-control">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"  onclick="$('#myModal').modal('hide');">取消</button>
                <button type="button" class="btn btn-primary" onclick="save()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    function save() {
        $('#myModal').modal('hide');
        $.ajax({
            dataType:"json",
            url:"save_ajax",
            data:{
                'id':$("#putId").val(),
                'name':$("#putName").val(),
                'author':$("#putAuthor").val(),
                'price':$("#putPrice").val()
            },
            success:function (data) {
               if(data==1){
                alert("保存成功!");
               location.reload();
               }
               else{
                   alert("失败!");
               }
            }
        });

    }


</script>
</body>
</html>