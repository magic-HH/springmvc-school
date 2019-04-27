<%--
  User: HH
  Date: 2019/4/24
  Time: 14:51
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
    <title>重置密码</title>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
    <style>
        form{
            position: relative;
        }
        .fa-spinner{
            display: none;
            position: absolute;
            right: 155px;
            bottom: 12px;
        }
    </style>
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">重置密码</div>
        <div class="card-body">
            <div class="text-center mt-4 mb-5">
                <h4>忘记你的密码?</h4>
                <p>输入您的电子邮件地址，我们将重置密码</p>
            </div>
            <form>
                <div class="form-group">
                    <input class="form-control" id="userName" type="text" aria-describedby="emailHelp" placeholder="Enter your name" name="name">
                </div>
                <div class="form-group">
                    <input class="form-control" id="userEmail1" type="email" aria-describedby="emailHelp" placeholder="Enter email address" name="email">
                </div>
                <input class="btn btn-primary btn-block resetPwd" type="button" href="javascript:" value="重置密码">
                <i class="fa fa-spinner fa-pulse"></i>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="register">注册一个新账户</a>
                <a class="d-block small" href="login">去登录</a>
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

        $('.resetPwd').on('click', function() {
            $('.fa-spinner').css('display', 'inline-block');
            $.post('forgot-password-do', $('form').serialize(), function (data) {
                $('.fa-spinner').css('display', 'none');
                switch(data)
                {   case "0":
                        alert("未知错误")
                        break;
                    case '1':
                        alert("密码重置成功,请前往邮箱查看！");
                        location.href="login";
                        break;
                    case "3":
                        alert("输入信息有误");
                        break;
                    case "2":
                        alert("用户不存在");
                        break;
                    default:
                        alert('未知错误');
                        break;
                }
            })
        })
    })
</script>
</body>

</html>

