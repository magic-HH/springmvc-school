<%@ page import="com.hh.model.msgs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hh.model.foods" %><%--
  User: HH
  Date: 2019/4/25
  Time: 19:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<foods> dataset = ( ArrayList<foods>)request.getAttribute("dataset");
    String level = session.getAttribute("level").toString();
    String orderid = request.getAttribute("orderid").toString();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户管理</title>
    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../vendor/chart.js/Chart.min.js"></script>
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="../js/sb-admin.min.js"></script>
    <script src="../js/sb-admin-datatables.min.js"></script>
    <script src="../js/sb-admin-charts.min.js"></script>

    <link rel="stylesheet" href="../css/index.css">
    <script src="../js/template-web.js"></script>
    <script src="../js/index.js"></script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="change_msg">用户管理</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="修改用户信息">
                <a class="nav-link" href="change_msg">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">修改信息</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="查看订单">
                <a class="nav-link" href="vieworder">
                    <i class="fa fa-fw fa-area-chart"></i>
                    <span class="nav-link-text">查看订单</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="评价">
                <a class="nav-link" href="msgShow">
                    <i class="fa fa-commenting-o" aria-hidden="true"></i>
                    <span class="nav-link-text">消息显示</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="评价">
                <a class="nav-link" href="comment">
                    <i class="fa fa-fw fa-table"></i>
                    <span class="nav-link-text">评价</span>
                </a>
            </li>
            <%if(!level.equals("0")){
                out.print("  <li class=\"nav-item\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"评价\">\n" +
                        "                <a class=\"nav-link\" href=\"viewProduct\">\n" +
                        "                    <i class=\"fa fa-fw fa-table\"></i>\n" +
                        "                    <span class=\"nav-link-text\">查看商品</span>\n" +
                        "                </a>\n" +
                        "            </li>");
            }%>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-fw fa-bell"></i>
                    <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">News !</span>
            </span>
                    <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
                </a>
                <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">新消息:</h6>
                    <div class="msg"></div>
                    <script type="text/html" id="newMsg">
                        {{each data val key}}
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i></strong>
              </span>
                            <span class="small float-right text-muted">{{ val.time }}</span>
                            <div class="dropdown-message small">{{ val.text }}</div>
                        </a>
                        {{/each}}
                    </script>

                    <a class="dropdown-item small" href="msgShow">显示全部消息</a>
                </div>
            </li>
            <li style="color: #fff;line-height: 45px;margin-right: 10px">
                ${name}
            </li>
            <li class="nam-item">
                <div class="head-portrait">
                    <%--                    <img src="<%=maps.get("img")%>">--%>
                    <img src="http://school-course-h.oss-cn-hangzhou.aliyuncs.com/img/head.jpg">
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>注销</a>
            </li>
        </ul>
    </div>
