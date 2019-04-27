<%--
  User: HH
  Date: 2019/4/24
  Time: 14:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录</title>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">登录</div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="userName">用户名</label>
                    <input class="form-control" id="userName" type="text" placeholder="Name" name="name">
                </div>
                <div class="form-group">
                    <label for="userPwd">密码</label>
                    <input class="form-control" id="userPwd" type="password" placeholder="Password" name="password">
                </div>
                <a class="btn btn-primary btn-block loginBtn" href="javascript:">登录</a>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="register">注册一个账户</a>
                <a class="d-block small" href="forgot-password">忘记密码?</a>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<script>
    $(function() {
        $('.loginBtn').on('click', function() {
            $.post('login_do', $('form').serialize(), function(data) {

                switch (data) {
                    case "2":
                        alert('不存在该账号');
                        $(" #userName").val("");
                        $(" #userPwd").val("");
                        break;
                    case "3":
                        alert('密码错误');
                        $(" #userPwd").val("");
                        break;
                    case "1":
                        location.href = '../main/index';
                        break;
                    case "0":
                        alert('登录失败');
                        break;
                    default:
                        alert("未知错误");
                        break;
                }
            })
        })
    })
</script>
</body>

</html>