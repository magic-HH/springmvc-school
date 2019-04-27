<%--
  User: HH
  Date: 2019/4/24
  Time: 12:52
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
    <title>注册账户</title>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
    <style>
        .form-row .col-md-6{
            position: relative;
        }
        .fa-spinner{
            display: none;
            position: absolute;
            left: 210px;
            top: 15px;
        }
    </style>
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">注册帐户</div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="userName">姓名</label>
                    <input class="form-control" id="userName" type="text" placeholder="name" name="name">
                </div>
                <div class="form-group">
                    <label for="userEmail">邮箱</label>
                    <input class="form-control" id="userEmail" type="email" placeholder="email" name="email">
                </div>
                <div class="form-group">
                    <label for="userEmail">验证码</label>
                    <div class="form-row">
                        <div class="col-md-6">
                            <input class="form-control" id="userCode" type="text" name="code" placeholder="verification code">
                        </div>
                        <div class="col-md-6" >
                            <input class="btn btn-success col-md-8" id="codeBtn" type="button" value="发送邮箱验证码"
                                   name="password2" href="javascript:" onclick="sendmsg()">

                            <i class="fa fa-spinner fa-pulse"></i>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-row">
                        <div class="col-md-6">
                            <label for="userPwd1">密码</label>
                            <input class="form-control" id="userPwd1" type="password" placeholder="password" name="password1">
                        </div>
                        <div class="col-md-6">
                            <label for="userPwd2">确认密码</label>
                            <input class="form-control" id="userPwd2" type="password" placeholder="confirm password"
                                   name="password2">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="radio" name="level" value="0">用户注册
                    <input type="radio" name="level" value="1">商家注册
                </div>
                <a class="btn btn-primary btn-block registerBtn" href="javascript:">注册</a>
            </form>
            <div class="text-center">
                <a class="d-block small mt-3" href="login">有账号，直接登录</a>
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
    function sendmsg(){
        $('.fa-spinner').css('display', 'inline-block');
        $.ajax({
            dataType:"json",
            url:"getCaptcha",
            data:{
                'email':$('#userEmail').val()
            },
            success:function (data) {
                if (data=="1"){
                    $('.fa-spinner').css('display', 'none');
                    var getcaptcha =document.getElementById("codeBtn");
                    getcaptcha.value="获取成功";
                } else{
                    var getcaptcha =document.getElementById("codeBtn");
                    getcaptcha.value="获取失败";
                }

            }
        });
    }
    $(function () {
        $('#userPwd2').blur(function () {
            var userPwd1 = $('#userPwd1').val();
            var userPwd2 = $('#userPwd2').val();
            if (userPwd1 != userPwd2) {
                alert('密码不一致,请重新输入');
            }
        })
        $('#userPwd2').blur(function () {
            var userPwd1 = $('#userPwd1').val();
            var userPwd2 = $('#userPwd2').val();
            if (userPwd1 != userPwd2) {
                alert('密码不一致,请重新输入');
            }
        })
        $('.registerBtn').on('click', function () {
            $.post('register_do', $('form').serialize(), function (data) {
                switch(data)
                {
                    case '0':
                        alert('该用户名已存在');
                        $(" #userName").val("");
                        break;
                    case '1':
                        alert('登录成功');
                        location.href = '../main/index';<!--后面更改文件的导向 -->
                        break;
                    case '2':
                        alert('验证码错误');
                        $("#userCode").val("");
                        break;
                    case '3':
                        alert('请选择用户类别');
                        break;
                    default:
                        alert('未知错误');
                }

            })
        })
    })
</script>
</body>

</html>