</nav>
<div class="content-wrapper">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="change_msg">用户管理</a>
            </li>
            <li class="breadcrumb-item active" style="color: #c12e2a">订单状态更改</li>
        </ol>
    </div>
    <div class="container-fluid userMsg">
        <div class="row justify-content-md-center usermsg">


            <table class="table table-bordered col-8">
                <tr>
                    <td colspan="5"><h2>订单状态更改</h2></td>
                </tr>
                <tbody>
                <tr>
                    <th class="align-middle">订单编号</th>
                    <th class="align-middle">当前状态</th>
                    <th class="align-middle">备选框</th>
                    <th class="align-middle">确认框</th>
                </tr>
                <%for(foods i:dataset){%>
                <tr>
                    <form action="changeFoodState">
                        <input type="hidden" name="orderid" value="<%=orderid%>">
                        <input type="hidden" name="foodsid" value="<%=i.getFoodsid()%>">
                    <td class="align-middle"><%=i.getFoodsid()%></td>
                        <%if(level.equals("0")){%>
                    <%switch(i.getState()){
                        case "1":
                            out.print("<td class=\"align-middle\">等待商家确认中..</td>");
                            out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                        case "2":out.print("<td class=\"align-middle\">订单被商家拒绝</td>");
                            out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                        case "3":out.print("<td class=\"align-middle\">订单已被商家接受</td>");
                            out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                        case "4":out.print("<td class=\"align-middle\">订单已被商家送出</td>");
                            out.print("<td class=\"align-middle\"><select name=\"orderget\">\n" +
                                    "                        <option value=\"get\">确认收货</option>\n" +
                                    "                        <option value=\"no\">未收货</option>\n" +
                                    "                    </select></td>");break;
                        case "5":out.print("<td class=\"align-middle\">订单已收到</td>");
                            out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                        case "6":break;
                    }%>
                        <%}else{

                            switch(i.getState()){
                                case "1":
                                    out.print("<td class=\"align-middle\">等待商家确认中..</td>");
                                    out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                                case "2":out.print("<td class=\"align-middle\">订单被商家拒绝</td>");
                                    out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                                case "3":out.print("<td class=\"align-middle\">更改订单状态</td>");
                                    out.print("<td class=\"align-middle\"><select name=\"ordersend\"><option value=\"send\">已发货</option><option value=\"not\">未收货</option> </select></td>");break;
                                case "4":out.print("<td class=\"align-middle\">订单已被商家送出</td>");
                                    out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                                case "5":out.print("<td class=\"align-middle\">订单已收到</td>");
                                    out.print("<td class=\"align-middle\">暂无备选选项</td>");break;
                                case "6":break;
                            }
                        }%>
                    <td class="align-middle"><button class="btn btn-group" type="submit">确认</button></td>

                    </form>
                </tr>
                <%}%>
                </tbody>

            </table>

        </div>

        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                    <small>8组-<a href="https://www.afra-x.com" target="_blank" title="8组">制作</a></small>
                </div>
            </div>
        </footer>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">确认退出？</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">点击注销</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var isShow = true;
    var clickTime = 1;

    function changeState() {
        var v = document.getElementById("passwordShow");
        if (isShow) {
            if (clickTime == 1) {
                v.value = "输入新密码";
            }
            v.type = "text";
            isShow = false;
            clickTime += 1;
        } else {
            v.type = "password";
            isShow = true;
            clickTime += 1;
        }
    }

    function edit() {
        $('#myModal').modal('show');
    }

    function confirms() {
        alert("ti shi");
    }

    // $('#btn-sm11').on('click', function(e){
    //     console.log("bhhh");
    // })
    function jumpToMsg() {
        var aJump = document.getElementById("jumpPage");
        aJump.innerText = "点击转跳:";
    }
    function jumpToDo() {
        var jumpPut = document.getElementById("jumpPageInput");
        var urlData = jumpPut.value;
        location.href="msgShow?page="+(urlData-1);
    }
</script>
<style>
    form {
        position: relative;
    }

    .fa-spinner {
        display: none;
        position: absolute;
        right: 155px;
        bottom: 45px;
    }
</style>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">确认修改？</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>验证码</label>
                    <input id="putcaptcha" type="text" name="code" class="form-control">
                    <div style="text-align: right;margin-top: 10px ">
                        <button id="getcaptcha" class="btn btn-success getcaptcha" href="javascript:">获取验证码</button>
                        <i class="fa fa-spinner fa-pulse"></i>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="$('#myModal').modal('hide');">取消</button>
                <button type="button" class="btn btn-primary" onclick="save()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    function save() {
        $('#myModal').modal('hide');
        $.ajax({
            dataType: "json",
            url: "change_msg_do",
            data: {
                'id': $("#idShow").val(),
                'name': $("#nameShow").val(),
                'password': $("#passwordShow").val(),
                'local': $("#addressShow").val(),
                'email': $("#emailShow").val(),
                'code': $("#putcaptcha").val()
            },
            success: function (data) {
                if (data == 1) {
                    alert("保存成功!");
                    location.reload();
                } else if (data == '0') {
                    alert("失败!");
                } else if (data == '2') {
                    var getcaptcha = document.getElementById("getcaptcha");
                    getcaptcha.innerText = "验证码错误";
                }
            }
        });

    }

    $(function () {
        $('.getcaptcha').on('click', function () {
            $('.fa-spinner').css('display', 'inline-block');
            $.ajax({
                dataType: "json",
                url: "getCaptcha",
                data: {
                    'email': $("#emailShow").val()
                },
                success: function (data) {
                    $('.fa-spinner').css('display', 'none');
                    if (data == '0') {
                        var getcaptcha = document.getElementById("getcaptcha");
                        getcaptcha.innerText = "获取失败";
                    } else {
                        var getcaptcha = document.getElementById("getcaptcha");
                        getcaptcha.innerText = "获取成功";
                    }
                }
            });
        })
    })

</script>
</body>

</html>

